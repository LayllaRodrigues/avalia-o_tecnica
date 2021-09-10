*** Settings ***
Documentation       Filters comics of a specific character in the MARVEL API  

Library               RequestsLibrary
Library               Collections     
Resource           ${EXECDIR}/resources/Base.robot
Resource           ${EXECDIR}/resources/Steps.robot

*Test Cases*
Listing comics of a specific character
    Listing a specific comic

Validating status codes
    Validating comics status code       ${expected_status}

Validating if there was only one character's comics return
    Checking comics returns

Checking filtered character
    Checking if the filter returned comics about Wolverine