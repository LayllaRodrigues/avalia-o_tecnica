*** Settings ***
Library             RequestsLibrary
Library             Collections
Resource            ./routes/Characters.robot
Resource            ./routes/CharacterId.robot
Resource            ./routes/Comics.robot


*Keyword*
Searching Characters
    ${Response}            GET      ${host}${characters}${limit}   
    ...                             ${headers} 
    BuiltIn.Set Suite Variable      ${Response}

Validating returned quantity
    Dictionary Should Contain Item      ${Response.json()["data"]}   limit   5

Checking status code
    [Arguments]     ${expected_status}
    Should Be Equal As Strings   ${Response.status_code}  ${expected_status}
    Log             Status Code Retornado: ${Response.status_code} -- Status Code Esperado: ${expected_status}

Conference status code
    [Arguments]     ${expected_status}
    Should Be Equal As Strings   ${ResponseId.status_code}  ${expected_status}
    Log             Status Code Retornado: ${ResponseId.status_code} -- Status Code Esperado: ${expected_status}

Listing specific character
    ${ResponseId}            GET        ${host}/${characterId}${ID}    
    ...                                 ${headers} 
    BuiltIn.Set Suite Variable          ${ResponseId}

Checking the return of a specific character
    Dictionary Should Contain Item      ${ResponseId.json()["data"]}   count   1

Listing a specific comic
    ${ResponseComics}            GET      ${host}${comics}${limit_comic}   
    ...                                   ${headers} 
    BuiltIn.Set Suite Variable            ${ResponseComics}

Validating comics status code
    [Arguments]     ${expected_status}
    Should Be Equal As Strings   ${ResponseComics.status_code}  ${expected_status}
    Log             Status Code Retornado: ${ResponseComics.status_code} -- Status Code Esperado: ${expected_status}

Checking comics returns
    Dictionary Should Contain Item      ${ResponseComics.json()["data"]}   count   1

Checking if the filter returned comics about Wolverine    
    BuiltIn.Should Contain      ${ResponseComics.json()["data"]["results"][0]}    title     Wolverine Saga (2009) #7