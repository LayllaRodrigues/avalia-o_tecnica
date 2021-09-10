*** Settings ***
Library             RequestsLibrary
Library             Collections
Resource            ./routes/Characters.robot
Resource            ./routes/characterId.robot


*Keyword*
Pesquisando Personagens

    ${Resposta}            GET   ${host}${characters}${limit}   ${headers} 

    Log                   Resposta: ${Resposta.json()}
    BuiltIn.Set Suite Variable   ${Resposta}


Validando quantidade retornada
    Dictionary Should Contain Item      ${Resposta.json()["data"]}   limit   5

Verificando status code
    [Arguments]     ${STATUS_ESPERADO}
    Should Be Equal As Strings   ${Resposta.status_code}  ${STATUS_ESPERADO}
    Log             Status Code Retornado: ${Resposta.status_code} -- Status Code Esperado: ${STATUS_ESPERADO}



Conferindo status code
    [Arguments]     ${STATUS_ESPERADO}
    Should Be Equal As Strings   ${RespostaId.status_code}  ${STATUS_ESPERADO}
    Log             Status Code Retornado: ${RespostaId.status_code} -- Status Code Esperado: ${STATUS_ESPERADO}

Listando personagem especifico
    ${RespostaId}            GET   ${host}/${characterId}${ID}    ${headers} 
    Log                      Resposta: ${RespostaId.json()}
    BuiltIn.Set Suite Variable   ${RespostaId}

Verificando retorno de personagem especifico
    Dictionary Should Contain Item      ${RespostaId.json()["data"]}   count   1




