*** Settings ***
Library             RequestsLibrary
Library             Collections
Resource            ./routes/Characters.robot
Resource            ./routes/characterId.robot

*Variables*
${ts}                   1631150721003   
${apikey}               e9e22f92431df9f73920f281caabb68c     
${hash}                 f0b3298fa4957047893445f8d19881b8
${limit}                limit=5
${STATUS_ESPERADO}      200
${ID}                   1009368?

&{headers}      ts=${ts}    apikey=${apikey}      hash=${hash}      

${host}         https://gateway.marvel.com

