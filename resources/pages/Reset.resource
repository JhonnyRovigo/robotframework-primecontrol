*** Settings ***
Documentation     Keywords da página de recuperação
Library           Browser

*** Keywords ***

Recupera senha
    [Arguments]    ${email}
    Click    css=a[href='/app']
    Click    css=a[href='/app/resetsenha']
    Fill Text    css=input[type="email"]    ${email}
    Click    css=button:has-text("Enviar")

Preencher nova senha
    [Arguments]    ${senha}
    Fill Text    css=input[type="password"]                                      ${senha}
    Click        text=Save


    

