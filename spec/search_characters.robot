*** Settings ***
Documentation       Busca de personagens na API MARVEL  

Library               RequestsLibrary
Library    Collections      

*Variables*
${ts}       1631150721003   
${apikey}   e9e22f92431df9f73920f281caabb68c     
${hash}     f0b3298fa4957047893445f8d19881b8
&{headers}   ts=${ts}    apikey=${apikey}      hash=${hash}

*Test Cases*

Get Personagens

    GET   https://gateway.marvel.com/v1/public/characters?    ${headers}



