-- assemble formation Of poolUser 'joris' of pool 'kamp duim'
SELECT 	fl.id, pl.id, a.name, u.name, fl.id, fl.number as lineNr, fp.number as placeNr, fp.totalPoints as total, t.name as team, tpl.line as lineNr, tpl.startdatetime , tpl.enddatetime,  pn.firstName, pn.nameInsertion, pn.lastName 
FROM 	poolUsers pu
		join users u on u.id = pu.userId		
		join pools p on p.id = pu.poolId 
		join competitionConfigs cc on cc.id = p.competitionConfigId 
		join competitions c on c.id = cc.sourceCompetitionId
		join seasons s on s.id  = c.seasonId 
		join poolCollections pc on pc.id = p.collectionId 
		join associations a on a.id = pc.associationId
		join formations f on f.id = pu.assembleFormationId
		join formationLines fl on fl.formationId = f.id
		join formationPlaces fp on fp.formationLineId = fl.id 
		left join players pl on pl.id = fp.playerId 
		left join persons pn on pn.id = pl.personId
		left join teamPlayers tpl on tpl.personId  = pn.id
		left join teams t on t.id = tpl.teamId 
where 	a.name = 'kamp duim' and s.name = '2022/2023' and u.name = 'boy'
order by a.name, u.name, fl.number, fp.number

-- insert into formationPlaces(formationLineId, number, playerId, penaltyPoints ) values (48, 1, null, 0);
select * from playerTotals pt where pt.id = 1582

select * from teamPlayers tpl join persons p on p.id = tpl.personId where p.lastName = 'Toornstra';
delete from teamPlayers where id = 383;
update teamPlayers set startdatetime = '2022-08-22 00:00:00.000' where id = 342;
select * from teamPlayers tpl join persons p on p.id = tpl.personId where p.lastName = 'Toornstra';

select * from gameParticipations gp where gp.playerId = 383


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