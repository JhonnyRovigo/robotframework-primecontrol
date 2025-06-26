import time, requests, re, html
from bs4 import BeautifulSoup

API_KEY  = "7725ca6f6e180cc586a9570e56a167cd3f64d019408fdc3a7b1739444b3356af"
BASE_URL = "https://api.mailslurp.com"
HEADERS  = {"x-api-key": API_KEY}
PATTERN  = r"https?://[^\s'\"<>]+/auth/action\?[^'\"\s<>]+"

def esperar_email_com_link_de_reset(email, timeout=180, interval=5):
    # 1) pegar inbox_id
    inbox = next(
        i["id"] for i in requests.get(f"{BASE_URL}/inboxes", headers=HEADERS).json()
        if i["emailAddress"].lower() == email.lower()
    )
    # 2) marca todos os existentes
    seen = {e["id"] for e in requests.get(f"{BASE_URL}/inboxes/{inbox}/emails", headers=HEADERS).json()}

    start = time.time()
    while time.time() - start < timeout:
        all_emails = requests.get(f"{BASE_URL}/inboxes/{inbox}/emails", headers=HEADERS).json()
        # 3) filtra só os novos
        new = [e for e in all_emails if e["id"] not in seen]
        if new:
            eid  = sorted(new, key=lambda x: x["createdAt"], reverse=True)[0]["id"]
            mail = requests.get(f"{BASE_URL}/emails/{eid}", headers=HEADERS).json()
            text = (mail.get("body") or "") + (mail.get("html") or "")
            # 4) tenta regex no texto
            m = re.search(PATTERN, text.replace("\n", " "))
            if not m:
                # fallback: busca hrefs no HTML decodificado
                soup = BeautifulSoup(mail.get("html",""), "html.parser")
                for a in soup.find_all("a", href=True):
                    if "resetPassword" in a["href"]:
                        m = re.search(PATTERN, a["href"])
                        if m: break
            if m:
                return html.unescape(m.group(0))
        seen = {e["id"] for e in all_emails}
        time.sleep(interval)

    raise TimeoutError("Nenhum e-mail de reset recebido")
