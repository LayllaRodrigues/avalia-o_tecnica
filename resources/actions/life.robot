*** Settings ***
Documentation       Inicia cotação de life

Resource                        ${EXECDIR}/resources/base.robot
Resource                        ${EXECDIR}/resources/Steps.robot

Library     SeleniumLibrary

***Variables***

${PersonName}           John Macquaire
${PersonEmail}          teste@teste.com.br
${PersonPhone}          01198765434
${PersonBday}           11091980


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

Informando email do segurado
    Wait Until Element Is Visible       css:input[tabindex="2"]
    Click Element                       css:input[tabindex="2"]
    Input text                          css:input[tabindex="2"]          ${PersonEmail}


Informando phone do segurado
    Wait Until Element Is Visible       css:input[tabindex="3"]
    Click Element                       css:input[tabindex="3"]
    Input text                          css:input[tabindex="3"]          ${PersonPhone}

Informando bday do segurado
    Wait Until Element Is Visible       css:input[tabindex="4"]
    Click Element                       css:input[tabindex="4"]
    Input text                          css:input[tabindex="4"]          ${PersonBday}
   

Informando genero do segurado
    Click Element                       css:label[class="radio-button__fake-radio"][for="life_order_flow_advisor_review_insured_person_attributes_gender_male"]

Informando status civil
    Click Element                       css:label[class="radio-button__fake-radio"][for="life_order_flow_pricing_requirements_insured_person_attributes_has_mate_not_informed"]
 