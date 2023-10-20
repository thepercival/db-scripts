-- pool competitions
SELECT 	a.name,  s.name, l.name
FROM 	pools p
		join poolCollections pc on pc.id = p.collectionId 
		join associations a on a.id = pc.associationId
		join leagues l on l.associationId = a.id
		join competitions c on c.leagueId = l.id
		join seasons s on s.id = c.seasonId 
where 	1 = 1
AND 	s.name = '2023/2024'
order by p.id, c.id		


-- pool leagues
SELECT 	a.name, l.name
FROM 	pools p
		join poolCollections pc on pc.id = p.collectionId 
		join associations a on a.id = pc.associationId
		join leagues l on l.associationId = a.id		
order by a.name, l.name

-- pool competitors
SELECT 	a.name, l.name, u.name, cr.id, pu.id 
FROM 	pools p
		join poolUsers pu on pu.poolId = p.id 
		join users u on u.id = pu.userId 
		join poolCollections pc on pc.id = p.collectionId 
		join associations a on a.id = pc.associationId
		join leagues l on l.associationId = a.id
		join competitions c on c.leagueId = l.id
		join competitors cr on cr.competitionId = c.id and cr.poolUserId = pu.id 
order by p.id, c.id

-- COMPETITION PLACES
-- SELECT	a.name, l.name, rn.`number` as roundNumber, p.`number` as pouleNumber, places.placeNr as PlaceNumber, places.id as PlaceeId
SELECT	places.*
FROM 	places  
		INNER JOIN poules p ON places.pouleId = p.id 
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
WHERE 	s.name = 'SuperElf'  
and a.name = 'Arriva' and ssn.name  = '2023/2024' and l.name = 'Competition'
ORDER BY a.name, l.name, rn.`number`, p.`number`, places.placeNr


