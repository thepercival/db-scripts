-- assemble formation for poolUser: 'joris', pool 'kamp duim' and gameRound 6
SELECT 	a.name, u.name, fl.number, fp.number, t.name, tp.line, tp.startdatetime , tp.enddatetime,  pn.firstName, pn.nameInsertion, pn.lastName, s.* 
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
		left join persons pn on pn.id = spl.personId
		left join teamPlayers tp on tp.personId = pn.id and tp.startdatetime < avp.endDateTime and tp.enddatetime > avp.startDateTime 
		left join teams t on t.id = tp.teamId 
		left join statistics s on s.playerId = spl.id
where 	a.name = 'kamp duim' and u.name = 'coen'  and gr.number = 6
order by a.name, u.name, fl.number, fp.number

-- insert into formationPlaces(formationLineId, number, playerId, penaltyPoints ) values (48, 1, null, 0);


select 	* 
from 	teamPlayers tpl 
		join persons p on p.id = tpl.personId 
		join gameParticipations gp on gp.playerId = tpl.id
		-- join gameGoalEvents gge on gge.assistGameParticipationId = gp.id 
where p.lastName = 'Karlsson'
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