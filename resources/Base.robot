{
	"info": {
		"_postman_id": "8016d763-41ad-40c4-baa1-8afa34de8512",
		"name": "Testing Marvel API",
		"schema": "https://schema.getpostman.com/json/collection/v2.1.0/collection.json"
	},
	"item": [
		{
			"name": "Comics",
			"event": [
				{
					"listen": "prerequest",
					"script": {
						"id": "4091b00e-f482-458c-98e7-43354039c66b",
						"type": "text/javascript",
						"exec": [
							""
						]
					}
				},
				{
					"listen": "test",
					"script": {
						"id": "6252af80-4c4b-4fba-8f72-da8d5ba331f5",
						"type": "text/javascript",
						"exec": [
							"pm.test(\"To be Ok\", function(){",
							"    pm.response.to.be.ok",
							"})",
							"",
							"pm.test(\"To Have Status 200\", function(){",
							"    pm.response.to.have.status(200)",
							"})",
							"",
							"pm.test(\"Expect Response status to be equal\", function(){",
							"    pm.expect(pm.response.code).to.be.equal(200)",
							"})",
							"",
							"pm.test(\"Expect Response reason to be OK\", function(){",
							"    pm.expect(pm.response.reason()).to.be.equal(\"OK\")",
							"})",
							"",
							"pm.test(\"Expect Response Time to be less than 2000\", function(){",
							"    pm.expect(pm.response.responseTime).to.be.lessThan(1500)",
							"})"
						]
					}
				}
			],
			"request": {
				"method": "GET",
				"header": [],
				"body": {
					"mode": "raw",
					"raw": ""
				},
				"url": {
					"raw": "http://gateway.marvel.com/v1/public/comics?ts={{ts}}&apikey={{apikey}}&hash={{hash}}",
					"protocol": "http",
					"host": [
						"gateway",
						"marvel",
						"com"
					],
					"path": [
						"v1",
						"public",
						"comics"
					],
					"query": [
						{
							"key": "ts",
							"value": "{{ts}}"
						},
						{
							"key": "apikey",
							"value": "{{apikey}}"
						},
						{
							"key": "hash",
							"value": "{{hash}}"
						}
					]
				}
			},
			"response": []
		},
		{
			"name": "Comic by id - Not Found",
			"event": [
				{
					"listen": "prerequest",
					"script": {
						"id": "7c859a09-0589-422e-9a6e-fa40ad7ab143",
						"type": "text/javascript",
						"exec": [
							""
						]
					}
				},
				{
					"listen": "test",
					"script": {
						"id": "94449d2a-957e-4ead-9051-ee06e7217869",
						"type": "text/javascript",
						"exec": [
							"pm.test(\"Expect Response status to be equal\", function(){",
							"    pm.expect(pm.response.code).to.be.equal(404)",
							"})",
							""
						]
					}
				}
			],
			"request": {
				"method": "GET",
				"header": [],
				"body": {
					"mode": "raw",
					"raw": ""
				},
				"url": {
					"raw": "https://gateway.marvel.com/v1/public/comics/1?ts={{ts}}&apikey={{apikey}}&hash={{hash}}",
					"protocol": "https",
					"host": [
						"gateway",
						"marvel",
						"com"
					],
					"path": [
						"v1",
						"public",
						"comics",
						"1"
					],
					"query": [
						{
							"key": "ts",
							"value": "{{ts}}"
						},
						{
							"key": "apikey",
							"value": "{{apikey}}"
						},
						{
							"key": "hash",
							"value": "{{hash}}"
						}
					]
				}
			},
			"response": []
		},
		{
			"name": "Comic by id - Existing Comic",
			"event": [
				{
					"listen": "prerequest",
					"script": {
						"id": "7c859a09-0589-422e-9a6e-fa40ad7ab143",
						"type": "text/javascript",
						"exec": [
							""
						]
					}
				},
				{
					"listen": "test",
					"script": {
						"id": "5eab08b4-2306-4ca8-9170-954d998881f2",
						"type": "text/javascript",
						"exec": [
							"pm.test(\"Expect Response status to be equal\", function(){",
							"    pm.response.to.be.ok",
							"})",
							"",
							"pm.test(\"Must be Spiderman: Ultimate Spider-Man\", function () {",
							"    pm.expect(pm.response.text()).to.include(\"Ultimate Spider-Man\");",
							"});",
							"",
							"pm.test(\"Size of the Resource must be 1\", function () {",
							"    pm.expect(pm.response.json().data.results.length).to.be.equal(1)",
							"});",
							"",
							"pm.test(\"Size of the Resource\", function () {",
							"    pm.expect(pm.response.json().data.results.length).to.be.equal(1)",
							"});",
							"",
							"pm.test(\"Series must be Ultimate Spider-Man (Spanish Language Edition) (2000 - 2001)\", function () {",
							"    var series_name = pm.response.json().data.results[0].series.name;",
							"    pm.expect(series_name).to.be.equal(\"Ultimate Spider-Man (Spanish Language Edition) (2000 - 2001)\")",
							"});",
							"",
							"",
							"console.log(pm.response.json().data.results[0].series.name)"
						]
					}
				}
			],
			"request": {
				"method": "GET",
				"header": [],
				"body": {
					"mode": "raw",
					"raw": ""
				},
				"url": {
					"raw": "https://gateway.marvel.com/v1/public/comics/21467?ts={{ts}}&apikey={{apikey}}&hash={{hash}}",
					"protocol": "https",
					"host": [
						"gateway",
						"marvel",
						"com"
					],
					"path": [
						"v1",
						"public",
						"comics",
						"21467"
					],
					"query": [
						{
							"key": "ts",
							"value": "{{ts}}"
						},
						{
							"key": "apikey",
							"value": "{{apikey}}"
						},
						{
							"key": "hash",
							"value": "{{hash}}"
						}
					]
				}
			},
			"response": []
		},
		{
			"name": "Characters - Offset Test",
			"event": [
				{
					"listen": "test",
					"script": {
						"id": "b4c65b88-6388-4b20-8b3b-2edd57951135",
						"type": "text/javascript",
						"exec": [
							"pm.test(\"Test limit Parameter\", function(){",
							"    pm.expect(pm.response.json().data.results.length).to.be.equal(80)",
							"});",
							"",
							"pm.test(\"Test Lenght use the Count Parameter\", function(){",
							"    pm.expect(pm.response.json().data.count).to.be.equal(80)",
							"});"
						]
					}
				}
			],
			"request": {
				"method": "GET",
				"header": [],
				"body": {
					"mode": "raw",
					"raw": ""
				},
				"url": {
					"raw": "https://gateway.marvel.com/v1/public/characters?limit=80&offset=200&ts={{ts}}&apikey={{apikey}}&hash={{hash}}",
					"protocol": "https",
					"host": [
						"gateway",
						"marvel",
						"com"
					],
					"path": [
						"v1",
						"public",
						"characters"
					],
					"query": [
						{
							"key": "limit",
							"value": "80"
						},
						{
							"key": "offset",
							"value": "200"
						},
						{
							"key": "ts",
							"value": "{{ts}}"
						},
						{
							"key": "apikey",
							"value": "{{apikey}}"
						},
						{
							"key": "hash",
							"value": "{{hash}}"
						}
					]
				}
			},
			"response": []
		}
	],
	"event": [
		{
			"listen": "prerequest",
			"script": {
				"id": "8b589a09-91bb-4ec1-b767-69ecbf2c9657",
				"type": "text/javascript",
				"exec": [
					"var pubkey = \"e9e22f92431df9f73920f281caabb68c";",
					"var pvtkey = \"949c276ac21dca1cf0c54e87d0b1081ce0531769";",
					"var ts = new Date().getTime();",
					"",
					"pm.environment.set(\"ts\", ts)",
					"pm.environment.set(\"apikey\", pubkey)",
					"",
					"var message = ts+pvtkey+pubkey;",
					"var a = CryptoJS.MD5(message);",
					"pm.environment.set(\"hash\", a.toString())"
				]
			}
		},
		{
			"listen": "test",
			"script": {
				"id": "3c0b0fa5-447c-4cfb-a0db-f0e28db207f9",
				"type": "text/javascript",
				"exec": [
					""
				]
			}
		}
	]
}