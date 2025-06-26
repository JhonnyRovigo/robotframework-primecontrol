*** Settings ***
Documentation       Testa o fluxo de recuperação de senha
Library             Browser
Resource            ../resources/base.resource

Test Setup          Start session
Test Teardown       Take Screenshot

*** Test Cases ***
Fluxo Completo de Recuperação de Senha
    ${email}=       Set Variable    2d3c401f-606b-424e-adff-b301f2e2c37e@mailslurp.biz
    Recupera senha              ${email}
    ${link}=        Esperar email com link de reset    ${email}
    Go To           ${link}
    Preencher Nova Senha    NovaSenha@123
    ${page_text}=    Get Text    css=body
    


