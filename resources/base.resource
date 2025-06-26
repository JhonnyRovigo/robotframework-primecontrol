*** Settings ***
Library    Browser
Library    libs/Account.py
Library    libs/Cliente.py
Library    libs/MailSlurp.py

Resource   pages/Login.resource
Resource   pages/Registro.resource
Resource   pages/Cliente.resource
Resource   pages/Reset.resource 

*** Keywords ***
Start Session
    New Browser    chromium    headless=False    
    New Page       https://challenge.primecontrol.com.br/   