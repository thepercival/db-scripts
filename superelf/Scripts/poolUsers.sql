-- view poolUsers
select 	u.name, a.name, s.name, u.id as userId, pu.*, p.* 
from 	poolUsers pu 
		join pools p on p.id = pu.poolId 
		join users u on u.id = pu.userId 
		join competitionConfigs cc  on cc.id = p.competitionConfigId
		join competitions c  on c.id = cc.sourceCompetitionId
		join seasons s on s.id = c.seasonId 
		join poolCollections pc on pc.id = p.collectionId 
		join associations a on a.id = pc.associationId
where 	1 = 1
and pu.id in (94,90,128,105,92,100)
-- and		u.id = 173
-- and		a.name = 'Arriva' 

-- view competitors
select 	u.name, a.name, s.name, l.name, pu.id as poolUserId, p.id as poolId, cr.* 
from 	competitors cr  
		join competitions c  on c.id = cr.competitionId 
		join leagues l  on l.id = c.leagueId
		join poolUsers pu on pu.id = cr.poolUserId 
		join pools p on p.id = pu.poolId 
		join users u on u.id = pu.userId
		join competitionConfigs cc  on cc.id = p.competitionConfigId
		join competitions sc  on sc.id = cr.competitionId
		join seasons s on s.id = sc.seasonId 
		join poolCollections pc on pc.id = p.collectionId 
		join associations a on a.id = pc.associationId		 
where 	1 = 1
and		p.id = 15
and 	s.name = '2023/2024'
order by a.name, l.name, cr.pouleNr, cr.placeNr  

select name, id from users order by id

select * from poolUsers where poolId = 20;

select * from places where pouleId = 98

select * from competitors c join poolUsers pu on pu.id = c.poolUserId where pu.poolId = 15 




-- view admin-poolUsers
select 	distinct u.emailaddress, a.name
from 	poolUsers pu
		join users u on u.id = pu.userId 
		join pools p on p.id = pu.poolId 
		join competitionConfigs cc  on cc.id = p.competitionConfigId
		join competitions c  on c.id = cc.sourceCompetitionId
		join seasons s on s.id = c.seasonId 
		join poolCollections pc on pc.id = p.collectionId 
		join associations a on a.id = pc.associationId 
where 	1 = 1
AND 	pu.admin = 1
AND 	s.name = '2023/2024'

select * from associations a 


SELECT distinct u.emailaddress  FROM poolUsers pu JOIN users u ON u.id = pu.userId where pu.admin = 1;

select * from formations 

select * from replacements 

select * from transfers t 

select * from substitutions s 

delete from replacements

delete from transfers

select * from pools p join poolCollections pc on pc.id  = p.collectionId  join associations a on a.id = pc.associationId

select * from poolCollections pc join associations a on a.id = pc.associationId
where not exists(select * from pools p where p.collectionId = pc.id) 
and a.parentId is null

delete pc from poolCollections pc join associations a on a.id = pc.associationId where not exists(select * from pools p where p.collectionId = pc.id) and a.parentId is null


select * from associations a where not exists(select * from poolCollections pc where pc.associationId = a.id) and a.parentId is null and a.id > 1