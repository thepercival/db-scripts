
SELECT * FROM trophies;

SELECT * FROM trophiesUnviewed tu ;

delete FROM trophies where id = 2

select * from trophiesUnviewed

select * from poolUsers

insert into trophiesUnviewed(poolUserId, trophyId) values(78,2);


SELECT t0_.id AS id_0, t0_.poolUserId AS poolUserId_1, t0_.trophyId AS trophyId_2 
FROM 	trophiesUnviewed t0_ 
		INNER JOIN trophies t1_ ON t0_.trophyId = t1_.id 
		INNER JOIN poolUsers p2_ ON t1_.poolUserId = p2_.id 
		INNER JOIN pools p3_ ON p2_.poolId = p3_.id
		INNER JOIN poolUsers p4_ ON t0_.poolUserId = p4_.id 
		WHERE p3_.collectionId = ? AND p4_.userId = ? AND t0_.poolUserId = ?

-- INSERT INTO TROPHIES
insert into trophies(createDateTime, poolUserId, competitionId)
(
	select 	CURRENT_DATE(), pu.Id, c.id
	from 	competitionConfigs cc 
			join pools p on p.competitionConfigId = cc.id
			join poolCollections pc on p.collectionId  = pc.id
			join associations a on a.id = pc.associationId
			join leagues l on l.associationId = a.id
			join competitions sc on sc.id = cc.sourceCompetitionId
			join seasons s on s.id = sc.seasonId 
			join competitions c on c.leagueId = l.id and c.seasonId = sc.seasonId 			
			join poolUsers pu on p.id = pu.poolId
			join users u on u.id = pu.userId 
	where s.name = '2014/2015' and a.name = 'kamp duim' and u.name = 'coen'
);
insert into trophiesUnviewed(poolUserId, trophyId)
(
	select 	puS.id, t.id 
	from 	trophies t 
			join poolUsers pu on pu.id = t.poolUserId 
			join poolUsers puS on puS.poolId = pu.poolId
	where	competitionId = 36 
);


-- BADGES
SELECT * FROM badges b join poolUsers pu on b.poolUserId  = pu.id
			join users u on u.id = pu.userId ;
select *  FROM badgesUnviewed
delete FROM badgesUnviewed tu ;

delete FROM badges where id = 2

SELECT b0_.id AS id_0, b0_.poolUserId AS poolUserId_1, b0_.badgeId AS badgeId_2 
FROM 	badgesUnviewed b0_ 
		INNER JOIN badges b1_ ON b0_.badgeId = b1_.id 
		INNER JOIN poolUsers p2_ ON b1_.poolUserId = p2_.id 
		INNER JOIN pools p3_ ON p2_.poolId = p3_.id 
		INNER JOIN poolUsers p4_ ON b0_.poolUserId = p4_.id 
		WHERE p3_.collectionId = 1 AND p4_.userId = 1

select * FROM badgesUnviewed bu 

-- INSERT INTO BADGES 2014/2015
insert into badges(createDateTime, category, poolUserId, poolId, competitionConfigId)
(
	select 	CURRENT_DATE(), 'Result', pu.Id, p.id, cc.id
	from 	competitionConfigs cc 
			join pools p on p.competitionConfigId = cc.id
			join poolCollections pc on p.collectionId  = pc.id
			join associations a on a.id = pc.associationId
			join leagues l on l.associationId = a.id
			join competitions sc on sc.id = cc.sourceCompetitionId
			join seasons s on s.id = sc.seasonId 
			join competitions c on c.leagueId = l.id and c.seasonId = sc.seasonId 			
			join poolUsers pu on p.id = pu.poolId
			join users u on u.id = pu.userId 
	where s.name = '2014/2015' and a.name = 'kamp duim' and u.name = 'coen'
);
insert into badges(createDateTime, category, poolUserId, poolId, competitionConfigId)
(
	select 	CURRENT_DATE(), 'Goal', pu.Id, p.id, cc.id
	from 	competitionConfigs cc 
			join pools p on p.competitionConfigId = cc.id
			join poolCollections pc on p.collectionId  = pc.id
			join associations a on a.id = pc.associationId
			join leagues l on l.associationId = a.id
			join competitions sc on sc.id = cc.sourceCompetitionId
			join seasons s on s.id = sc.seasonId 
			join competitions c on c.leagueId = l.id and c.seasonId = sc.seasonId 			
			join poolUsers pu on p.id = pu.poolId
			join users u on u.id = pu.userId 
	where s.name = '2014/2015' and a.name = 'kamp duim' and u.name = 'coen'
);
insert into badges(createDateTime, category, poolUserId, poolId, competitionConfigId)
(
	select 	CURRENT_DATE(), 'Assist', pu.Id, p.id, cc.id
	from 	competitionConfigs cc 
			join pools p on p.competitionConfigId = cc.id
			join poolCollections pc on p.collectionId  = pc.id
			join associations a on a.id = pc.associationId
			join leagues l on l.associationId = a.id
			join competitions sc on sc.id = cc.sourceCompetitionId
			join seasons s on s.id = sc.seasonId 
			join competitions c on c.leagueId = l.id and c.seasonId = sc.seasonId 			
			join poolUsers pu on p.id = pu.poolId
			join users u on u.id = pu.userId 
	where s.name = '2014/2015' and a.name = 'kamp duim' and u.name = 'tiem'
);
insert into badges(createDateTime, category, poolUserId, poolId, competitionConfigId)
(
	select 	CURRENT_DATE(), 'Sheet', pu.Id, p.id, cc.id
	from 	competitionConfigs cc 
			join pools p on p.competitionConfigId = cc.id
			join poolCollections pc on p.collectionId  = pc.id
			join associations a on a.id = pc.associationId
			join leagues l on l.associationId = a.id
			join competitions sc on sc.id = cc.sourceCompetitionId
			join seasons s on s.id = sc.seasonId 
			join competitions c on c.leagueId = l.id and c.seasonId = sc.seasonId 			
			join poolUsers pu on p.id = pu.poolId
			join users u on u.id = pu.userId 
	where s.name = '2014/2015' and a.name = 'kamp duim' and u.name = 'jananne'
);
insert into badges(createDateTime, category, poolUserId, poolId, competitionConfigId)
(
	select 	CURRENT_DATE(), 'Card', pu.Id, p.id, cc.id
	from 	competitionConfigs cc 
			join pools p on p.competitionConfigId = cc.id
			join poolCollections pc on p.collectionId  = pc.id
			join associations a on a.id = pc.associationId
			join leagues l on l.associationId = a.id
			join competitions sc on sc.id = cc.sourceCompetitionId
			join seasons s on s.id = sc.seasonId 
			join competitions c on c.leagueId = l.id and c.seasonId = sc.seasonId 			
			join poolUsers pu on p.id = pu.poolId
			join users u on u.id = pu.userId 
	where s.name = '2014/2015' and a.name = 'kamp duim' and u.name = 'gerrit'
);
insert into badgesUnviewed(poolUserId, badgeId)
(
	select 	puS.id, b.id 
	from 	badges b 
			join poolUsers pu on pu.id = b.poolUserId 
			join poolUsers puS on puS.poolId = pu.poolId
	where	b.competitionConfigId = 2
);
