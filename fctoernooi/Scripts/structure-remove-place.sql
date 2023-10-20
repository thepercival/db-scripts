-- select p.* from poules p join rounds r on r.id = p.roundId join roundNumbers rn on r.numberId = rn.id join competitions c on c.id = rn.competitionId join tournaments t on t.competitionId = c.id where t.id = 1039
-- select * from tournamentusers where tournamentId = 1039
-- update tournamentusers set userid = 5 where tournamentId = 1039 -- 661

delete from places where pouleId = 12325 and placeNr = 20;

update places set placeNr = 20 where pouleId = 12325 and placeNr = 21;

delete from competitors where tournamentId = 1039 and placeNr = 20;

update competitors set placeNr = 20 where tournamentId = 1039 and placeNr = 21;

