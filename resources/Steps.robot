*** Settings ***
Library             RequestsLibrary
Library             Collections
Resource            ./routes/Characters.robot
Resource            ./routes/CharacterId.robot
Resource            ./routes/Comics.robot


*Keyword*
Pesquisando Personagens

    ${Resposta}            GET      ${host}${characters}${limit}   
    ...                             ${headers} 
    BuiltIn.Set Suite Variable      ${Resposta}

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
    ${RespostaId}            GET        ${host}/${characterId}${ID}    
    ...                                 ${headers} 
    BuiltIn.Set Suite Variable          ${RespostaId}

Verificando retorno de personagem especifico
    Dictionary Should Contain Item      ${RespostaId.json()["data"]}   count   1

Listando comic especifico

    ${RespostaComics}            GET      ${host}${comics}${limit_comic}   
    ...                                   ${headers} 
    BuiltIn.Set Suite Variable            ${RespostaComics}

Validando status code do filtro de comics
    [Arguments]     ${STATUS_ESPERADO}
    Should Be Equal As Strings   ${RespostaComics.status_code}  ${STATUS_ESPERADO}
    Log             Status Code Retornado: ${RespostaComics.status_code} -- Status Code Esperado: ${STATUS_ESPERADO}

Verificando retorno das comics
    Dictionary Should Contain Item      ${RespostaComics.json()["data"]}   count   1

Verificando se filtro retornou comics sobre o Wolverine
    BuiltIn.Should Contain      ${RespostaComics.json()["data"]["results"][0]}    title     Wolverine Saga (2009) #7






