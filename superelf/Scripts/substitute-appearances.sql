-- assemble formation for poolUser: 'joris', pool 'kamp duim' and gameRound 6
SELECT 	a.name, s2.name, u.name, gr.number as gameRound, fl.id,  fl.number as line, sa.*
FROM 	poolUsers pu
		join users u on u.id = pu.userId		
		join pools p on p.id = pu.poolId 
		join competitionConfigs cc on cc.id = p.competitionConfigId 
		join competitions c on cc.sourceCompetitionId  = c.id
		join seasons s2 on s2.id  = c.seasonId 
		join assemblePeriods ap on ap.id = cc.assemblePeriodId 
		join viewPeriods avp on avp.id = ap.viewPeriodId 
		join gameRounds gr on gr.viewPeriodId = avp.id
		join poolCollections pc on pc.id = p.collectionId 
		join associations a on a.id = pc.associationId
		join formations f on f.id = pu.assembleFormationId
		join formationLines fl on fl.formationId = f.id
		join formationPlaces fp on fp.formationLineId = fl.id 
-- 		join players spl on fp.playerId = spl.id
-- 		left join persons pn on pn.id = spl.personId
--		left join teamPlayers tp on tp.personId = pn.id and tp.startdatetime < avp.endDateTime and tp.enddatetime > avp.startDateTime 
--		left join teams t on t.id = tp.teamId 
--		left join statistics s on s.playerId = spl.id
		left join substituteAppearances sa on fl.id = sa.formationLineId and gr.id = sa.gameRoundId
where 	a.name = 'kamp duim' and s2.name = '2022/2023' and u.name = 'coen' and gr.number = 24
order by a.name, u.name, gr.number, fl.number

-- transfer formation for poolUser: 'joris', pool 'kamp duim' and gameRound 6
SELECT 	fl.id, a.name, s2.name, u.name, gr.number as gameRound, fl.id,  fl.number as line, sa.*
FROM 	poolUsers pu
		join users u on u.id = pu.userId		
		join pools p on p.id = pu.poolId 
		join competitionConfigs cc on cc.id = p.competitionConfigId 
		join competitions c on cc.sourceCompetitionId  = c.id
		join seasons s2 on s2.id  = c.seasonId 
		join transferPeriods tfp on tfp.id = cc.transferPeriodId 
		join viewPeriods tvp on tvp.id = tfp.viewPeriodId 
		join gameRounds gr on gr.viewPeriodId = tvp.id
		join poolCollections pc on pc.id = p.collectionId 
		join associations a on a.id = pc.associationId
		join formations f on f.id = pu.assembleFormationId
		join formationLines fl on fl.formationId = f.id
		join formationPlaces fp on fp.formationLineId = fl.id 
-- 		join players spl on fp.playerId = spl.id
-- 		left join persons pn on pn.id = spl.personId
--		left join teamPlayers tp on tp.personId = pn.id and tp.startdatetime < avp.endDateTime and tp.enddatetime > tvp.startDateTime 
--		left join teams t on t.id = tp.teamId 
--		left join statistics s on s.playerId = spl.id
		left join substituteAppearances sa on fl.id = sa.formationLineId and gr.id = sa.gameRoundId
where 	a.name = 'kamp duim' and s2.name = '2022/2023' and u.name = 'coen' and gr.number = 24
order by a.name, u.name, gr.number, fl.number

select * from substituteAppearances sa -- on fl.id = sa.formationLineId and gr.id = sa.gameRoundId

select * from formations f

select * from formations f  

select * from substituteAppearances sa join gameRounds gr on gr.id = sa.gameRoundId where sa.formationLineId = 330

-- insert into substituteAppearances( formationLineId, gameRoundId )
-- (
select fl.id, fl.number, gr.number,
(select  count(*) from    statistics s
			join formationPlaces fpl on fpl.playerId = s.playerId and fpl.formationLineId = fl.id                    
            where s.gameRoundId = gr.id and s.beginMinute > -1 and fpl.`number` > 0 
            ) as nrOfAppearances
-- 			(select  gr.`number`
--             from    statistics ssub
--                     join formationPlaces fpl on fpl.playerId = ssub.playerId and fpl.formationLineId = fl.id
--                     join gameRounds gr on gr.viewPeriodId = f.viewPeriodId and gr.id = ssub.gameRoundId
--             where   ssub.beginMinute = -1 and fpl.`number` > 0) as rnef
from    formationLines fl 
        join formations f on fl.formationId = f.id
		join viewPeriods vp on vp.id = f.viewPeriodId 
		join gameRounds gr on gr.viewPeriodId = vp.id 
where 	exists (
            select  *
            from    statistics s
                    join formationPlaces fpl on fpl.playerId = s.playerId and fpl.formationLineId = fl.id
                    join gameRounds grSub on grSub.viewPeriodId = f.viewPeriodId and grSub.id = s.gameRoundId
            where   s.beginMinute = -1 and fpl.`number` > 0 and s.gameRoundId = gr.id )
-- and
--         (select count(*)
--         from    statistics s
--                 join formationPlaces fpl on fpl.playerId = s.playerId and fpl.formationLineId = fl.id
--                 join gameRounds grSub on grSub.viewPeriodId = f.viewPeriodId and grSub.id = s.gameRoundId
-- 		where   fpl.`number` > 0 and s.gameRoundId = gr.id )
--       ) = (select count(*) from formationPlaces where formationLineId = fl.id and number > 0) 
and   gr.number = 7
-- and 	a.name = 'kamp duim' and s2.name = '2022/2023' and u.name = 'boy' and gr.number = 7

      
      