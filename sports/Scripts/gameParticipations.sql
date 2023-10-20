-- gameParticipations for league-start-end
select gmPa.*, c.* from gameParticipations gmPa join teamPlayers tmPl on tmPl.id = gmPa.playerId  
		join againstGamePlaces agGmPl on agGmPl.id = gmPa.againstGamePlaceId
		join places pl on pl.id = agGmPl.placeId
		join poules p on p.id = pl.pouleId
		join rounds r on r.id = p.roundId
		join structureCells sc on r.structureCellId = sc.id
		join categories c on c.id = sc.categoryId
where tmPl.startDateTime <= '2023-07-01' and tmPl.endDateTime >= '2022-07-01'

select * from againstGames order by state desc

select id, name, expireDateTime from cacheItems where name like 'event%'

delete from cacheItems where name like 'event%'