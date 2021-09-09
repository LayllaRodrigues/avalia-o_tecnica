*** Settings ***
Library             RequestsLibrary
Library             Collections
Resource            ./routes/Characters.robot

*Variables*
${ts}           1631150721003   
${apikey}       e9e22f92431df9f73920f281caabb68c     
${hash}         f0b3298fa4957047893445f8d19881b8
${limit}        5
${host}         https://gateway.marvel.com
&{headers}      ts=${ts}    apikey=${apikey}      hash=${hash}      limit=${limit}
${STATUS_ESPERADO}      200


*Keywords*
Pesquisando Personagens

    ${Resposta}            GET   ${host}/${characters}    ${headers} 
    Log                    Resposta: ${Resposta.json()}
    BuiltIn.Set Suite Variable   ${Resposta}

Conferindo status code
    [Arguments]     ${STATUS_ESPERADO}
    Should Be Equal As Strings   ${Resposta.status_code}  ${STATUS_ESPERADO}
    Log             Status Code Retornado: ${Resposta.status_code} -- Status Code Esperado: ${STATUS_ESPERADO}

