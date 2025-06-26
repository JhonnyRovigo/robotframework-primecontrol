*** Settings ***
Documentation            fazer logins na web

Library           Browser
Resource          ../resources/base.resource

Test Setup        Start session
Test Teardown     Take Screenshot   


*** Test Cases ***
Realizar Login com sucesso 
    Submit login form    jhonny.santos@primecontrol.com.br    05119711Jho*   


