*** Settings ***
Documentation       MARVEL API Character Search  

Library               RequestsLibrary
Library               Collections     
Resource           ${EXECDIR}/resources/Base.robot
Resource           ${EXECDIR}/resources/Steps.robot

*Test Cases*
Searching Characters
    Searching Characters

Validating number of characters returned
    Validating returned quantity

Validating status codes 
    Checking status code         ${expected_status}






              
     