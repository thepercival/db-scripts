SELECT * FROM users where emailaddress = 'camielvandervelden@live.nl'

-- view users with poolUsers
select 	u.id, u.emailaddress , u.name, u.validated, pu.admin, a.name, s.name 
from 	users u
		left join poolUsers pu on pu.userId = u.id
		left join pools p on p.id = pu.poolId 
		left join competitionConfigs cc on cc.id = p.competitionConfigId 
		left join competitions c on c.id = cc.sourceCompetitionId  
		left join seasons s on s.id = c.seasonId 
		left join poolCollections pc on pc.id = p.collectionId 
		left join associations a on a.id = pc.associationId  
where 	1 = 1
and		u.name in ('keesv' , 'Blauwwit');

SELECT * FROM users where name like '%whorst%'

select * from persons p where p.id in (100,101)

select * from replacements r

select * from transfers t