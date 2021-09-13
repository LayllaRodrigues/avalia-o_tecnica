*** Settings ***
Documentation       Searching for a specific character in the MARVEL API  

Library               RequestsLibrary
Library               Collections     
Resource            ${EXECDIR}/resources/Base.robot
Resource            ${EXECDIR}/resources/Steps.robot

*Test Cases*
Listing specific character
    Listing specific character

Validating status codes
    Conference status code              ${expected_status}

Validating that only one character has returned
    Checking the return of a specific character


