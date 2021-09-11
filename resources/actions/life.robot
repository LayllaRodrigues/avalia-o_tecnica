*** Settings ***
Documentation       Inicia cotação de life

Resource                        ${EXECDIR}/resources/base.robot
Resource                        ${EXECDIR}/resources/Steps.robot

Library     SeleniumLibrary

***Variables***

${PersonName}   John Macquaire


*** Keywords ***

Nova sessão
    Open Browser                       https://www.youse.com.br/           chrome

Encerra sessão
    Capture Page Screenshot
    Close All Browsers

Selecionando cotar life
    Click Element                     css:a[class="Button__PrimaryButton-rxse9u-0-a egKmLG"][href="/life/order/new"]

Autorizando cookies
    Wait Until Element Is Visible       css:button[class="sc-bdnxRM jvCTkj primary"]
    Click Element                       css:button[class="sc-bdnxRM jvCTkj primary"]

Informando nome do segurado
    Wait Until Element Is Visible       css:input[tabindex="1"]
    Click Element                       css:input[tabindex="1"]
    Input text                          css:input[tabindex="1"]         ${PersonName}


