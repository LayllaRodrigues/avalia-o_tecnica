*** Settings ***
Documentation       Busca de personagens na API MARVEL  

Library               RequestsLibrary
Library               Collections     
Resource            ../resources/Base.robot

*Test Cases*
Pesquisando personagens
    Pesquisando Personagens
  
Validando status code
    Conferindo status code                 ${STATUS_ESPERADO}           