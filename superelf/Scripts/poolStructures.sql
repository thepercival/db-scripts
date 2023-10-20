-- COMPETITION, CUP AND SUPERCUP
WITH RECURSIVE placesPath (id, path) AS
(
  SELECT id, CAST(id AS CHAR(200))
    FROM places
    WHERE qualifiedPlaceId IS NULL
  UNION ALL
  SELECT pl.id, CONCAT(plp.path, ',', pl.id)
    FROM placesPath AS plp JOIN places AS pl
      ON plp.id = pl.qualifiedPlaceId
)
select 	a.name, s.name, l.name, rn.`number` as roundNr, p.`number` as pouleNr, pl.placeNr, u.name
FROM placesPath as plPath
		join places pl on pl.id = plPath.id
		join poules p on pl.pouleId = p.id
		join rounds r on p.roundId = r.id
		join structureCells sc on sc.id = r.structureCellId
		join roundNumbers rn on sc.roundNumberId = rn.id
		join competitions c on c.id = rn.competitionId 
		join leagues l on l.id = c.leagueId 
		join seasons s on s.id = c.seasonId 
		join associations a on a.id = l.associationId 
		left join places stpl on stpl.id = CASE INSTR(plPath.path, ',')
		    WHEN 0 THEN 
		    	CASE rn.number
				    WHEN 1 THEN plPath.path
				    ELSE NULL
				END
		    ELSE SUBSTRING(plPath.path,1,INSTR(plPath.path, ',')-1)
		END 
		left join poules stp on stp.id = stpl.pouleId 
		left join competitors cr on cr.competitionId = c.id and cr.categoryNr = 1 and cr.pouleNr = stp.`number` and cr.placeNr = stpl.placeNr 
		left join poolUsers pu on cr.poolUserId = pu.id 
		left join users u on u.id = pu.userId 
where 	l.name = 'Cup' and a.name = 'kamp duim' and s.name = '2022/2023'
ORDER BY a.name, l.name, rn.`number`, p.`number`;

