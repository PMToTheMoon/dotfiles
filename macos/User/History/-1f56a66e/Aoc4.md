
None selected 

Skip to content
Using Gmail with screen readers
Conversations
 
0.66 GB of 15 GB used
Terms · Privacy · Program Policies
Last account activity: 2 hours ago
Details

# Api Client Urban Driver #
version : 20220222213700

### URL :###   
https://yolo.sacree.net/login  ->>  https://booking.urban-driver.com/happy/login

## a) Authentification  ##
***POST***


***IN***  
- paramètres:

  - ***email*** : email de l'utilisateur (login)
  - ***password*** : password de l'utilisateur


ex:   
 ```curl "https://yolo.sacree.net/login" -d "login=email@monmail.com&password=XXXXXXXXXXXXXXXXXX" ```

 On récupère un json qui contient un token

 Si ok on aura un message de type

***OUT***
 ```{"token":"XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"}```

 sinon  
    HTTP 401
 ```{"error":"auth error"}```



## b) appel getme ##
recupere les information du client   
***POST***   
***header***   
```authorization: XXXXXXXXXXXXXXXXXXXXXXXXX```     

***IN***  
- paramètres:    
Aucun


ex:   
 ```curl -v "https://yolo.sacree.net/getme"  -H "authorization: eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJzb21lIjoicGF5bG9hZCIsInVzZXIiOiJzYWNyZWVAc2FjcmVlLmNvbSJ9.iRV5igcRLAPasdcb0OSqyhAhQn5eKvwOQ5wGBHRnoFWT-T7LywftdAP9GF3Um7Mr58mhNJDCV8dkqo85aXzeMg" ```

***OUT***  
 On récupère un json de réponse

 Si ok on aura un message de type
 - 3 status différents pour les courses :
  - finish (la course est finie)
  - valid (la course n'est pas fini mais est validé payment ok)
  - waiting_payment_validation (la course n'a pas été payée et est en cours de validation)


 ```
 {
   "user": "me",
   "userid": 789,
   "firstname": "cédric",
   "lastname": "sacree",
   "company": "maplean",
   "mobilea": "xxxxxxxx1",
   "mobileb": "xxxxxxxx2",
   "email": "sacree@sacree.com",
   "emailcopy": "sacree@sacree.tv",
   "promos": {
     "credit": "75.00",
     "code_p": "CODE_PARAIN_SACREE789"
   },
   "billing_address": {
     "id": 12342,
     "addressa": "Société Maplean Service IT2",
     "addressb": "19 rue bargue, 75015 Paris"
   },
   "favorites_persons": [
     {
       "id": 21,
       "firstname": "Malo",
       "lastname": "sacree",
       "mobile": "XXXXXXXXXXX",
       "email": "malo@sacree.tv"
     },
     {
       "id": 22,
       "firstname": "Claire",
       "lastname": "sacree",
       "mobile": "XXXXXXXXXXX",
       "email": "klr@sacree.tv"
     }
   ],
   "favorites_address": [
  {
    "label": "Orly Terminal 1 - 2 & 3",
    "section": "airport",
    "type": "aiport",
    "id": 1,
    "text": "Orly Terminal 1 - 2 & 3",
    "postcode": "94310",
    "center": [
      2.36009629416273,
      48.728578927993595
    ]
  },
  {
    "label": "Orly Terminal 4",
    "section": "airport",
    "type": "airport",
    "id": 2,
    "text": "Orly Terminal 4",
    "postcode": "94310",
    "center": [
      2.370896160841113,
      48.72910242423913
    ]
  },
  {
    "label": "Roissy CDG T1",
    "section": "airport",
    "type": "airport",
    "id": 3,
    "text": "Roissy CDG T1",
    "postcode": "95700",
    "center": [
      2.543041437765936,
      49.014385447198805
    ]
  },
  {
    "label": "Roissy CDG T2A",
    "section": "airport",
    "type": "airport",
    "id": 4,
    "text": "Roissy CDG T2A",
    "postcode": "95700",
    "center": [
      2.562768341555824,
      49.00307648107966
    ]
  },
  {
    "label": "Roissy CDG T2B",
    "section": "airport",
    "type": "airport",
    "id": 5,
    "text": "Roissy CDG T2B",
    "postcode": "95700",
    "center": [
      2.561975608737299,
      49.004029290640176
    ]
  },
  {
    "label": "Roissy CDG T2C",
    "section": "airport",
    "type": "airport",
    "id": 6,
    "text": "Roissy CDG T2C",
    "postcode": "95700",
    "center": [
      2.567583686883097,
      49.00325734362764
    ]
  },
  {
    "label": "Roissy CDG T2D",
    "section": "airport",
    "type": "airport",
    "id": 7,
    "text": "Roissy CDG T2D",
    "postcode": "95700",
    "center": [
      2.566745112384183,
      49.00429284983255
    ]
  },
  {
    "label": "Roissy CDG T2E",
    "section": "airport",
    "type": "airport",
    "id": 8,
    "text": "Roissy CDG T2E",
    "postcode": "95700",
    "center": [
      2.577805308889083,
      49.00384374130266
    ]
  },
  {
    "label": "Roissy CDG T2F",
    "section": "airport",
    "type": "airport",
    "id": 9,
    "text": "Roissy CDG T2F",
    "postcode": "95700",
    "center": [
      2.577651029324784,
      49.004843824633355
    ]
  },
  {
    "label": "Roissy CDG T2G",
    "section": "airport",
    "type": "airport",
    "id": 10,
    "text": "Roissy CDG T2G",
    "postcode": "95700",
    "center": [
      2.602262428051546,
      49.00568835206758
    ]
  },
  {
    "label": "Roissy CDG T3",
    "section": "airport",
    "type": "airport",
    "id": 11,
    "text": "Roissy CDG T3",
    "postcode": "95700",
    "center": [
      2.5599645800885753,
      49.01274000654374
    ]
  },
  {
    "label": "Gare du Nord",
    "section": "train",
    "type": "train",
    "id": 12,
    "text": "Gare du Nord",
    "postcode": "75010",
    "center": [
      2.3535168089547085,
      48.88021177791859
    ]
  },
  {
    "label": "Gare de Lyon",
    "section": "train",
    "type": "train",
    "id": 13,
    "text": "Gare de Lyon",
    "postcode": "75012",
    "center": [
      2.372747522938454,
      48.84480416731844
    ]
  },
  {
    "label": "Gare Montparnasse",
    "section": "train",
    "type": "train",
    "id": 14,
    "text": "Gare Montparnasse",
    "postcode": "75015",
    "center": [
      2.321250517734086,
      48.84104158851602
    ]
  },
  {
    "label": "Gare d'Austerlitz",
    "section": "train",
    "type": "train",
    "id": 15,
    "text": "Gare d'Austerlitz",
    "postcode": "75013",
    "center": [
      2.3648347360344815,
      48.841944145573564
    ]
  },
  {
    "label": "Gare Saint-Lazare",
    "section": "train",
    "type": "train",
    "id": 16,
    "text": "Gare Saint-Lazare",
    "postcode": "75008",
    "center": [
      2.3263256564763424,
      48.87566224553683
    ]
  },
  {
    "label": "Gare de l'Est",
    "section": "train",
    "type": "train",
    "id": 17,
    "text": "Gare de l'Est",
    "postcode": "75010",
    "center": [
      2.3581157794515946,
      48.87626758796836
    ]
  },
     
     {
       "label": "Domicile",
       "section": "favorites",
       "type": "address",
       "id": 123,
       "address": "19 rue du pont, 75015 Paris",
       "postcode": "75015",
       "center": [
         2.364449,
         48.726226
       ]
     },
     {
       "label": "Travail",
       "section": "favorites",
       "type": "address",
       "id": 124,
       "address": "20 route de saint denis, 95170 Deuil la Barre",
      "postcode": "95170",
       "center": [
         2.364449,
         48.726226
       ]
     }
   ],
   "last_trip": [
     {
       "id": 123,
       "status": "finish",
       "departure": "19 rue du pont, 75015 Paris",
       "arrival": "20 route de saint denis, 95170 Deuil la Barre",
       "date": "2022-01-01 09:11:00",
       "amount": "45.00",
       "vehicule": "Berline",
       "departure_center": [2.307526, 48.83922],
       "arrival_center": [2.326643, 48.960492],
       "departure_id": 1231,
       "arrival_id": 1232

     },
     {
       "id": 124,
       "status": "finish",
       "departure": "20 route de saint denis, 95170 Deuil la Barre",
       "arrival": "19 rue du pont, 75015 Paris",
       "date": "2022-01-01 15:11:00",
       "amount": "75.00",
       "vehicule": "Moto",
       "departure_center": [2.326643, 48.960492],
       "arrival_center": [2.307526, 48.83922],
       "departure_id": 1241,
       "arrival_id": 1242
     },
     {
       "id": 1200,
       "status": "valid",
       "departure": "19 rue du pont, 75015 Paris",
       "arrival": "20 route de saint denis, 95170 Deuil la Barre",
       "date": "2022-06-01 09:11:00",
       "amount": "40.00",
       "vehicule": "Berline",
       "transaction_id" : 123,
       "departure_center": [2.307526, 48.83922],
       "arrival_center": [2.326643, 48.960492],
       "departure_id": 12001,
       "arrival_id": 12002
     },
     {
       "id": 1201,
       "status": "waiting_payment_validation",
       "departure": "20 route de saint denis, 95170 Deuil la Barre",
       "arrival": "19 rue du pont, 75015 Paris",
       "date": "2022-02-11 15:11:00",
       "amount": "75.00",
       "vehicule": "Moto",
       "transaction_id" : 12,
       "departure_center": [2.326643, 48.960492],
       "arrival_center": [2.307526, 48.83922],
       "departure_id": 12011,
       "arrival_id": 12012
     }
   ],
   "payments": [
     {
       "id": 1,
       "type": "cb",
       "libelle": "perso",
       "last": "0123"
     },
     {
       "id": 2,
       "type": "cb",
       "libelle": "Pro",
       "last": "1432"
     },
     {
       "id": 3,
       "type": "prepaid",
       "balance": "135.45"
     },
     {
       "id": 4,
       "type": "company",
       "compagnyid": 1,
       "compagny": "Entreprise A",
       "cost_center": [
         "ct1",
         "mss1",
         "mss2",
         "at1",
         "bss1",
         "css2",
         "1t1",
         "1mss1",
         "1mss2",
         "2ct1",
         "2mss1",
         "2mss2",
         "3ct1",
         "3mss1",
         "3mss2",
         "5ct1",
         "5mss1",
         "5mss2",
         "6ct1",
         "6mss1",
         "6mss2",
         "7ct1",
         "7mss1",
         "7mss2",
         "act1",
         "amss1",
         "amss2",
         "aat1",
         "abss1",
         "acss2",
         "a1t1",
         "a1mss1",
         "a1mss2",
         "a2ct1",
         "a2mss1",
         "a2mss2",
         "a3ct1",
         "a3mss1",
         "a3mss2",
         "a5ct1",
         "a5mss1",
         "a5mss2",
         "a6ct1",
         "a6mss1",
         "a6mss2",
         "g7ct1",
         "g7mss1",
         "g7mss2"
       ]
     },
     {
       "id": 5,
       "type": "company",
       "compagnyid": 2,
       "compagny": "Entreprise B",
       "cost_center": [
         "a6mss2",
         "g7ct1",
         "g7mss1",
         "g7mss2"
       ]
     },
     {
       "id": 6,
       "type": "on-board_payment",
       "compagnyid": 3,
       "compagny": "Entreprise C"
     }
   ]
 }
```   

 sinon  
HTTP 401
 ```{"error":"auth error"}```  


 ## c) appel getwhere ##
 récupère les potentiels adresses par rapport à une query.  
***GET***   
 ***header***   
 ```authorization: XXXXXXXXXXXXXXXXXXXXXXXXX```     

 ***IN***  
 - paramètres:

   - ***search*** : champs recherché


  ```
  time curl -v "https://yolo.sacree.net/getwhere?search=20%20route%20de%20saint%20denis%20Deuil"  -H "authorization: eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJzb21lIjoicGF5bG9hZCIsInVzZXIiOiJzYWNyZWVAc2FjcmVlLmNvbSJ9.iRV5igcRLAPasdcb0OSqyhAhQn5eKvwOQ5wGBHRnoFWT-T7LywftdAP9GF3Um7Mr58mhNJDCV8dkqo85aXzeMg"
  ```   
si ok, on a en retour :
  ```
  {
	"type": "FeatureCollection",
	"query": [
		"20",
		"route",
		"de",
		"saint",
		"denis",
		"deuil"
	],
	"features": [
		{
			"id": "address.8994042097397292",
			"type": "Feature",
			"place_type": [
				"address"
			],
			"relevance": 1,
			"properties": {
				"accuracy": "point"
			},
			"text": "Route De Saint-Denis",
			"place_name": "20 Route De Saint-Denis, 95170 Deuil-la-Barre, France",
			"center": [
				2.326643,
				48.960492
			],
			"geometry": {
				"type": "Point",
				"coordinates": [
					2.326643,
					48.960492
				]
			},
			"address": "20",
			"context": [
				{
					"id": "neighborhood.9341826918339830",
					"text": "Galathee"
				},
				{
					"id": "postcode.5413640692594340",
					"text": "95170"
				},
				{
					"id": "place.5393240900201560",
					"wikidata": "Q271654",
					"text": "Deuil-la-Barre"
				},
				{
					"id": "region.3867293393016830",
					"wikidata": "Q12784",
					"short_code": "FR-95",
					"text": "Val-d'Oise"
				},
				{
					"id": "country.19008108158641660",
					"wikidata": "Q142",
					"short_code": "fr",
					"text": "France"
				}
			]
		},
		{
			"id": "address.4635172473080126",
			"type": "Feature",
			"place_type": [
				"address"
			],
			"relevance": 0.648148,
			"properties": {
				"accuracy": "point"
			},
			"text": "Route De Saint-Denis",
			"place_name": "20 Route De Saint-Denis, 71400 Autun, France",
			"center": [
				4.318689,
				46.967802
			],
			"geometry": {
				"type": "Point",
				"coordinates": [
					4.318689,
					46.967802
				]
			},
			"address": "20",
			"context": [
				{
					"id": "neighborhood.6969191111165280",
					"text": "Individuel Saint-Pantaleon et Les Ormes"
				},
				{
					"id": "postcode.11930617516444010",
					"text": "71400"
				},
				{
					"id": "place.11042283460699820",
					"wikidata": "Q190827",
					"text": "Autun"
				},
				{
					"id": "region.17876700014568600",
					"wikidata": "Q12736",
					"short_code": "FR-71",
					"text": "Saône-et-Loire"
				},
				{
					"id": "country.19008108158641660",
					"wikidata": "Q142",
					"short_code": "fr",
					"text": "France"
				}
			]
		},
		{
			"id": "address.2145154753391050",
			"type": "Feature",
			"place_type": [
				"address"
			],
			"relevance": 0.648148,
			"properties": {
				"accuracy": "point"
			},
			"text": "Route De Saint-Denis",
			"place_name": "20 Route De Saint-Denis, 42190 Charlieu, France",
			"center": [
				4.17663,
				46.155369
			],
			"geometry": {
				"type": "Point",
				"coordinates": [
					4.17663,
					46.155369
				]
			},
			"address": "20",
			"context": [
				{
					"id": "postcode.11672597227412780",
					"text": "42190"
				},
				{
					"id": "place.4688328363466030",
					"wikidata": "Q688187",
					"text": "Charlieu"
				},
				{
					"id": "region.8186660879253890",
					"wikidata": "Q12569",
					"short_code": "FR-42",
					"text": "Loire"
				},
				{
					"id": "country.19008108158641660",
					"wikidata": "Q142",
					"short_code": "fr",
					"text": "France"
				}
			]
		},
		{
			"id": "address.5459892460888610",
			"type": "Feature",
			"place_type": [
				"address"
			],
			"relevance": 0.648148,
			"properties": {
				"accuracy": "point"
			},
			"text": "Route De Saint Denis",
			"place_name": "20 Route De Saint Denis, 71160 Saint-Agnan, France",
			"center": [
				3.899232,
				46.498064
			],
			"geometry": {
				"type": "Point",
				"coordinates": [
					3.899232,
					46.498064
				]
			},
			"address": "20",
			"context": [
				{
					"id": "postcode.12464837030652530",
					"text": "71160"
				},
				{
					"id": "place.8281031572230040",
					"wikidata": "Q1626159",
					"text": "Saint-Agnan"
				},
				{
					"id": "region.17876700014568600",
					"wikidata": "Q12736",
					"short_code": "FR-71",
					"text": "Saône-et-Loire"
				},
				{
					"id": "country.19008108158641660",
					"wikidata": "Q142",
					"short_code": "fr",
					"text": "France"
				}
			]
		},
		{
			"id": "address.195552614893060",
			"type": "Feature",
			"place_type": [
				"address"
			],
			"relevance": 0.648148,
			"properties": {
				"accuracy": "point"
			},
			"text": "Route De Saint-Denis",
			"place_name": "20 Route De Saint-Denis, 11170 Montolieu, France",
			"center": [
				2.214904,
				43.314824
			],
			"geometry": {
				"type": "Point",
				"coordinates": [
					2.214904,
					43.314824
				]
			},
			"address": "20",
			"context": [
				{
					"id": "postcode.15903464057711370",
					"text": "11170"
				},
				{
					"id": "place.13204028210365890",
					"wikidata": "Q173911",
					"text": "Montolieu"
				},
				{
					"id": "region.3546003083412810",
					"wikidata": "Q3207",
					"short_code": "FR-11",
					"text": "Aude"
				},
				{
					"id": "country.19008108158641660",
					"wikidata": "Q142",
					"short_code": "fr",
					"text": "France"
				}
			]
		}
	],
	"attribution": "NOTICE: © 2021 Mapbox and its suppliers. All rights reserved. Use of this data is subject to the Mapbox Terms of Service (https://www.mapbox.com/about/maps/). This response and the information it contains may not be retained. POI(s) provided by Foursquare."
}
  ```   
  sinon  
 HTTP 401
  ```{"error":"auth error"}```

  ## d) settrip ##
  Envoie d'une commande par l'appli client.  
  ***POST***   
  ***header***   
  ```authorization: XXXXXXXXXXXXXXXXXXXXXXXXX```     

  ***IN***  
  envoie d'un json
  - dans departure et arrival, on peut soit mettre les infos complètes soit mettre un id 'id d'un favori ou d'une gare etc ...) et juste le label  
  - les champs promo et payment_cost_center sont optionnels.
  - Le champ payment_id est optionnel selon que l'internaute est un moyen de paiement ou pas.
  - le userid = 0 si client pas logué

```
{
  "userid": 789,
  "payment_id": 1,
  "flightnumber":"AF1227",
  "timedelta":"30",
  "payment_cost_center": null,
  "promo": {
    "code_p": "CODE_PARAIN_SACREE789"
  },
  "favorites_persons": [
    21
  ],
  "departure": {
    "address": "19 rue du pont, 75015 Paris, France",
    "id": 123
  },
  "arrival": {
  "label":"20 Route De Saint-Denis, 95170 Deuil-la-Barre, France",
  "type": "address",
  "text": "route de saint denis",
  "address": "20",
  "postcode": "95170",
  "place": "Deuil-la-Barre",
  "region": "Ile de France",
  "country_code": "fr",
  "center": [
    2.46643,
    48.060492
  ]
  },
  "date": "2022-01-01 09:11:00",
  "vehicule": "Berline"
}
```



```
   time curl -v "https://yolo.sacree.net/settrip"  -H "authorization: eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJzb21lIjoicGF5bG9hZCIsInVzZXIiOiJzYWNyZWVAc2FjcmVlLmNvbSJ9.iRV5igcRLAPasdcb0OSqyhAhQn5eKvwOQ5wGBHRnoFWT-T7LywftdAP9GF3Um7Mr58mhNJDCV8dkqo85aXzeMg"
```   
  si ok, on a en retour :   
  ```
  {
    "proposal_id" : 12,
    "amount_HT", "45.00",
    "amount_TTC", "49.50",
    "tva":"4.50",
    "tva_rate":"10",
    "currency","EUR"
  }

  ```     
  ## d) validtrip ##
  Validation d'une commande par l'appli client / retour paiement.  
  ***POST***   
  ***header***   
  ```authorization: XXXXXXXXXXXXXXXXXXXXXXXXX```     

  ***IN***  
  envoie d'un json      
    - les champs promo et payment_cost_center sont optionnels.    

  ```
  {
  "userid": 789,
  "payment_id": 1,
  "payment_cost_center": null,
  "promo": {
    "code_p": "CODE_PARAIN_SACREE789"
  },
  "proposal_id" : 12,
  "message": "Hello World",
  "amount_HT", "45.00",
  "amount_TTC", "49.50",
  "tva":"4.50",
  "tva_rate":"10",
  "currency","EUR"
  }
  ```

   ```
   time curl -v "https://yolo.sacree.net/validtrip"  -H "authorization: eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJzb21lIjoicGF5bG9hZCIsInVzZXIiOiJzYWNyZWVAc2FjcmVlLmNvbSJ9.iRV5igcRLAPasdcb0OSqyhAhQn5eKvwOQ5wGBHRnoFWT-T7LywftdAP9GF3Um7Mr58mhNJDCV8dkqo85aXzeMg"
   ```   
  si ok, on a en retour :   
  ```
  {
    "transaction_id":22,
    "proposal_id" : 12,
    "amount_HT", "45.00",
    "amount_TTC", "49.50",
    "tva":"4.50",
    "tva_rate":"10",
    "currency","EUR"
  }

  ```   

  ## e) transactionstatus ##
  Retourne le status d"une transaction.  
  ***POST***   
  ***header***   
  ```authorization: XXXXXXXXXXXXXXXXXXXXXXXXX```     

  ***IN***  
  envoie d'un json      
    - le champs transaction_id récupéré dans le valid trip    

  ```
  {
  "transaction_id":22
  }
  ```

  si ok, on a en retour 4 retour possible:   
    ***Valide***  
  ```
  {
    "transaction_id":22,
    "status" : "valid"
  }

  ```   
  ***Rejected***
  ```
  {
    "transaction_id":22,
    "status" : "rejected"
  }

  ```   
  ***processing***
  ```
  {
    "transaction_id":22,
    "status" : "processing"
  }

  ```   
  ***3ds Require***
  ```
  {
    "transaction_id":22,
    "status" : "3ds",
    "url": "https://booking.urban-driver.com/3ds?t=XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
  }

  ```   
On peut avoir d'autres status pour les commandes "finalisés" (cancelled, finish .....)

## f) canceltransaction ##
Annuler une transaction.  
***POST***   
***header***   
```authorization: XXXXXXXXXXXXXXXXXXXXXXXXX```     

***IN***  
envoie d'un json      
  - le champs transaction_id récupéré dans le valid trip    

```
{
"transaction_id":22
}
```

si ok, on a en retour 2 retour possible:   
  ***Cancelled***  
```
{
  "transaction_id":22,
  "status" : "cancelled"
}

```   
***Refused***
```
{
  "transaction_id":22,
  "status" : "refused",
  "message" : "annulation refusée car moins d'une heure avant la course"

}

```   
## g) appel flightstatus ##
 récupère les infos d'un vol avec son numero et la date du vol 
***GET***   
 ***header***   
 ```authorization: XXXXXXXXXXXXXXXXXXXXXXXXX```     

 ***IN***  
 - paramètres:

   - ***flightnumber*** : numero de vol ex: AF1234
   - ***flightdate*** : date du vol ex: "2022-03-19"


  ```
  time curl -v "https://booking.urban-driver.com/happy/flightstatus?flightnumber=AF1234&flightdate=2022-03-19"  -H "authorization: eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJzb21lIjoicGF5bG9hZCIsInVzZXIiOiJzYWNyZWVAc2FjcmVlLmNvbSJ9.iRV5igcRLAPasdcb0OSqyhAhQn5eKvwOQ5wGBHRnoFWT-T7LywftdAP9GF3Um7Mr58mhNJDCV8dkqo85aXzeMg"
  ```   
si ok, on a en retour :
  ```
  {"arrivalTime":"2022-04-01T09:35:00.000","id":39}
  ```
  datetime d'arrivée de l'avion
  et Id de l'airport d'arrivée.   
  sinon  
 HTTP 401
  ```{"error":"auth error"}```
  ou 
 HTTP 200
  ```{}```

## h) appel getdirectionb ##    

récupère le tracé d'un parcours routier entre 2 points    
la partie graphique du json est "geometry"   
***POST***   
 ***header***   
 ```authorization: XXXXXXXXXXXXXXXXXXXXXXXXX```     

 ***IN***  
 - paramètres:   
   - json : {   
  "start" : {"center": [2.370896160841113, 48.72910242423913]},    
  "end" :{"center": [2.543041437765936, 49.014385447198805]}     
  }


  ```
  curl "https://booking.urban-driver.com/happy/getdirectionb" -d '{"start" : {"center": [2.370896160841113, 48.72910242423913]}, "end" :{"center": [2.543041437765936, 49.014385447198805]}}' -H "authorization: 
  ```

```
{
    "weight_name": "auto",
    "weight": 4003.55,
    "duration": 2792.143,
    "distance": 42419.836,
    "legs": [
        {
            "via_waypoints": [],
            "admins": [
                {
                    "iso_3166_1_alpha3": "FRA",
                    "iso_3166_1": "FR"
                }
            ],
            "weight": 4003.55,
            "duration": 2792.143,
            "steps": [],
            "distance": 42419.836,
            "summary": "E 15, A 3"
        }
    ],
    "geometry": {
        "coordinates": [
            [
                2.370843,
                48.729295
            ],
            [
                2.371316,
                48.729394
            ],
            [
                2.362793,
                48.743313
            ],
            [
                2.344472,
                48.762502
            ],
            [
                2.346808,
                48.77879
            ],
            [
                2.344577,
                48.804815
            ],
            [
                2.35672,
                48.815935
            ],
            [
                2.377069,
                48.820768
            ],
            [
                2.411256,
                48.834827
            ],
            [
                2.41544,
                48.850726
            ],
            [
                2.413998,
                48.861199
            ],
            [
                2.414759,
                48.864276
            ],
            [
                2.427241,
                48.867424
            ],
            [
                2.458759,
                48.883514
            ],
            [
                2.471411,
                48.884853
            ],
            [
                2.474114,
                48.888381
            ],
            [
                2.469758,
                48.897588
            ],
            [
                2.481539,
                48.926665
            ],
            [
                2.473656,
                48.961176
            ],
            [
                2.486069,
                48.972246
            ],
            [
                2.502063,
                48.982229
            ],
            [
                2.51267,
                48.991337
            ],
            [
                2.518012,
                48.995657
            ],
            [
                2.528082,
                49.003825
            ],
            [
                2.543669,
                49.005975
            ],
            [
                2.550942,
                49.00716
            ],
            [
                2.548804,
                49.010646
            ],
            [
                2.542887,
                49.010645
            ],
            [
                2.542593,
                49.013346
            ],
            [
                2.542313,
                49.015297
            ],
            [
                2.540785,
                49.013844
            ],
            [
                2.543089,
                49.014384
            ]
        ],
        "type": "LineString"
    }
}
```

## i) updatemessage ##
update message d'un trip .  
***POST***   
***header***   
```authorization: XXXXXXXXXXXXXXXXXXXXXXXXX```     

***IN***  
envoie d'un json      
  - le champs transaction_id récupéré dans le valid trip    

```
time curl "https://booking.urban-driver.com/happy/updatemessage" -d '{"transaction_id":22,"message": "hello tout le monde 3"}' -H "authorization: XXXXXXXX"
```

```
{
"transaction_id":22,
"message": "hello tout le monde"
}
```

```
{
  "transaction_id":22,
  "status" : "ok"
}

```   
## j) passagers ##
gestion des passagers .  
***POST***   
***header***   
```authorization: XXXXXXXXXXXXXXXXXXXXXXXXX```     

***IN***  
envoie d'un json      
  - qui contient la liste des passagers (nouveaux ou pas)  et leur details. 

```
time curl "https://booking.urban-driver.com/happy/passagers" -d 'XXXXXXXXXXXXXX' -H "authorization: XXXXXXXX"
```

```
 [
     {
       "id": 21,
       "firstname": "Malo",
       "lastname": "sacree",
       "mobile": "XXXXXXXXXXX",
       "email": "malo@sacree.tv"
     },
     {
       "id": 22,
       "firstname": "Claire",
       "lastname": "sacree",
       "mobile": "XXXXXXXXXXX",
       "email": "klr@sacree.tv"
     }
   ]
```

```
{
  "status" : "ok"
}

```   

## k) smscode ##
gestion code sms d'inscription .  
***POST***   
***header***   
   

***IN***  
envoie d'un json      
  - qui contient le numero de téléphone d'un futur client au format inter ex 0033634346161
  - et le hash sha256 de la date du  salt "maloaimelespommes" et du numero
  - ex SHA2("2022-03-28 13:50:30maloaimelespommes0033634346161",256)
```
time curl "https://booking.urban-driver.com/happy/smscode" -d 'XXXXXXXXXXXXXX'
```

```
     {
       "mobile": "0033634346161",
       "datetime": "2022-03-28 13:50:30",
       "hash": "3b238f9636dfbf4afaa8e320351680f651e8b0534217f2f7b7f63dab85ed48d0"
     }
```

```
{
  "status" : "ok"
}

```   

## l) doperson ##
création de compte .  
***POST***   
***header***   
   

***IN***  
envoie d'un json      
  - qui contient le numero de téléphone d'un futur client au format inter ex 0033634346161
  - et le hash de smscode
  - le code
  - l'email
  - prénom
  - nom
  - Tous les champs de getme peuvent être envoyés.
```
time curl "https://booking.urban-driver.com/happy/doperson" -d 'XXXXXXXXXXXXXX'
```

json minimum 
```
     {
    "firstname": "cédric",
    "code": "123 456",
    "hash": "XXXXXXXXXXXXXXXXXXXXXXX",
    "lastname": "sacree",
    "mobilea": "xxxxxxxx1",
    "password": "dotherightthing$09",
    "email": "email@valide.ok"
     }
```

```
{
  "status" : "ok"
}

```   
erreurs possibles:
```
{'error':	'email exists'}

{'error':	'invalid email'}

{'error':	'except	auth error'}  //json malformé
```

## m) Reset password  ##
***POST***


***IN***  
- paramètres:

  - ***email*** : email de l'utilisateur (login)


 Si ok on aura un message de type

***OUT***
```
{
  "status" : "ok"
}

``` 

 sinon  
    HTTP 401
 ```{"error":"auth error"}```


## m) Reset password  ##
***POST***


***IN***  
- paramètres:

  - ***email*** : email de l'utilisateur (login)


```
time curl "https://booking.urban-driver.com/happy/resetpassword" -d 'login=email@email.email'
```

 Si ok on aura un message de type

***OUT***
```
{
  "status" : "ok"
}

``` 

 sinon  
    HTTP 401
 ```{"error":"auth error"}```

 ## n) setcontact ##
formulaire de contact .  
***POST***   
***header***   
```authorization: XXXXXXXXXXXXXXXXXXXXXXXXX```     

***IN***  
envoie d'un json      
  - qui contient les informations du formulaire de contact. 

```
time curl "https://booking.urban-driver.com/happy/setcontact" -d 'XXXXXXXXXXXXXX' -H "authorization: XXXXXXXX"
```

```
     {
       "lasttrip_id": 22,
       "message": "Claire"
     }
```

```
{
  "status" : "ok"
}

```   


  histo:   
  - ajout d'un id sur les payments, currency sur les lasttrip -> sur le json getme (2022-01-29 23:40:00)
  - ajout settrip et validtrip (2022-01-30 00:29:00)
  - ajout de status sur getme (2022-02-01 00:32:00)
  - ajout de canceltransaction (2022-02-22 21:36:00)
  - ajout de transactionstatus (2022-02-22 21:36:00)
  - changement de l'url de base (booking)

2022-03-19
  - ajout de   "flightnumber":"AF1227" dans settrip si vol 
  - ajout de   "timedelta"    entre 0 et 30 minutes dans settrip si vol
  - ajout de postcode dans les adresses favorites.
  - ajout du webservice flightstatus
  - ajout du webservice getdirectionb
  - ajout du champs message dans validtrip
  - ajout du webservice updatemessage 

2022-03-28
  - ajout du webservice passager
  - ajout du webservice smscode
  - ajout du webservice doperson
  
2022-04-03
  - modification du webservice flightstatus
  
2022-05-15
  - add reset password
  - add set contact





    
        
            




à valider:
- "erreur" paiement dans validtrip
- "erreur" zone non couverte settrip

//mettre drivers.urban-driver.com pour drivers


############################################################@
### A FAIRE #####
trainnumber 
Commentaire de course dans Getme si commentaire a renvoyer.
Pas de transactionid, si course finish ...

ajout de CB
forget password (email forget password)

mettre le paiement id dans le lasttrip + costcenter...
//OOOOOOOO



ApiClientUrbanDriverPresta.md
Displaying ApiClientUrbanDriverPresta.md.