*** Settings ***
Documentation       Busca de personagens na API MARVEL  

Library               RequestsLibrary
Library               Collections     
Resource            ../resources/Base.robot
Resource            ../resources/Steps.robot


*Test Cases*
Pesquisando personagens
    Pesquisando Personagens
  
Verificando status code 

    Verificando status code                 ${STATUS_ESPERADO}           