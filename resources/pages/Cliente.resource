*** Settings ***
Documentation     fazer o login no sistema

Library        Browser


*** Keywords ***

Preencher formulário de cliente
    [Arguments]    ${cliente}

    # Preencher Nome completo
    Fill Text    css=div.col-md-9 input.form-control        ${cliente["nome"]}

    # Preencher Telefone
    Fill Text    css=input[type="tel"]                      ${cliente["telefone"]}

    # Preencher E-mail
    Fill Text    css=input[type="email"]                    ${cliente["email"]}

    # Preencher CEP
    Fill Text    xpath=//label[text()="CEP:"]/following::input[1]    ${cliente["cep"]}

    # Preencher Número da residência
    Fill Text    xpath=//label[text()="Número da residência:"]/following::input[1]    ${cliente["numero"]}

    # Preencher Endereço
    Fill Text    xpath=//label[text()="Endereço:"]/following::input[1]    ${cliente["endereco"]}

    # Preencher Complemento
    Fill Text    xpath=//label[text()="Complemento:"]/following::input[1]    ${cliente["complemento"]}

    # Selecionar País
    Select Options By    css=select.form-control    value    ${cliente["pais"]}

    # Selecionar Gênero
    ${genero}=    Set Variable    ${cliente["genero"]}
    Run Keyword If    '${genero}' == 'Masculino'    Click    xpath=//input[@type='radio' and @value='masculino']
    Run Keyword If    '${genero}' == 'Feminino'     Click    xpath=//input[@type='radio' and @value='feminino']
    Run Keyword If    '${genero}' == 'Outros'       Click    xpath=//input[@type='radio' and @value='outros']

    # Selecionar Ferramentas
    FOR    ${ferramenta}    IN    @{cliente["ferramentas"]}
        Run Keyword If    '${ferramenta}' == 'Robot Framework'       Click    xpath=//input[@type='checkbox' and @value='robot']
        Run Keyword If    '${ferramenta}' == 'Selenium WebDriver'    Click    xpath=//input[@type='checkbox' and @value='selenium']
        Run Keyword If    '${ferramenta}' == 'Cypress'               Click    xpath=//input[@type='checkbox' and @value='cypress']
        Run Keyword If    '${ferramenta}' == 'Appium'                Click    xpath=//input[@type='checkbox' and @value='appium']
        Run Keyword If    '${ferramenta}' == 'Protractor'            Click    xpath=//input[@type='checkbox' and @value='protractor']
    END

    
    Upload File By Selector    css=#image-upload    ${CURDIR}/teste.png
    
    