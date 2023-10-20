-- COMPETITION
-- SELECT	a.name, l.name, rn.`number` as roundNumber, p.`number` as pouleNumber, places.placeNr as PlaceNumber, places.id as PlaceeId, tgp.gameRoundNumber, tg.id, tg.state
SELECT	tgp.*
FROM 	togetherGamePlaces tgp 
		INNER JOIN places on places.id  = tgp.placeId 
		INNER JOIN togetherGames tg on tgp.gameId  = tg.id 
		INNER JOIN poules p ON tg.pouleId = p.id 
		INNER JOIN rounds r ON p.roundId = r.id 
		INNER JOIN structureCells sc ON r.structureCellId = sc.id 
		INNER JOIN roundNumbers rn ON rn.id = sc.roundNumberId 
		INNER JOIN categories cat ON sc.categoryId  = cat.id 
		INNER JOIN competitions c  ON cat.competitionId = c.id
		INNER JOIN seasons ssn  ON ssn.id= c.seasonId 
		INNER JOIN competitionSports cs  ON cs.competitionId = c.id
		INNER JOIN sports s  ON s.id = cs.sportId 
		INNER JOIN leagues l ON l.id  = c.leagueId
		INNER JOIN associations a ON a.id  = l.associationId 
WHERE 	s.name = 'SuperElf' -- and tgp.gameRoundNumber = 17 
and a.name = 'Arriva' and ssn.name  = '2023/2024'  and places.placeNr = 15
ORDER BY a.name, l.name, rn.`number`, p.`number`, places.placeNr, tgp.gameRoundNumber

select tg.id, tg.state from togetherGames tg where tg.id in ( 99,41,128,12,70 )

-- CUP AND SUPERCUP
SELECT	a.name, l.name, rn.`number` as roundNumber, p.`number` as pouleNumber, hp.placeNr as HomePlaceNumber, ap.placeNr as AwayPlaceNumber, ag.gameRoundNumber, ag.state 
FROM 	againstGames ag  
		INNER JOIN againstGamePlaces hgp on hgp.gameId = ag.Id and hgp.side = 1
		INNER JOIN places hp on hp.id = hgp.placeId  
		INNER JOIN againstGamePlaces agp on agp.gameId = ag.Id and agp.side = 2
		INNER JOIN places ap on ap.id = agp.placeId
		INNER JOIN poules p ON ag.pouleId = p.id 
		INNER JOIN rounds r ON p.roundId = r.id 
		INNER JOIN structureCells sc ON r.structureCellId = sc.id 
		INNER JOIN roundNumbers rn ON rn.id = sc.roundNumberId 
		INNER JOIN categories cat ON sc.categoryId  = cat.id 
		INNER JOIN competitions c  ON cat.competitionId = c.id
		INNER JOIN competitionSports cs  ON cs.competitionId = c.id
		INNER JOIN sports s  ON s.id = cs.sportId 
		INNER JOIN leagues l ON l.id  = c.leagueId
		INNER JOIN associations a ON a.id  = l.associationId 
WHERE 	s.name = 'SuperElf' and a.name = 'kamp duim' 
ORDER BY a.name, l.name, rn.`number`, p.`number`, ag.gameRoundNumber

SELECT	ag.id, a.name, l.name, rn.`number` as roundNumber, p.`number` as pouleNumber, hp.placeNr as HomePlaceNumber, ap.placeNr as AwayPlaceNumber, ag.gameRoundNumber, ag.state 
FROM 	againstGames ag  
		INNER JOIN againstGamePlaces hgp on hgp.gameId = ag.Id and hgp.side = 1
		INNER JOIN places hp on hp.id = hgp.placeId  
		INNER JOIN againstGamePlaces agp on agp.gameId = ag.Id and agp.side = 2
		INNER JOIN places ap on ap.id = agp.placeId
		INNER JOIN poules p ON ag.pouleId = p.id 
		INNER JOIN rounds r ON p.roundId = r.id 
		INNER JOIN structureCells sc ON r.structureCellId = sc.id 
		INNER JOIN roundNumbers rn ON rn.id = sc.roundNumberId 
		INNER JOIN categories cat ON sc.categoryId  = cat.id 
		INNER JOIN competitions c  ON cat.competitionId = c.id
		INNER JOIN competitionSports cs  ON cs.competitionId = c.id
		INNER JOIN sports s  ON s.id = cs.sportId 
		INNER JOIN leagues l ON l.id  = c.leagueId
		INNER JOIN associations a ON a.id  = l.associationId 
WHERE 	s.name = 'SuperElf' and ag.gameRoundNumber = 17 -- and a.name = 'kamp duim' 
ORDER BY a.name, l.name, rn.`number`, p.`number`, ag.gameRoundNumber

select ag.id, ag.state from againstGames ag where ag.id in ( 440,491,494,497,500,332,335,338,341,386,389,392,395 )

update againstGames set state = 2 where id in ( 440,491,494,497,500,332,335,338,341,386,389,392,395 )

