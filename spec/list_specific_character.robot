*** Settings ***
Documentation       Busca de personagem especifico na API MARVEL  

Library               RequestsLibrary
Library               Collections     
Resource            ../resources/Base.robot
Resource            ../resources/Steps.robot



*Test Cases*
Listando personagem especifico
    Listando personagem especifico


Validando status code
    Conferindo status code                 ${STATUS_ESPERADO} 

Validando se houve retorno de apenas um personagem
    Verificando retorno de personagem especifico


