*Settings*
Documentation           Ações da rota /characters

*Keywords*
GET five Character
    [Arguments]     ${payload}

    ${response}    GET
    ...            ${API_URL}/v1/public/characters?ts={{ts}}&apikey={{apikey}}&hash={{hash}}&limit=5
    ...            json=${payload}
    ...            headers=${HEADERS}
    ...            expected_status=any

    [return]       ${response}  

# GET Character By Id
#     [Arguments]         ${character_id}

#     ${response}     GET
#     ...             ${API_URL}/characters/${character_id}
#     ...             headers=${HEADERS}
#     ...             expected_status=any

#     [return]        ${response}

# DELETE Character By Id
#     [Arguments]         ${character_id}

#     ${response}     DELETE
#     ...             ${API_URL}/characters/${character_id}
#     ...             headers=${HEADERS}
#     ...             expected_status=any

#     [return]        ${response}