-- delete s11Players
delete 	pl.*
from 	players pl
where 	pl.viewPeriodId in (select id from (
			(select cf.createAndJoinPeriodId as id from competitionConfigs cf join competitions c on c.id = cf.sourceCompetitionId  join leagues l on l.id = c.leagueId  join seasons s on c.seasonId = s.id where l.name = 'Eredvisie' and s.startDateTime <= '2016-07-01' and s.endDateTime >= '2015-07-01')
			union
			(select assPer.viewPeriodId as id from assemblePeriods assPer join competitionConfigs cf on cf.assemblePeriodId = assPer.id join competitions c on c.id = cf.sourceCompetitionId  join leagues l on l.id = c.leagueId  join seasons s on c.seasonId = s.id where l.name = 'Eredvisie' and s.startDateTime <= '2016-07-01' and s.endDateTime >= '2015-07-01')
			union
			(select trPer.viewPeriodId as id from transferPeriods trPer join competitionConfigs cf on cf.transferPeriodId = trPer.id join competitions c on c.id = cf.sourceCompetitionId  join leagues l on l.id = c.leagueId  join seasons s on c.seasonId = s.id where l.name = 'Eredvisie' and s.startDateTime <= '2016-07-01' and s.endDateTime >= '2015-07-01')
		) as tmp);

-- delete viewPeriods for league-start-end
delete 	vp.*
from 	viewPeriods vp
where 	vp.id in (select id from (
			(select cf.createAndJoinPeriodId as id from competitionConfigs cf join competitions c on c.id = cf.sourceCompetitionId  join leagues l on l.id = c.leagueId  join seasons s on c.seasonId = s.id where l.name = 'Eredvisie' and s.startDateTime <= '2016-07-01' and s.endDateTime >= '2015-07-01')
			union
			(select assPer.viewPeriodId as id from assemblePeriods assPer join competitionConfigs cf on cf.assemblePeriodId = assPer.id join competitions c on c.id = cf.sourceCompetitionId  join leagues l on l.id = c.leagueId  join seasons s on c.seasonId = s.id where l.name = 'Eredvisie' and s.startDateTime <= '2016-07-01' and s.endDateTime >= '2015-07-01')
			union
			(select trPer.viewPeriodId as id from transferPeriods trPer join competitionConfigs cf on cf.transferPeriodId = trPer.id join competitions c on c.id = cf.sourceCompetitionId  join leagues l on l.id = c.leagueId  join seasons s on c.seasonId = s.id where l.name = 'Eredvisie' and s.startDateTime <= '2016-07-01' and s.endDateTime >= '2015-07-01')
		) as tmp);

-- delete assemblePeriods for league-start-end
delete	assPd.*
from 	assemblePeriods assPd
		join competitionConfigs cf on cf.assemblePeriodId = assPd.id
		join competitions c on c.id = cf.sourceCompetitionId 
		join leagues l on l.id = c.leagueId 
		join seasons s on c.seasonId = s.id 
where 	l.name = 'Eredvisie' and s.startDateTime <= '2016-07-01' and s.endDateTime >= '2015-07-01';

-- delete transferPeriods for league-start-end
delete	trPd.*
from 	transferPeriods trPd 
		join competitionConfigs cf on cf.transferPeriodId = trPd.id
		join competitions c on c.id = cf.sourceCompetitionId 
		join leagues l on l.id = c.leagueId 
		join seasons s on c.seasonId = s.id 
where 	l.name = 'Eredvisie' and s.startDateTime <= '2016-07-01' and s.endDateTime >= '2015-07-01';

-- delete competitionConfigs
delete 	cf.* 
from 	competitionConfigs cf 
		join competitions c on c.id = cf.sourceCompetitionId 
		join seasons s on c.seasonId = s.id
		join leagues l on l.id = c.leagueId  
where 	l.name = 'Eredvisie' and s.startDateTime <= '2016-07-01' and s.endDateTime >= '2015-07-01';

-- delete competitions for pool
delete 	c.*
from		competitions c
		join seasons s on c.seasonId = s.id
		join leagues l on l.id = c.leagueId  
where 	l.name in ('Competition','Cup', 'SuperCup') and s.startDateTime <= '2016-07-01' and s.endDateTime >= '2015-07-01';

-- sports: delete competition
delete 	c.*
from		competitions c
		join seasons s on c.seasonId = s.id
		join leagues l on l.id = c.leagueId  
where 	l.name = 'Eredvisie' and s.startDateTime <= '2016-07-01' and s.endDateTime >= '2015-07-01';

-- sports: delete teamPlayers
delete 	tmPl.*
from		teamPlayers tmPl 
		join teams tm on tm.id = tmPl.teamId
		join teamCompetitors tmComp on tmComp.teamId = tm.id
		join competitions c on c.id = tmComp.competitionId 
		join seasons s on c.seasonId = s.id
		join leagues l on l.id = c.leagueId  
where 	l.name = 'Eredvisie' and s.startDateTime <= '2016-07-01' and s.endDateTime >= '2015-07-01'
and	 	tmPl.startDateTime <= '2016-07-01' and tmPl.endDateTime >= '2015-07-01';