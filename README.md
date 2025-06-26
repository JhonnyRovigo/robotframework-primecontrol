Suíte de Testes em Robot Framework para PrimeControl
Este projeto contém automação de testes para o sistema PrimeControl, desenvolvido com Robot Framework utilizando uma Browser Library (baseada em Playwright).

📋 Cenários de Teste
A suíte cobre os seguintes casos de uso:


## 📋 Cenários de Testes

| Atividade    | Descrição                          |
|--------------|------------------------------------|
| CT001         Criar uma nova conta com sucesso    |
| CT002        | Realizar login com sucesso         |
| CT003        | Cadastrar cliente com sucesso      |
| CT004        | Realizar logout com sucesso        |
| CT005        | Recuperar senha com sucesso        |

🚀 Pré-requisitos
Para executar os testes, você precisa:
Python 3.8+
Node.js (necessário para Playwright/Browser Library)
Um ambiente virtual (recomendado)
Git (opcional, para versionamento)



📦 Dependências
Instale as dependências específicas em requisitos.txt:
robotframework : Núcleo do Robot Framework
robotframework-browser : Navegador de Biblioteca (Dramaturgo)
robotframework-requests : Para interações HTTP (ex.: MailSlurp)
faker : Para geração de dados fictícios
requests , bs4 (BeautifulSoup): Para remoção de links de e-mails
Instalar as dependências:

pip install -r requirements.txt



⚙️ Configurações Especiais
💾 Faker para Dados de Teste
A biblioteca Faker é usada nos arquivos Registro.robot e Cadastro Cliente.robot para gerar dados realistas. Não é necessária nenhuma configuração adicional além de instalar o faker via requisitos.txt .

✉️ MailSlurp para Recuperação de Senha
Para testar a recuperação de senha (em Recupera Senha.robot ):
Crie uma conta gratuita no MailSlurp .
Gere uma caixa de entrada e copie o endereço de e-mail (ex.: XXXX@mailslurp.biz ).

Edite a primeira linha do caso de teste em Recupera Senha.robot :
${email}=    Set Variable    seu_inbox_id@mailslurp.biz


Copie sua chave API do painel do MailSlurp e atualize libs/MailSlurp.py :
API_KEY = "SUA_CHAVE_AQUI"


🧪 Executando os Testes
Na raiz do projeto, execute:
robot --outputdir resultados tests
Os relatórios ( log.html , report.html ) serão gerados na pasta resultados/ .
Para visualizar o relatório:
Windows : inicie resultados/report.html
macOS/Linux : abra resultados/report.html



No seu README, você pode aplicar isso na seção de estrutura do projeto, por exemplo:

```markdown
## 📂 Estrutura do Projeto

```plaintext
    ├── .vscode/                     # Configurações do VS Code (ex.: debug)
    ├── browser/                     # Arquivos gerados pela Browser Library
    │   ├── screenshot/              # Capturas de tela dos testes
    │   ├── traces/                  # Arquivos de trace do Playwright
    ├── libs/                        # Bibliotecas Python personalizadas
    │   ├── Account.py
    │   ├── Cliente.py
    │   ├── MailSlurp.py
    ├── resources/                   # Recursos e keywords compartilhados
    │   ├── base.resource            # Configurações e keywords comuns
    │   ├── Reset.resource           # Keywords para recuperação de senha
    │   └── pages/components/        # Objetos de página e componentes reutilizáveis
    ├── resultados/                  # Relatórios dos testes
    ├── tests/                       # Arquivos de teste (.robot)
    │   ├── Cadastro Cliente.robot
    │   ├── Login.robot
    │   ├── Recupera Senha.robot
    ├── .gitignore
    ├── README.md
    └── requirements.txt


📝 Observações
Certifique-se de instalar todas as dependências antes de executar os testes.
Use um ambiente virtual para evitar conflitos com pacotes Python globais.
Para depuração, utilize os arquivos de trace em browser/traces/ ou capturas de tela em browser/screenshot/ .
