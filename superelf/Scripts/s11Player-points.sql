-- assemble formation for poolUser: 'joris', pool 'kamp duim' and gameRound 6
SELECT 	pn.id, a.name, u.name, fl.number, fp.number, t.name, tp.line, tp.startdatetime , tp.enddatetime,  pn.firstName, pn.nameInsertion, pn.lastName, s.*
, splt.*, s.*
FROM 	poolUsers pu
		join users u on u.id = pu.userId		
		join pools p on p.id = pu.poolId 
		join competitionConfigs cc on cc.id = p.competitionConfigId 
		join assemblePeriods ap on ap.id = cc.assemblePeriodId 
		join viewPeriods avp on avp.id = ap.viewPeriodId 
		join gameRounds gr on gr.viewPeriodId = avp.id
		join poolCollections pc on pc.id = p.collectionId 
		join associations a on a.id = pc.associationId
		join formations f on f.id = pu.assembleFormationId
		join formationLines fl on fl.formationId = f.id
		join formationPlaces fp on fp.formationLineId = fl.id 
		join players spl on fp.playerId = spl.id
		left join playerTotals splt on splt.id = spl.totalsId 
		left join persons pn on pn.id = spl.personId
		left join teamPlayers tp on tp.personId = pn.id and tp.startdatetime < avp.endDateTime and tp.enddatetime > avp.startDateTime 
		left join teams t on t.id = tp.teamId 
		left join statistics s on s.playerId = spl.id
where 	a.name = 'kamp duim' and u.name = 'storm'  and gr.number = 5
order by a.name, u.name, fl.number, fp.number

select 	(select ep.externalId from externalPersons ep where ep.importableObjectId = p.id) as r, p.* -- , tp.*
from 	persons p 
-- join teamPlayers tp on tp.personId = p.id
where exists ( select * from persons ps where ps.id <> p.id and ps.lastName = p.lastName and ps.firstName = p.firstName )
-- and 	p.id in (885, 889)
order by LastName

select *from persons where LastName like '%inkel%'

select * from players where personId in (296,727)
 
select * from formationPlaces fp join players pl on pl.id = fp.playerId where pl.personId in (296,727,864,787,633,225,853,856)

update 	formationPlaces fp join players pl on pl.id = fp.playerId set fp.playerId  = ( select pSub.id from players pSub where pSub.personId = 896 ) where pl.personId = 884;
 
delete from players where personId = 296;  
delete from teamPlayers where personId = 296;
delete from persons where id = 296;
  
    select * from players where personId = 885
 

 
 update players set personId = 889 where personId = 
 teamPlayers

select * from ex

-- insert into formationPlaces(formationLineId, number, playerId, penaltyPoints ) values (48, 1, null, 0);

SELECT 	DISTINCT s0_.id AS id_0, s0_.result AS result_1, s0_.beginMinute AS beginMinute_2, s0_.endMinute AS endMinute_3, s0_.nrOfFieldGoals AS nrOfFieldGoals_4, s0_.nrOfAssists AS nrOfAssists_5, s0_.nrOfPenalties AS nrOfPenalties_6, s0_.nrOfOwnGoals AS nrOfOwnGoals_7, s0_.sheet AS sheet_8, s0_.nrOfYellowCards AS nrOfYellowCards_9, s0_.directRedCard AS directRedCard_10, s0_.gameStartDateTime AS gameStartDateTime_11, s0_.updatedAt AS updatedAt_12, s0_.playerId AS playerId_13, s0_.gameRoundId AS gameRoundId_14 
FROM 	statistics s0_ 
		INNER JOIN gameRounds g1_ ON s0_.gameRoundId = g1_.id 
		INNER JOIN players p2_ ON s0_.playerId = p2_.id 
		INNER JOIN formationPlaces f3_ ON (p2_.id = f3_.playerId) 
		INNER JOIN formationLines f4_ ON f3_.formationLineId = f4_.id 
WHERE 	f4_.formationId = 165 
AND g1_.id = 75
-- AND g1_.number = 5


select * from playerTotals pt where playerId = 2617

select 	* 
from 	teamPlayers tpl 
		join persons p on p.id = tpl.personId 
		join gameParticipations gp on gp.playerId = tpl.id 
		-- join gameGoalEvents gge on gge.assistGameParticipationId = gp.id 
where p.lastName = 'Ginkel'
order by gp.playerId 

-- gameParticipations for league-start-end
select gmPa.*, c.* from gameParticipations gmPa join teamPlayers tmPl on tmPl.id = gmPa.playerId  
		join againstGamePlaces agGmPl on agGmPl.id = gmPa.againstGamePlaceId
		join places pl on pl.id = agGmPl.placeId
		join poules p on p.id = pl.pouleId
		join rounds r on r.id = p.roundId
		join structureCells sc on r.structureCellId = sc.id
		join categories c on c.id = sc.categoryId
where tmPl.startDateTime <= '2023-07-01' and tmPl.endDateTime >= '2022-07-01'

select * from teamPlayers where personId in (647,659)

select * from formationPlaces fp where playerId in ( select id from players where personId = 647 );

update formationPlaces set playerId = ( select id from players where personId = 659 ) where playerId in ( select id from players where personId = 647 );
update teamPlayers set startdatetime = '2022-07-31 00:00:00.000' where personId = 659;
delete from teamPlayers where personId = 647;
delete from players where personId = 647;
delete from persons where id = 647;

delete from teamPlayers where personId = 647;

select * from gameParticipations gp where gp.playerId in (select id from teamPlayers where personId in (647,659))

select * from players where personId in (647,659)

delete from teamPlayers 

select * from externalPersons ep where importableObjectId in (647,659) 


-- CHECK IF ALL FORMATIONS HAVE 15 PLAYERS
-- SELECT 	a.name, u.name, fl.id, fl.number, fp.number, t.name, tp.line, tp.startdatetime , tp.enddatetime,  pn.firstName, pn.nameInsertion, pn.lastName 
SELECT 	distinct pu.id
FROM 	poolUsers pu
		join users u on u.id = pu.userId		
		join pools p on p.id = pu.poolId 
		join competitionConfigs cc on cc.id = p.competitionConfigId 
-- 		join competitions c on c.id = cc.sourceCompetitionId 
		join poolCollections pc on pc.id = p.collectionId 
		join associations a on a.id = pc.associationId
		join formations f on f.id = pu.assembleFormationId
--		join viewPeriods vp on vp.id = f.viewPeriodId  and cc.assemblePeriodId = 
		join formationLines fl on fl.formationId = f.id
		join formationPlaces fp on fp.formationLineId = fl.id 
		left join teamPlayers tp on tp.id = fp.playerId 
		left join persons pn on pn.id = tp.personId  
		left join teams t on t.id = tp.teamId 
-- where 	a.name = 'kamp duim' -- and u.name = 'coen'
where 	(select count(*) from formationPlaces fpSub join formationLines flSub on fpSub.formationLineId = flSub.id  where flSub.formationId = f.id ) <> 15 
order by pu.id -- a.name, u.name, fl.number, fp.number




SELECT 	p0_.id AS id_0, p0_.totalPoints AS totalPoints_1, p0_.totalsId AS totalsId_2, p0_.viewPeriodId AS viewPeriodId_3, p0_.personId AS personId, p1_.*
FROM 	players p0_ 
		INNER JOIN persons p1_ ON p0_.personId = p1_.id 
		INNER JOIN teamPlayers t2_ ON (p1_.id = t2_.personId) 
WHERE p0_.viewPeriodId = 8 AND t2_.teamId = 7 
ORDER BY p0_.totalPoints DESC


