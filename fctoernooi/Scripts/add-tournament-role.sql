
INSERT INTO tournamentUsers(tournamentId, userId, roles) values( 15631, 5, 7)


SELECT * FROM tournaments t join competitions c on c.id = t.competitionId join leagues l on l.id = c.leagueid where l.name like '%Maas%'