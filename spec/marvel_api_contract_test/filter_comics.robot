*** Settings ***
Documentation       Filtra comics de um personagem especifico na API MARVEL  

Library               RequestsLibrary
Library               Collections     
Resource           ${EXECDIR}/resources/Base.robot
Resource           ${EXECDIR}/resources/Steps.robot

*Test Cases*
Listando comics de um personagem especifico
    Listando comic especifico

Validando status code após filtro
    Validando status code do filtro de comics       ${STATUS_ESPERADO} 

Validando se houve retorno de comics apenas de um personagem
    Verificando retorno das comics

Verificando personagem filtrado
    Verificando se filtro retornou comics sobre o Wolverine
