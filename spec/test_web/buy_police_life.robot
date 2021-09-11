***Settings***
Documentation                   Suíte de testes de compra de seguro life
Resource                        ${EXECDIR}/resources/base.robot
Resource                        ${EXECDIR}/resources/actions/life.robot 
Resource                        ${EXECDIR}/resources/Steps.robot

Library     SeleniumLibrary


Test Setup      Nova sessão
Test Teardown   Encerra sessão


***Test Cases***

Cotando life    
    Set Selenium Timeout                        30s
    Autorizando cookies
    Selecionando cotar life
    Informando nome do segurado  
    Informando email do segurado
    Informando phone do segurado
    Informando bday do segurado
    Informando sexo do segurado

   


   












