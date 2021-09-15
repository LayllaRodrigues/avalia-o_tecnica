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
${expected_status}      200
${ID}                   1009368?
${limit_comic}          limit=1
${PersonName}           John Hon Shan
${PersonEmail}          teste2021@teste.com.br
${PersonPhone}          01198765434
${PersonBday}           21081996
${PersonCPF}            123.456.752-09
${CEP}                  04538-133
${numberAdress}         90
${card}                 4111111111111111
${cvv}                  737
${validateCard}         0330
&{headers}              ts=${ts}    apikey=${apikey}      hash=${hash}      
${host}                 https://gateway.marvel.com
${url}                  https://qa.youse.io/
