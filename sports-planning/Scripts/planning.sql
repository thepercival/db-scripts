
-- | id    | selfReferee | createdAt           | uniqueString                                                  | recreatedAt | minNrOfBatches | seekingPercentage | perPoule | nrOfSimSelfRefs |
-- +-------+-------------+---------------------+---------------------------------------------------------------+-------------+----------------+-------------------+----------+-----------------+
-- | 68146 |           2 | 2023-06-14 09:59:37 | [5,4] - [against(1vs1) h2h:gpp=>2:0 f(2)] - ref=>0:SP(1) - pp | NULL        |           NULL |                33 |        1 |               1 

-- show Plannings for inputId or uniqueString
select 	p.minNrOfBatchGames, p.maxNrOfBatchGames, p.maxNrOfGamesInARow, p.state, p.nrOfBatches , pi.*
from 	plannings p 
		join planningInputs pi on pi.id = p.inputId
where 	1 = 1
and		pi.uniqueString = '[5,4] - [against(1vs1) h2h:gpp=>2:0 f(2)] - ref=>0:SP(1) - pp'
-- and		pi.uniqueString = '[5,5,5,5] - [against(1vs1) h2h:gpp=>1:0 f(4)] - ref=>0:'
-- and		pi.uniqueString = '[17] - [against(2vs2) h2h:gpp=>0:16 f(1)] - ref=>0:'
-- and		p.maxNrOfGamesInARow = 1 and p.minNrOfBatchGames = 4  and p.maxNrOfBatchGames = 4
-- order by 	f.sportId, p.number, pl.number, tgp.gameRoundNumber

-- show inputs which misses plannings
select 	p.minNrOfBatchGames, p.maxNrOfBatchGames, p.maxNrOfGamesInARow, p.state, p.nrOfBatches , pi.*
from 	plannings p 
		join planningInputs pi on pi.id = p.inputId
where 	1 = 1
AND 	not exists( 
			select 	* 
			from 	plannings pSub
			WHERE	pSub.inputId = p.inputId
			AND		pSub.minNrOfBatchGames = p.minNrOfBatchGames
			AND		pSub.maxNrOfBatchGames = p.maxNrOfBatchGames
			AND		pSub.maxNrOfGamesInARow = (p.maxNrOfGamesInARow - 1) 
		)
and 	p.maxNrOfGamesInARow > 0
-- and		pi.uniqueString = '[5,5,5,5] - [against(1vs1) h2h:gpp=>1:0 f(4)] - ref=>0:'
-- AND 	pi.id > 62099 and pi.id < 63000
-- and		p.maxNrOfGamesInARow = 1 and p.minNrOfBatchGames = 4  and p.maxNrOfBatchGames = 4
-- order by 	f.sportId, p.number, pl.number, tgp.gameRoundNumber

select 	p.minNrOfBatchGames, p.maxNrOfBatchGames, p.maxNrOfGamesInARow, p.state, p.nrOfBatches , pi.*
from 	plannings p 
		join planningInputs pi on pi.id = p.inputId
where 	pi.id = 62731
-- and 	p.minNrOfBatchGames = 2
-- AND		p.maxNrOfBatchGames = 2
order by p.minNrOfBatchGames, p.maxNrOfBatchGames, p.maxNrOfGamesInARow 

select * from tournaments t join competitions c on c.id = t.competitionId where c.startDateTime > '2023-04-23' and c.startDateTime < '2023-04-24'

-- update query to let it be recalculating
update planningInputs set recreatedAt = null, seekingPercentage = -1, minNrOfBatches = (select min(nrOfBatches) from plannings p where p.inputId = planningInputs.id and p.state = 2) where id = 60636;
-- php bin/console.php app:recalculate-planning-inputs --id-range=60418-60418
-- php bin/console.php app:recalculate-planning-inputs --id-range=60418-60418

select * from  

select * from planningInputs pi where pi.uniqueString 	 = '[5] - [against(1vs1) h2h:gpp=>1:0 f(1)] - ref=>0:'; 

select * from planningInputs pi where pi.uniqueString 	 = '[5,5,5,5] - [against(1vs1) h2h:gpp=>1:0 f(4)] - ref=>0:';

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

select * from plannings where inputId = 65656 order by minNrOfBatchGames, maxNrOfBatchGames, maxNrOfGamesInARow

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

select * from planningSchedules ps where ps.sportsConfigName = '[{"nrOfGamePlaces":1,"nrOfGamesPerPlace":5},{"nrOfGamePlaces":1,"nrOfGamesPerPlace":5},{"nrOfHomePlaces":1,"nrOfAwayPlaces":1,"nrOfGamesPerPlace":2}]'

select * from planningSchedules ps where ps.sportsConfigName like '%"nrOfGamePlaces":1,"nrOfGamesPerPlace":5%'

select * from plannings p join planningInputs pi on pi.id = p.inputId where pi.recreatedAt is not null and p.validity > -1

select * from plannings p join planningInputs pi on pi.id = p.inputId where p.validity > 0 and p.state = 2

select * from plannings where inputId = 64000 and state = 2;

select * from plannings where id = 708857;

-- 26 nrOfBatches (3/4-6)
select p.*, 'input =>', pi.* from plannings p join planningInputs pi on pi.id = p.inputId where pi.id in (65656) and state = 2 order by inputId

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
