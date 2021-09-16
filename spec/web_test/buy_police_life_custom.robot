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
    Informando genero do segurado
    Informando status civil
    Informando profissão
    Informando media salarial
    Continuar
    Selecionando personalizar plano
    Selecionando LMI
    Validando que selecionei o limite total de LMI
    Indo escolher assistências
    Escolhendo assistência 1
    # Escolhendo assistência 2
    Preenchendo meus dados






    Informando nome completo do segurado
    Informando CPF do segurado 
    Informando genero 
    Informando data de nascimento do segurado
    Informando nacionalidade do segurado
    Informando CEP do segurado
    Informando conformidade para receber noticias youse
    Próximo passo
    Informando primeiro beneficiario e porcentagem
    Próximo passo
    Preenchendo cartão de crédito                   ${card}
    Preenchendo data de validade do cartão          ${validateCard}
    Preenchendo cvv                                 ${cvv}
    Preenchendo nome do dono do cartão              ${PersonName}


