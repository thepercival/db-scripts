SELECT a0_.id AS id_0, a0_.resourcebatch AS resourcebatch_1, a0_.state AS state_2, a0_.startDateTime AS startDateTime_3, a0_.gameRoundNumber AS gameRoundNumber_4, a0_.homeExtraPoints AS homeExtraPoints_5, a0_.awayExtraPoints AS awayExtraPoints_6, a0_.refereeId AS refereeId_7, a0_.placerefereeId AS placerefereeId_8, a0_.fieldId AS fieldId_9, a0_.competitionSportId AS competitionSportId_10, a0_.pouleId AS pouleId_11 FROM againstGames a0_ INNER JOIN poules p1_ ON a0_.pouleId = p1_.id INNER JOIN rounds r2_ ON p1_.roundId = r2_.id INNER JOIN structureCells s3_ ON r2_.structureCellId = s3_.id INNER JOIN roundNumbers r4_ ON s3_.roundNumberId = r4_.id  WHERE 1 = 1 AND r4_.competitionId = 41 and r4_.`number` = 1 ORDER BY a0_.startDateTime ASC, p1_.id 


-- SELECT 	agp.* 
SELECT 	a0_.id AS id_0, a0_.resourcebatch AS resourcebatch_1, a0_.state AS state_2, a0_.startDateTime AS startDateTime_3, a0_.gameRoundNumber AS gameRoundNumber_4, a0_.homeExtraPoints AS homeExtraPoints_5, a0_.awayExtraPoints AS awayExtraPoints_6, a0_.refereeId AS refereeId_7, a0_.placerefereeId AS placerefereeId_8, a0_.fieldId AS fieldId_9, a0_.competitionSportId AS competitionSportId_10, a0_.pouleId AS pouleId_11
FROM 	againstGames a0_ 
-- 		join againstGamePlaces agp on a0_.id = agp.gameId 
-- 		join places pl on pl.id = agp.placeId 
		INNER JOIN poules p1_ ON a0_.pouleId = p1_.id 
		INNER JOIN rounds r2_ ON p1_.roundId = r2_.id 
		INNER JOIN structureCells s3_ ON r2_.structureCellId = s3_.id 
		INNER JOIN roundNumbers r4_ ON s3_.roundNumberId = r4_.id 
WHERE 	1 = 1
AND r4_.competitionId = 41 and r4_.`number` = 1
-- AND	p1_.id = 99
-- AND p1_.id = 10 
-- AND 		a0_.startDateTime <= '2022-08-15 14:38:00' AND a0_.startDateTime >= '2022-08-15 14:36:00' 
ORDER BY a0_.startDateTime ASC, p1_.id 

-- SELECT 	agp.*, a0_.id 
SELECT 	p1_.*
FROM 	poules p1_  
		INNER JOIN rounds r2_ ON p1_.roundId = r2_.id 
		INNER JOIN structureCells s3_ ON r2_.structureCellId = s3_.id 
		INNER JOIN roundNumbers r4_ ON s3_.roundNumberId = r4_.id 
WHERE 	1 = 1
AND r4_.competitionId = 40
-- AND p1_.id = 10 
-- AND 		a0_.startDateTime <= '2022-08-15 14:38:00' AND a0_.startDateTime >= '2022-08-15 14:36:00' 
-- ORDER BY a0_.startDateTime ASC, p1_.id


select * from competitions

select * from competitionConfigs

delete from cacheItems





select * from againstGames where resourcebatch = 1

update againstGames set state = 1