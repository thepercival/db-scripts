-- view pools
select 	p.id as poolId, a.name as pool, s.name as season, (select count(*) from poolUsers pu where pu.poolId = p.id) as nrOfPoolUsers 
from 	pools p
		JOIN poolCollections pc on pc.id = p.collectionId  
		join associations a on a.id = pc.associationId
		join competitionConfigs cc on cc.id = p.competitionConfigId
		join competitions c on c.id = cc.sourceCompetitionId
		join seasons s on s.id = c.seasonId 
where 	1 = 1
and s.name = '2023/2024'

delete from pools where id in (17,18)

select * from poolCollections pc 

insert into associations(name) values ('SuperElf');
insert into poolCollections (associationId) 
(
	select id from associations where name = 'SuperElf' 
);
insert into leagues(name, associationId)
(
	select 'WorldCup', id from associations where name = 'SuperElf' 
);


SELECT * from competitionConfigs cc 

select * from formations 

select * from associations a order by Id desc

select * from leagues 

SELECT 	p0_.id AS id_0, p0_.halted AS halted_1, p0_.competitionConfigId AS competitionConfigId_2, p0_.collectionId AS collectionId_3 
FROM 	pools p0_ 
WHERE 	EXISTS (
			SELECT p1_.id 
			FROM poolUsers p1_ 
			WHERE p1_.poolId = p0_.id 
			AND p1_.userId = 1 
			AND p1_.admin = 1)

select * from pools 

select * from users

delete from transfers

select * from pools p join poolCollections pc on pc.id  = p.collectionId  join associations a on a.id = pc.associationId

select * from 
where not exists(select * from pools p where p.collectionId = pc.id) 
and a.parentId is null


delete pc from poolCollections pc join associations a on a.id = pc.associationId where not exists(select * from pools p where p.collectionId = pc.id) and a.parentId is null


select * from associations a where not exists(select * from poolCollections pc where pc.associationId = a.id) and a.parentId is null and a.id > 1