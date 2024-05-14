-- planningSchedules
select * from planningSchedules s

-- planningSportSchedules
select * from planningSportSchedules ss

select 	s.id as scheduleId, s.nrOfPlaces, s.sportsConfigName, ss.number as sportNr, 
IF( ss.gameMode = 1, 'Single', IF( ss.gameMode = 2, 'Against', 'AllInOneGame' ) ) as GmMode                          
from 	planningSportSchedules ss join planningSchedules s on s.id = ss.scheduleId  
order by s.id, sportNr

-- planningScheduleGames
select * from planningScheduleGames sg

select 	s.id as scheduleId, s.nrOfPlaces, s.sportsConfigName, ss.number as sportNr
,		IF( ss.gameMode = 1, 'Single', IF( ss.gameMode = 2, 'Against', 'AllInOneGame' ) ) as GmMode, sg.gameRoundNumber as gmRoundNr
from 	planningScheduleGames sg join planningSportSchedules ss on sg.sportScheduleId = ss.id join planningSchedules s on s.id = ss.scheduleId  
order by s.id, sportNr, sg.gameRoundNumber

-- planningScheduleGamePlaces
select * from planningScheduleGamePlaces sgp

select 	s.id as scheduleId, s.nrOfPlaces, s.sportsConfigName, ss.number as sportNr
,		IF( ss.gameMode = 1, 'Single', IF( ss.gameMode = 2, 'Against', 'AllInOneGame' ) ) as GmMode, sg.gameRoundNumber as gmRoundNr
from 	planningScheduleGamePlaces sgp 
		join planningScheduleGames sg on sgp.gameId = sg.id
		join planningSportSchedules ss on sg.sportScheduleId = ss.id join planningSchedules s on s.id = ss.scheduleId  
order by s.id, sportNr, sg.gameRoundNumber

select * from planningSchedules where nrOfPlaces=6 
and sportsConfigName='[{"nrOfGamesPerPlace":5,"nrOfGamePlaces":1},{"nrOfGamesPerPlace":5,"nrOfGamePlaces":1},{"nrOfGamesPerPlace":1,"nrOfGamePlaces":1},{"nrOfHomePlaces":1,"nrOfAwayPlaces":1,"nrOfGamesPerPlace":2}]'


select * from plannings where inputId = 65818 and state = 2

select * from planningInputs limit 10




