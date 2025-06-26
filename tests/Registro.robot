*** Settings ***
Documentation            fazer logins na web

Library           Browser
Resource          ../resources/base.resource

Test Setup        Start session
Test Teardown     Take Screenshot   


*** Test Cases ***
Realizar Registro com sucesso 
    ${account}    Get Fake Account

    Submit registro form     ${account["email"]}   ${account["senha"]}


