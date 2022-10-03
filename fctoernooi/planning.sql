
-- compare planning.nrOfBatches of the maxBatchNumber of the games
select 	*, GREATEST(coalesce((select max(batchNr) from planningGamesAgainst pga where pga.planningId = p.id ), 0), coalesce((select max(batchNr) from planningGamesTogether pgt where pgt.planningId = p.id ), 0)) as maxBatchNrByGames
from 	plannings p 
where 	p.state = 2
and		GREATEST(coalesce((select max(batchNr) from planningGamesAgainst pga where pga.planningId = p.id ), 0), coalesce((select max(batchNr) from planningGamesTogether pgt where pgt.planningId = p.id ), 0)) <> p.nrOfBatches
order by	inputId

-- set input MinNrOfBatches
update 	planningInputs
set		minNrOfBatches = (select min(nrOfBatches) from plannings p where p.inputId = planningInputs.id and p.state = 2)
-- where 	(select count(*) from plannings where inputId = planningInputs.id and plannings.state = 2) > 1
-- where	id = 60395 -- (29,30,35)
;

delete pcbase from planningConfigs pcbase join ( select rn.planningConfigId from roundNumbers rn join planningConfigs pc on rn.planningConfigId = pc.id where ( select count(*) from roundNumbers rnsub join planningConfigs pcsub on rnsub.planningConfigId = pcsub.id and rnsub.number < rn.number and rnsub.competitionId = rn.competitionId where	csub.enableTime = pc.enableTime and pcsub.minutesPerGame = pc.minutesPerGame and pcsub.minutesPerGameExt = pc.minutesPerGameExt and pcsub.minutesInBetween = pc.minutesInBetween and pcsub.minutesBetweenGames = pc.minutesBetweenGames and pcsub.selfReferee = pc.selfReferee and pcsub.extension = pc.extension and pcsub.editMode = pc.editMode) ) rnbase on rnbase.planningConfigId = pcbase.id;

select count(*) from planningInputs where recreatedAt is null

update planningInputs set recreatedAt = null

select * from plannings where inputId = 61193 order by minNrOfBatchGames, maxNrOfBatchGames, maxNrOfGamesInARow

-- compare MinNrOfBatches with new
select 	*, (select min(nrOfBatches) from plannings p where p.inputId = pi.id and p.state = 2) as newMinNrOfBatches
from 	planningInputs pi
-- where 	(select count(*) from plannings where inputId = planningInputs.id and plannings.state = 2) > 1
-- where	id = 60395 -- (29,30,35)
where	pi.recreatedAt is not null 
and 		pi.minNrOfBatches is not null 
and 		(select min(nrOfBatches) from plannings p where p.inputId = pi.id and p.state = 2) is not null 
and 		pi.minNrOfBatches <> (select min(nrOfBatches) from plannings p where p.inputId = pi.id and p.state = 2)
order by  pi.minNrOfBatches - (select min(nrOfBatches) from plannings p where p.inputId = pi.id and p.state = 2)


-- planning input
select *, (select count(*) from planningGamesAgainst pg join planningPoules pp on pp.id = pg.pouleId where pg.planningId = p.id ) from planningInputs pi left join plannings p on p.inputId = pi.id 
where pi.id = 60350 order by pi.id, p.minNrOfBatchGames desc, p.maxNrOfBatchGames desc, p.maxNrOfGamesInARow asc;

-- input with no succeeded-plannings 
select count(*) from planningInputs where not exists( select * from plannings where inputId = planningInputs.id and state = 2 );

-- input with tobeprocessed-plannings 
select * from planningInputs where exists( select * from plannings where inputId = planningInputs.id and state = 1 ) order by createdAt desc;

-- schedules
select 	
		distinct g.id, g.gameRoundNumber, ss.gameMode as GameMode, ss.nrOfHomePlaces, ss.nrOfAwayPlaces, ss.nrOfH2H, ss.nrOfGamesPerPlace, ss.number as sportScheduleNr	-- Against
--		gp.id, gp.gameRoundNumber, ss.gameMode as GameMode, nrOfHomePlaces, nrOfAwayPlaces	-- Together(Single|AllInOneGame)
, s.*
from 	planningScheduleGamePlaces gp 
		join planningScheduleGames g on g.id = gp.gameId 
		join planningSportSchedules ss on ss.id = g.sportScheduleId
		join planningSchedules s on s.id = ss.scheduleId
where 	s.nrOfPlaces = 20 and s.gamePlaceStrategy = 1 and	s.sportsConfigName = '[{"nrOfHomePlaces":2,"nrOfAwayPlaces":2,"nrOfGamesPerPlace":4}]' -- schedulefilter
and		ss.number = 1 																										-- sportScheduleNr
order by 	s.nrOfPlaces, s.gamePlaceStrategy, s.sportsConfigName, g.gameRoundNumber, gp.gameId
-- 		distinct g.id, g.gameRoundNumber, ss.gameMode as GameMode, ss.nrOfHomePlaces, ss.nrOfAwayPlaces, ss.nrOfH2H, ss.nrOfGamesPerPlace, ss.number as sportScheduleNr	-- Against
--		gp.id, gp.gameRoundNumber, ss.gameMode as GameMode, nrOfHomePlaces, nrOfAwayPlaces	-- Together(Single|AllInOneGame)


-- togehter gameplaces
select 	p.number as pouleNr, pl.number as placeNr, s.number as sport, tgp.gameRoundNumber, tg.id, tg.batchNr, f.number as fieldNr
from 	planningGamePlacesTogether tgp
		join planningGamesTogether tg on tg.id = tgp.gameId 		
		join planningPlaces pl on pl.id = tgp.placeId 
		join planningPoules p on p.id = tg.pouleId 		
		join planningFields f on f.id = tg.fieldId 
		join planningSports s on s.id = f.sportId
		join plannings pln on pln.id = tg.planningId
		join planningInputs pi on pi.id = pln.inputId
where 	pi.uniqueString = '[3] - [single(1) gpp=>1 f(1) & against(1vs1) h2h:gpp=>1:0 f(1) & against(1vs1) h2h:gpp=>1:0 f(1) & against(1vs1) h2h:gpp=>1:0 f(1) & single(2) gpp=>1 f(1) & against(1vs1) h2h:gpp=>1:0 f(1)] - gpstrat=>eql - ref=>0:SP'
and		pln.maxNrOfGamesInARow = 0
order by 	f.sportId, p.number, pl.number, tgp.gameRoundNumber


select * from plannings p join planningInputs pi on pi.id = p.inputId where pi.recreatedAt is not null and p.validity > -1

select p.*, 'input =>', pi.* from plannings p join planningInputs pi on pi.id = p.inputId where pi.id in (62094) order by inputId

select 	* 
from 	plannings pl 
where 	pl.maxNrOfGamesInARow > 0 
and 		exists ( 
			select 	* 
			from 	plannings plLess 
			where 	plLess.inputId = pl.inputId 
			and 		plLess.minNrOfBatchGames = pl.minNrOfBatchGames and plLess.maxNrOfBatchGames = pl.maxNrOfBatchGames 
			and 		plLess.maxNrOfGamesInARow > pl.maxNrOfGamesInARow
			and		pl.state = 2 and pl.nrOfBatches >= plLess.nrOfBatches
		)
		and pl.inputId = 62094

delete	plbase from plannings plbase join
		( 
			select pl.id
			from 	plannings pl 
			where 	pl.maxNrOfGamesInARow > 0 
			and 		exists ( 
						select 	* 
						from 	plannings plLess 
						where 	plLess.inputId = pl.inputId 
						and 		plLess.minNrOfBatchGames = pl.minNrOfBatchGames and plLess.maxNrOfBatchGames = pl.maxNrOfBatchGames 
						and 		plLess.maxNrOfGamesInARow > pl.maxNrOfGamesInARow
						and		pl.state = 2 and pl.nrOfBatches >= plLess.nrOfBatches
					)
		) plTmp on plTmp.id = plbase.id
