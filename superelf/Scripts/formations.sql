-- ------ ASSEMBLE FORMATION --------- --
SELECT 	a.name, s.name, u.name, 'assemble', fl.number as line, fp.number as place, fp.totalPoints, t.name, tp.line, tp.startdatetime , tp.enddatetime,  pn.firstName, pn.nameInsertion, pn.lastName 
-- SELECT 	, a.name, s.name, u.name, 
FROM 	poolUsers pu
		join users u on u.id = pu.userId		
		join pools p on p.id = pu.poolId 
		join competitionConfigs cc on cc.id = p.competitionConfigId 		 
 		join competitions c on c.id = cc.sourceCompetitionId 
 		join seasons s on s.id = c.seasonId 
		join poolCollections pc on pc.id = p.collectionId 
		join associations a on a.id = pc.associationId
		join formations f on f.id = pu.assembleFormationId
		join assemblePeriods ap on ap.id = cc.assemblePeriodId 
		join formationLines fl on fl.formationId = f.id
		join formationPlaces fp on fp.formationLineId = fl.id 
		left join players pl on fp.playerId = pl.id 
		left join persons pn on pn.id = pl.personId  
		left join teamPlayers tp on tp.personId = pn.id and tp.startdatetime < ap.endDateTime and tp.enddatetime > ap.startDateTime
		left join teams t on t.id = tp.teamId 
where 	a.name = 'kamp duim' and s.name = '2022/2023' and u.name = 'coen'
-- where 	(select count(*) from formationPlaces fpSub join formationLines flSub on fpSub.formationLineId = flSub.id  where flSub.formationId = f.id ) <> 15 
order by a.name, u.name, fl.number, fp.number
-- ---------- END ASSEMBLE FORMATION ------------ --

-- ------ TRANSFER FORMATION --------- --
-- SELECT 	a.name, s.name, u.name, 'transfer', fl.number as line, fp.number as place, fp.totalPoints, t.name, tp.line, tp.startdatetime , tp.enddatetime,  pn.firstName, pn.nameInsertion, pn.lastName 
SELECT 	a.name, s.name, u.name, 'transfer', pu.id as puId, fl.number as line, fp.id as fpId, fp.number as place, fp.totalPoints, pn.* 
FROM 	poolUsers pu
		join users u on u.id = pu.userId		
		join pools p on p.id = pu.poolId 
		join competitionConfigs cc on cc.id = p.competitionConfigId 		 
 		join competitions c on c.id = cc.sourceCompetitionId 
 		join seasons s on s.id = c.seasonId 
		join poolCollections pc on pc.id = p.collectionId 
		join associations a on a.id = pc.associationId
		join formations tf on tf.id = pu.transferFormationId
		join assemblePeriods ap on ap.id = cc.assemblePeriodId 
		join formationLines fl on fl.formationId = tf.id
		join formationPlaces fp on fp.formationLineId = fl.id 
		left join players pl on fp.playerId = pl.id 
		left join persons pn on pn.id = pl.personId  
		left join teamPlayers tp on tp.personId = pn.id and tp.startdatetime < ap.endDateTime and tp.enddatetime > ap.startDateTime
		left join teams t on t.id = tp.teamId 
where 	a.name = 'kamp duim' and s.name = '2022/2023' and u.name = 'coen'
-- where 	(select count(*) from formationPlaces fpSub join formationLines flSub on fpSub.formationLineId = flSub.id  where flSub.formationId = f.id ) <> 15 
order by a.name, u.name, fl.number, fp.number
-- ---------- END TRANSFER FORMATION ------------ --

select * from formationPlaces fp where id in (1696, 1697)-- 39, 54 

-- UNDO SUBSTITUTION AND RESYNC GAMES
update formationPlaces set playerId = null where id = 1697;
update formationPlaces set playerId = 1648 where id = 1696;
update formationPlaces set playerId = 1585 where id = 1697;
delete from substitutions where id = 54;

select * from substitutions s where poolUserId = 61 
select * from players p where id in (1585, 1648)-- 39, 54
-- END			UNDO SUBSTITUTION AND RESYNC GAMES

select * from teamPlayers tpl join persons p on p.id = tpl.personId where p.lastName = 'Toornstra';
delete from teamPlayers where id = 383;
update teamPlayers set startdatetime = '2022-08-22 00:00:00.000' where id = 342;
select * from teamPlayers tpl join persons p on p.id = tpl.personId where p.lastName = 'Toornstra';

select * from replacements r  order by poolUserId
select * from transfers t order by poolUserId

select * from players where id = 1206

select * from viewPeriods vp 

select * from teamPlayers tp join persons p on p.id = tp .personId  where p.id in (1,151) -- 

select * from poolUsers pu join users u on u.id = pu.userId where u.name = 'coen'

select * from competitors c where poolUserId = ( select pu.id from poolUsers pu join users u on u.id = pu.userId where u.name = 'coen' )

select * from scoresTogether st 

select * from poolUsers pu join users u on u.id = pu.userId where u.emailaddress  = 'rodin.langejans@icloud.com'

select * from teamPlayers tp WHERE ID = 99 

select * from pools pc  a  tp WHERE ID = 99

select * from poolUsers pu where assembleFormationId is not null and transferFormationId is null

select * from poolUsers pu where pu.assembleFormationId  is not null

select * from formations f where not exists ( select * from poolUsers pu where pu.assembleFormationId = f.id or pu.transferFormationId = f.id )

insert into transfers(transferPeriodId , poolUserId , createdDateTime , lineNumberOut, placeNumberOut, playerIn , playerOut )
values (1, 20, '2023-02-08 12:00:00', 1, 1, 453, 227);
insert into transfers(transferPeriodId , poolUserId , createdDateTime , lineNumberOut, placeNumberOut, playerIn , playerOut )
values (1, 20, '2023-02-08 12:00:00', 8, 1, 288, 54);

insert into transfers(transferPeriodId , poolUserId , createdDateTime , lineNumberOut, placeNumberOut, playerIn , playerOut )
values (1, 23, '2023-02-08 12:00:00', 1, 1, 195, 1);
insert into transfers(transferPeriodId , poolUserId , createdDateTime , lineNumberOut, placeNumberOut, playerIn , playerOut )
values (1, 23, '2023-02-08 12:00:00', 2, 2, 2, 197);


-- CHECK IF TRANSFERFORMATIONS DONT HAVE PLAYERS OF ASSEMBLEVIEWPERIOD
select 	pu.id, u.name
from 	poolUsers pu 
		join users u on u.id = pu.userId		
		join pools p on p.id = pu.poolId 
		join competitionConfigs cc on cc.id = p.competitionConfigId 
		join transferPeriods tp on tp.id = cc.transferPeriodId  
		join viewPeriods tvp on tvp.id = tp.viewPeriodId 
		join assemblePeriods ap on ap.id = cc.assemblePeriodId  
		join viewPeriods avp on avp.id = ap.viewPeriodId
where 	exists ( 
			select 	* 
			from 	players p 
					join formationPlaces fp on fp.playerId = p.id
					join formationLines fl on fl.id = fp.formationLineId
			where 	p.viewPeriodId = avp.id
			and		fl.formationId = pu.transferFormationId 
		)


		-- statistics for formation and gameround
select 	* 
from 	statistics s
		join gameRounds gr on s.gameRoundId = gr.id 
		join players p ON p.id = s.playerId 
		join formationPlaces fp on p.id = fp.playerId 
		join formationLines fl on fl.id = fp.formationLineId		
where 	gr.`number` = 19
and		fl.formationId = 19

-- BETS WITH A CERTAIN PLAYER
SELECT 	tp.id, a.name, s.name, u.name, 'assemble', fl.number as line, fp.number as place, fp.totalPoints, t.name, tp.line, tp.startdatetime , tp.enddatetime,  pn.firstName, pn.nameInsertion, pn.lastName 
-- SELECT 	, a.name, s.name, u.name, 
FROM 	poolUsers pu
		join users u on u.id = pu.userId		
		join pools p on p.id = pu.poolId 
		join competitionConfigs cc on cc.id = p.competitionConfigId 		 
 		join competitions c on c.id = cc.sourceCompetitionId 
 		join seasons s on s.id = c.seasonId 
		join poolCollections pc on pc.id = p.collectionId 
		join associations a on a.id = pc.associationId
		join formations f on f.id = pu.assembleFormationId
		join assemblePeriods ap on ap.id = cc.assemblePeriodId 
		join formationLines fl on fl.formationId = f.id
		join formationPlaces fp on fp.formationLineId = fl.id 
		left join players pl on fp.playerId = pl.id 
		left join persons pn on pn.id = pl.personId  
		left join teamPlayers tp on tp.personId = pn.id and tp.startdatetime < ap.endDateTime and tp.enddatetime > ap.startDateTime
		left join teams t on t.id = tp.teamId 
where 	s.name = '2023/2024'
and		tp.personId = 23
-- where 	(select count(*) from formationPlaces fpSub join formationLines flSub on fpSub.formationLineId = flSub.id  where flSub.formationId = f.id ) <> 15 
order by a.name, u.name, fl.number, fp.number

select * 
from players pl 
		join formationPlaces fp on fp.playerId = pl.Id
		join formationLines fl on fl.id = fp.formationLineId 
		join Formations f on f.is = fl.formationId 		
where pl.personId = 23 




