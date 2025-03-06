# Database opgave 2025
Skrevet af: Isak Møgelvang, Jamie Callan og Helena Lykstoft

## 1. Databasedesign og oprettelse af databasen

I vores SQL fil [esport_assignment.sql](esport_assignment.sql) har vi lavet et script til at oprette databasen, oprette tabeller og sætte noget dummy data ind.

## 2. SQL-forespørgsler

Vores sql forespørgsler ligger i [esport_assignment_opgave2](esport_assignment_opgave2.sql). Der er de 15 forespørgsler vi har lavet. 
Eksempler på forespørgsler og at de virker: 

Forespørgsel 2.4:
Find spillere med flest sejre i en bestemt turnering.

![image](https://github.com/user-attachments/assets/a0259aa3-1c83-422e-a6aa-36aacb27e099)
![image](https://github.com/user-attachments/assets/440eb3cf-93c0-46cd-b350-a8f0ecc2ff48)

Her ser vi, at de spillere der spiller i turnering med nummeret 5, har de fleste sejre. 

Et andet eksempel er forespørgsel 2.7:
Find de 5 bedst rangerede spillere.

![image](https://github.com/user-attachments/assets/5b9d2601-5796-4fd1-af32-d1620c08f596)
![image](https://github.com/user-attachments/assets/9cbc8558-5c8e-44f9-871f-d268a36c495b)

Her ser vi de 5 spillere med højest ranking.


## 3. Stored procedures, functions og triggers

Vores stored procedures, functions og triggers ligger i de forskellige navngivede filer. 

### Stored procedures

- RegisterPlayer: registerplayer_opgave3part1.sql

- JoinTournament: jointournament_opgave3part2.sql

- SubmitMatchResult: submitMatchResult_opgave3part3.sql

### Functions

- GetTotalWins: getTotalWins.sql

- GetTournamentStatus: getTournamentStatus.sql

### Triggers

- beforeInsertRegistration: esport_assignment_opgave3.sql

- afterInsertMatch: esport_assignment_opgave3.sql

Og triggersne ligger explicit. Alle procedures og functions er testet for om de virker: 
Resultat eksempel: 

![image](https://github.com/user-attachments/assets/31e44da8-825c-4e59-9f98-00f46898621d)
![image](https://github.com/user-attachments/assets/5c78e267-5c6b-4d73-8a11-8f2d2fbecbff)

Billede 1 og 2 viser det call vi bruger til at kalde proceduren, og at brugeren er blevet oprettet når proceduren blev kaldt.

![image](https://github.com/user-attachments/assets/511aef72-2101-471d-aa59-22e09a48f080)

Billede 3 viser at vores function getTotalWins virker, og tjekker for hvor mange sejre spilleren med ID 13 har. 

![image](https://github.com/user-attachments/assets/b1358d37-c128-4657-a69a-39b9c9e3df48)

Billede 4 viser at vi har kørt vores trigger, og at den har givet os vores fejlmeddelelse, da vi prøvede at tilføje flere spillere end der var plads til.

## 4. Brug af databasen fra en applikation

Vi har lavet en lille applikation, der kan kalde vores stored procedures. 
Det er en meget simpel lille konsol applikation, hvor vi har lavet 2 filer: WithStoredProcedures og WithoutStoredProcedures.

I vores WithStoredProcedures bruger vi de stored procedures vi har lavet, og i WithoutStoredProcedures laver vi direkte kald til databasen, for at joine en tournament, eller vælge en vinder på en kamp.

## 5. Kort redegørelse 
Vi synes generelt set at brug af SQL programmering har fungeret godt for os. 
Vi synes at stored procedures, functions og triggers har været rigtig smart, da det for os også er mere "kodenært", og det er nemmere at sætte limits for fx antal af tilmeldte som en trigger, end at gøre det i selve koden. 
Dog synes vi at det er lidt irriterende at de er "usynlige", hvilket er en klar ulempe ved det. 
Men alt i alt synes vi det er super smart at vi kan lave metoder for at tilføje players eller lignende i SQL.
