delete from planningInputs

-- fields
select 	* 
from 	fields f 
		join competitionSports cs on f.competitionSportId = cs.id 
		join competitions c on c.id = cs.competitionId 
		join tournaments t on t.competitionid = c.id 
where 	t.id = 8628;

-- place
select 	* 
from 	places pl 
		join poules p on pl.pouleid = p.id 
		join rounds r on p.roundid = r.id 
		join roundNumbers rn on r.numberid = rn.id 
		join competitions c on c.id = rn.competitionId 
		join tournaments t on t.competitionid = c.id 
where 	t.id = 8628;

-- againstGames
select 	ag.*, agpl.side, p.number as pouleNr, pl.placeNr, refP.number as refPouleNr, refPl.placeNr as refPlaceNr, qg.target
from 	againstGames ag 
		join againstGamePlaces agpl on agpl.gameId = ag.Id 
		join places pl on pl.id = agpl.placeId 
		join poules p on pl.pouleid = p.id 
		join rounds r on p.roundid = r.id 
		left join qualifyGroups qg on qg.id = r.parentQualifyId
		left join places refPl on refPl.id = ag.placerefereeId
		left join poules refP on refP.id = refPl.pouleId
		join roundNumbers rn on r.numberid = rn.id 
		join competitions c on c.id = rn.competitionId 
		join tournaments t on t.competitionid = c.id 
where 	t.id = 8628 and rn.number = 2
order by	ag.id, agpl.side;

-- prod query to view same games
select g.*, p.number as pouleNr, ref.number as refPlaceNr, pref.number as refPouleNr, qg.winnersOrLosers from games g left join places ref on ref.id = g.placerefereeid left join poules pref on ref.pouleid = pref.id join poules p on g.pouleid = p.id join rounds r on r.id = p.roundid left join qualifygroups qg on qg.id = r.parentQualifyId join roundnumbers rn on rn.id = r.numberid join tournaments t on t.competitionid = rn.competitionid where t.id = 8628 and rn.number = 2 order by qg.winnersOrLosers;

-- wrong referees

-- againstGames
select 	ag.*, agpl.side, p.number as pouleNr, pl.placeNr, pl.id as placeId, refP.number as refPouleNr, refPl.placeNr as refPlaceNr, qg.target, rn.number as roundNumber
from 	againstGames ag 
		join againstGamePlaces agpl on agpl.gameId = ag.Id 
		join places pl on pl.id = agpl.placeId 
		join poules p on pl.pouleid = p.id 
		join rounds r on p.roundid = r.id 
		left join qualifyGroups qg on qg.id = r.parentQualifyId
		left join places refPl on refPl.id = ag.placerefereeId
		left join poules refP on refP.id = refPl.pouleId
		join roundNumbers rn on r.numberid = rn.id 
		join competitions c on c.id = rn.competitionId 
		join tournaments t on t.competitionid = c.id 
where 	t.id = 9209 -- and rn.number = 1 and refP.number > (select count(*) from poules where roundid = r.id)
order by	ag.id, agpl.side;

-- 23 toernooien
select 	distinct t.id
from 	againstGames ag 
		join againstGamePlaces agpl on agpl.gameId = ag.Id 
		join places pl on pl.id = agpl.placeId 
		join poules p on pl.pouleid = p.id 
		join rounds r on p.roundid = r.id 
		left join qualifyGroups qg on qg.id = r.parentQualifyId
		left join places refPl on refPl.id = ag.placerefereeId
		left join poules refP on refP.id = refPl.pouleId
		join roundNumbers rn on r.numberid = rn.id 
		join competitions c on c.id = rn.competitionId 
		join tournaments t on t.competitionid = c.id 
where 	refP.number > (select count(*) from poules where roundid = r.id)
order by	ag.id, agpl.side;



-- old compeitors
select 	pl.* 
from 	places pl 
		join poules p on p.Id = pl.pouleid
		join rounds r on r.id = p.roundid
		join roundNumbers rn on rn.id = r.numberid
		join competitions c on c.id = rn.competitionid
		join tournaments t on t.competitionid = c.id 
where 	t.id = 8628;

select	*
from		places p 
		join competitors c on c.id = p.competitorid 
		join poules po on po.id = p.pouleid 
		join rounds r on r.id = po.roundid 
		join roundNumbers rn on rn.id = r.numberid and rn.number = 1 
		join tournaments t on t.competitionId = rn.competitionId 
where 	t.id = 8628;
-- set 		c.placeNr = p.placeNr, c.pouleNr = po.number;


update 	places p 
		join competitors c on c.id = p.competitorid 
		join poules po on po.id = p.pouleid 
		join rounds r on r.id = po.roundid 
		join roundNumbers rn on rn.id = r.numberid and rn.number = 1 
		join tournaments t on t.competitionId = rn.competitionId 
set 		c.placeNr = p.placeNr, c.pouleNr = po.number;

-- competitors
select 	* 
from 	competitors cr 
		join tournaments t on t.id = cr.tournamentId 
where 	t.id = 147;

select 	* 
from 	tournaments t 
		join competitions c on t.competitionid = c.id 
		join leagues l on l.id = c.leagueid 
where 	t.id = 147;

-- leagues
select 	t.*, l.id, l.name, l.associationid
from 	tournaments t 
		join competitions c on t.competitionid = c.id 
		join leagues l on l.id = c.leagueid 
where 	t.id = 219;

select * from leagues where associationid = 83

select * from tournamentusers where tournamentid = 1085;

update tournamentusers set userid = 5 where tournamentid = 6214;

delete from planningInputs

select * from planningInputs i where i.id < 15195 and not exists( select * from plannings where inputId = i.id and state = 2)



select * from roundnumbers where competitionid = 101

select * from rounds where id = 909

select * from tournaments where competitionid is null

select * from rounds r join roundnumbers rn on r.numberid = rn.id join tournaments t on t.competitionid = rn.competitionid where rn.number > 1 and r.parentQualifyId is null and t.updated = 1

select	* -- delete  r.*
from 	rounds r
            join roundnumbers rn on rn.id = r.numberid
            join competitions c on c.id = rn.competitionid
            join leagues l on l.id = c.leagueid
            join tournaments t on t.competitionid = c.id
where 	not exists ( select * from games g join poules p on p.id = g.pouleid where p.roundid = r.id )
and	    not exists( select * from qualifygroups where roundid = r.id );

select * from poules where id = 7188

select * from games where pouleId = 7188

select * from tournaments order by id desc


