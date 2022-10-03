-- pool competitions
SELECT 	* 
FROM 	pools p
		join poolCollections pc on pc.id = p.collectionId 
		join associations a on a.id = pc.associationId
		join leagues l on l.associationId = a.id
		join competitions c on c.leagueId = l.id
-- 		join competitionSports cs on cs.competitionId  = c.id
--		join sports s on s.id  = cs.sportId 
order by p.id, c.id		

insert into leagues(name, abbreviation, associationId) ( select 'SuperCup', null, a.id from associations a where exists ( select * from poolCollections pc where pc.associationId = a.id) )

select * from leagues

select 'SuperCup', null, a.id from associations a where exists ( select * from poolCollections pc where pc.associationId = a.id)

select * from viewPeriods

select * from leagues

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



select * fr 
