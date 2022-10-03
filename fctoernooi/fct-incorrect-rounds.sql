alter table roundnumbers drop foreign key FK_4A1A14D69762B879;

update sports set team = true, customId = 14 where name = 'ijshockey';

update tournaments set breakStartDateTime = null where breakStartDateTime is not null and breakDuration = 0;
update tournaments set breakEndDateTime = DATE_ADD(breakStartDateTime, INTERVAL breakDuration MINUTE) where breakStartDateTime is not null;
update planningconfigs set extension = ( minutesPerGameExt > 0 );

select * from planninginputs where structureConfig = '[4,3,3]' and nrOfReferees = 0 and nrOfHeadtohead = 1 and teamup = false and selfReferee = false

select * from planninginputs where id = 26013

select * from planninginputs where state = 2

select * from roundnumbers where not exists ( select * from rounds where numberid = roundnumbers.id )

select 	c.*, l.name, t.id, rn.hasplanning, rn.number
from 	rounds r 
		join roundnumbers rn on rn.id = r.numberid
		join competitions c on c.id = rn.competitionid
		join leagues l on l.id = c.leagueid
		join tournaments t on t.competitionid = c.id
where 	not exists ( select * from games g join poules p on p.id = g.pouleid where p.roundid = r.id )
-- and		not exists( select * from qualifygroups where roundid = r.id )
order by 	c.startDateTime desc;

delete	r.*
from 	rounds r 
		join roundnumbers rn on rn.id = r.numberid
		join competitions c on c.id = rn.competitionid
		join leagues l on l.id = c.leagueid
		join tournaments t on t.competitionid = c.id
where 	not exists ( select * from games g join poules p on p.id = g.pouleid where p.roundid = r.id )
and		not exists( select * from qualifygroups where roundid = r.id );

delete from qualifygroups where not exists ( select * from rounds where parentQualifyId = qualifygroups.id );

select 	*, ( select count(*) from poules where roundid = r.id ) as nrofpoules
, ( select count(*) from pouleplaces join poules on pouleplaces.pouleid = poules.id where roundid = r.id ) as nrofplaces
, ( select count(*) from games join poules on games.pouleid = poules.id where roundid = r.id ) as games
from 	rounds r		
		join roundnumbers rn on rn.id = r.numberid
		join tournaments t on t.competitionid = rn.competitionid
where 	t.id = 2479;

delete from qualifygroups where not exists ( select * from rounds where parentQualifyId = qualifygroups.id )

select * from qualifygroups

select * from sports order by name

update sports set name = 'honkbal', team = true, customId = 13 where id = 13;

select * from sports where customId > 0




update tournamentroles set userid = 5 where tournamentid = 3230