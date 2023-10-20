-- COMPETITION
SELECT	a.name, l.name, rn.`number` as roundNumber, p.`number` as pouleNumber, places.placeNr as PlaceNumber
, 		tgp.gameRoundNumber, st.score 
FROM 	togetherGamePlaces tgp 
		INNER JOIN places on places.id  = tgp.placeId 
		INNER JOIN togetherGames tg on tgp.gameId  = tg.id 
		INNER JOIN poules p ON tg.pouleId = p.id 
		INNER JOIN rounds r ON p.roundId = r.id 
		INNER JOIN structureCells sc ON r.structureCellId = sc.id 
		INNER JOIN roundNumbers rn ON rn.id = sc.roundNumberId 
		INNER JOIN categories cat ON sc.categoryId  = cat.id 
		INNER JOIN competitions c  ON cat.competitionId = c.id
		INNER JOIN competitionSports cs  ON cs.competitionId = c.id
		INNER JOIN sports s  ON s.id = cs.sportId 
		INNER JOIN leagues l ON l.id  = c.leagueId
		INNER JOIN associations a ON a.id  = l.associationId
		INNER JOIN competitors c2 on c2.placeNr = places.placeNr and c2.pouleNr  = p.`number` and c.id = c2.competitionId 
		INNER JOIN poolUsers pu on pu.id = c2.poolUserId 
		INNER JOIN users u on u.id = pu.userId
		INNER JOIN scoresTogether st on st.gamePlaceId = tgp.id
WHERE 	s.name = 'SuperElf' and a.name = 'kamp duim' and u.name = 'coen' and rn.number = 1
ORDER BY a.name, l.name, rn.`number`, p.`number`, places.placeNr, tgp.gameRoundNumber

select * from scoresTogether   


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
WHERE 	s.name = 'SuperElf' and a.name = 'Arriva' 
ORDER BY a.name, l.name, rn.`number`, p.`number`, ag.gameRoundNumber
