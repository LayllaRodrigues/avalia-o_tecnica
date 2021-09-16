*** Settings ***
Documentation       Inicia cotação de life

Resource                        ${EXECDIR}/resources/base.robot
Resource                        ${EXECDIR}/resources/Steps.robot

Library     SeleniumLibrary


*** Keywords ***

Nova sessão
    Open Browser                     ${url}         chrome

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

Informando profissão
    Click Element                       css:span[tabindex="14"]
    input text                          css:input[class="select2-search__field"]        Analista de desenvolvimento de sistemas
    Wait Until Element Is Visible       css:li[class="select2-results__option select2-results__option--highlighted"]
    Click Element                       css:li[class="select2-results__option select2-results__option--highlighted"]

Informando media salarial
    Click Element                    css:select[id="life_order_flow_advisor_review_insured_person_attributes_salary_range"]                 
    Select From List By Index        css:select[name="life_order_flow_advisor_review[insured_person_attributes][salary_range]"]     3

Continuar
    Click Element                         css:input[value="Continuar"][tabindex="4"]

Selecionando plano
    Wait Until Element Is Visible       css:button[class="button button-highlight preformatted-coverages__button"]
    Click Button                        css:button[class="button button-highlight preformatted-coverages__button"]

Informando nome completo do segurado
    input text          css:input[tabindex="1"]         ${PersonName}

Informando CPF do segurado 
    Input text          css:input[name="life_order_flow_insured_person_data[insured_person_attributes][cpf]"]       ${PersonCPF}

Informando nacionalidade do segurado
    Click Element                       css:select[name="life_order_flow_insured_person_data[insured_person_attributes][nationality]"]
    Select From List By Index           css:select[name="life_order_flow_insured_person_data[insured_person_attributes][nationality]"]      32

Informando CEP do segurado  

    Input text                          css:input[name="life_order_flow_insured_person_data[insured_person_attributes][address_attributes][zipcode]"]       ${CEP}
    Click Element                       css:input[name="life_order_flow_insured_person_data[insured_person_attributes][address_attributes][street]"]
    Input text                          css:input[name="life_order_flow_insured_person_data[insured_person_attributes][address_attributes][number]"]        ${numberAdress}

Informando conformidade para receber noticias youse
    Wait Until Element Is Visible           css:label[class="radio-button__fake-radio"][for="product_consent_false"]
    Click Element                           css:label[class="radio-button__fake-radio"][for="product_consent_false"]

Informando genero 
    click Element                            css:select[name="life_order_flow_insured_person_data[insured_person_attributes][gender]"]
    Select From List By Index                css:select[name="life_order_flow_insured_person_data[insured_person_attributes][gender]"]      1

Próximo passo
    Click Element               css:input[name="commit"]

Informando data de nascimento do segurado
    Wait Until Element Is Visible       css:input[tabindex="6"]
    Click Element                       css:input[tabindex="6"]
    Input text                          css:input[tabindex="6"]          ${PersonBday}

Informando primeiro beneficiario e porcentagem
    Input text                  css:input[id="life_order_flow_beneficiaries_beneficiaries_attributes__name"]                Maria Tereza
    Click Element               css:select[id="life_order_flow_beneficiaries_beneficiaries_attributes__relationship"]
    Select From List By Index   css:select[id="life_order_flow_beneficiaries_beneficiaries_attributes__relationship"]        1
    Input text                  css:input[id="life_order_flow_beneficiaries_beneficiaries_attributes__compensation"]        10000

Preenchendo cartão de crédito
    [Arguments]                                ${card}

    Select Frame                               xpath://*[@id="component-container"]/div/div/div[2]/div[1]/div[1]/label/span[2]/span/iframe
    Wait Until Element Is Visible              css:input[type="tel"][data-type="gsf"][id="encryptedCardNumber"]
    Input Text                                 css:input[type="tel"][data-type="gsf"][id="encryptedCardNumber"]          ${card} 
    Unselect Frame 


Preenchendo data de validade do cartão
    [Arguments]                                 ${validateCard}
    select Frame                                xpath://*[@id="component-container"]/div/div/div[2]/div[1]/div[2]/div[1]/label/span[2]/span/iframe
    Wait Until Element Is Visible               css:input[type="tel"][data-type="gsf"][id="encryptedExpiryDate"]
    Input Text                                  css:input[type="tel"][data-type="gsf"][id="encryptedExpiryDate"]    ${validateCard}
    Unselect Frame            

Preenchendo cvv 
    [Arguments]                                 ${cvv}
    Select Frame                                xpath://*[@id="component-container"]/div/div/div[2]/div[1]/div[2]/div[2]/label/span[2]/span/iframe
    Wait Until Element Is Visible               css:input[type="tel"][data-type="gsf"][id="encryptedSecurityCode"]
    Input Text                                  css:input[type="tel"][data-type="gsf"][id="encryptedSecurityCode"]                    ${cvv}
    Unselect Frame    

Preenchendo nome do dono do cartão
    [Arguments]                                 ${PersonName}
    Input Text                                  css:input[placeholder="Nome como no cartão"]                                             ${PersonName}


Selecionando personalizar plano
    Click Element                               css:input[type="submit"][value="Personalizar"]

Arrastando barra de cobertura
    Click Element                               css:a[data-slider="increase-button"]

Selecionando LMI
    Repeat Keyword    130   Arrastando barra de cobertura       

Validando que selecionei o limite total de LMI
    ${lmi_selecionado}    Get Text    css:div[data-slider="value"]
    ${lmi_máximo}         Get Text    css:span[data-slider-max-range="true"]

    BuiltIn.Set Suite Variable      ${lmi_selecionado}
    BuiltIn.Set Suite Variable      ${lmi_máximo}

    Should Be Equal As Strings      ${lmi_selecionado}        ${lmi_máximo}


Indo escolher assistências
    Click Element                   css:input[type="submit"][value="escolher assistências"]

Escolhendo assistência 1
    Click Element                  css:div[class="switch"][data-switch-toggle="true"][style="touch-action: pan-y; user-select: none; -webkit-user-drag: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);"]
    Click Element                  css:span[class="whenactive"]

    Sleep       3

    Scroll Element Into View        css:div[data-collapsable-trigger="assistance-a-cartao-alimentacao"]

Escolhendo assistência 2
    Click Element                  css:div[class="switch"][data-switch-toggle="true"][style="touch-action: pan-y; user-select: none; -webkit-user-drag: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);"]

Preenchendo meus dados
    Click Element                   css:input[name="commit"][value="preencher meus dados"]