-- planningSchedules
select count(*) from planningSchedules pss where succeededMargin < 0

select * from planningSchedules pss where nrOfTimeoutSecondsTried < 0

update planningSchedules set succeededMargin = 4, nrOfTimeoutSecondsTried = 0 where nrOfPlaces = 9 and sportsConfigName = '[{"nrOfHomePlaces":2,"nrOfAwayPlaces":2,"nrOfGamesPerPlace":25}]' 

select * from planningSchedules where nrOfPlaces = 9 and sportsConfigName = '[{"nrOfHomePlaces":2,"nrOfAwayPlaces":2,"nrOfGamesPerPlace":25}]'

select * from planningSchedules pss where succeededMargin > 0 order by nrOfTimeoutSecondsTried asc, succeededMargin desc

select * from planningSchedules pss order by id desc

delete from planningSchedules where id = 1395


select * from planningSchedules pss where pss.succeededMargin > 0 and pss.nrOfTimeoutSecondsTried = 0

update planningSchedules pss set nrOfTimeoutSecondsTried = 0 where nrOfTimeoutSecondsTried = -1