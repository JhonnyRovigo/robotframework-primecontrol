*** Settings ***
Documentation     fazer o login no sistema

Library        Browser

*** Keywords ***

Submit login form
    [Arguments]    ${username}    ${password}  
    
    Click    css=a[href='/app']

    # Preenche os campos de login
    Fill Text    css=input[id=floatingInput]       ${username}    
    Fill Text    css=input[id=floatingPassword]    ${password}
    # Clica no radio button correspondente
    #Click    xpath=//label[@for='${label_for}']
    Click    css=button >> text=Acessar

    # Clica no botão de login
      


    
    