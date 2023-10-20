SELECT 	emailaddress, (select count(*) from tournamentUsers where userId = u.id ) as nrOfTournaments
FROM 	users u
ORDER BY nrOfTournaments DESC

insert into tournamentUsers (tournamentid, userId, roles) values( 18232, 5, 7)

select 	tu.*, u.id, u.emailaddress 
from 	tournamentUsers tu 
		join users u on u.id = tu.userId
where 	1 = 1
-- and 	tu.tournamentId = 9301
and 	u.emailaddress = 'williammiddelbeek@gmail.com'
; -- 2902

select 	tu.*, u.id, u.emailaddress from tournamentUsers tu where tu.userId = 9850;
where 	1 = 1

select * from users where emailaddress like '%mmiddelbeek%';

update tournamentusers set userid = 5 where tournamentid = 9301

delete from roundnumbers where id = 6067

select * from tournaments t join competitions c on t.competitionid = c.id join leagues l on l.id = c.leagueid where t.updated = true and t.id = 1238;


select * from competitions where not exists ( select * from roundNumbers where competitionid = competitions.id )

select * from tournaments where competitionid in (select Id from competitions where not exists ( select * from roundNumbers where competitionid = competitions.id ))

select * from tournamentusers where tournamentid in (select id from tournaments where competitionid in (select Id from competitions where not exists ( select * from roundNumbers where competitionid = competitions.id )))


select * from competitors c where c.tournamentId = 18266 order by categoryNr , pouleNr , placeNr 
-- twee verwijderen, in werkelijkheid wordt er 1 verwijderd
-- idem met toevoegen
-- ook ontstaat er in de db een extra rij