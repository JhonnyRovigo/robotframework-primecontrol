*** Settings ***
Documentation     fazer o login no sistema

Library        Browser

*** Keywords ***

Submit registro form
    [Arguments]    ${username}    ${password}    
    
    Click    css=a[href='/app/novaconta']

    Fill Text    css=input[id=floatingInput]       ${username}    
    Fill Text    css=input[id=floatingPassword]    ${password}
   
    Click    css=button >> text=Criar conta

   
