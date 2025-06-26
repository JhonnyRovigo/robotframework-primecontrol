*** Settings ***
Documentation            fazer logins na web

Library           Browser
Resource          ../resources/base.resource

Test Setup        Start session
Test Teardown     Take Screenshot   


*** Test Cases ***
Realizar Cadastro Cliente com sucesso 
    Submit login form                  jhonny.santos@primecontrol.com.br    05119711Jho*    
    Click                              text=Cadastrar Cliente
    ${cliente}                         Get Fake Cliente

    Preencher formulário de cliente    ${cliente}
    Sleep    2
    Click                               css=button >> text=Salvar
