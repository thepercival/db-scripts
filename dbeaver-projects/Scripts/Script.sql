

select gp.*, p.* from gameParticipations gp join teamPlayers tp on tp.id = gp.playerId join persons p on p.id = tp.personId where beginMinute = 58

select gp.*, p.* from gameParticipations gp join teamPlayers tp on tp.id = gp.playerId join persons p on p.id = tp.personId where endMinute = 58

select * from playerTotals


select * from formationPlaces where totalsId is null 675 - 704

-- pool competitions
delete from poolUsers where not exists ( select * from competitors c where c.poolUserId = poolUsers.id);

delete from pools where not exists ( select * from poolUsers pu where pu.poolId = pools.id);

delete from formations where not exists ( select * from poolUsers pu where pu.assembleFormationId  = formations.id);

select * from competitionSports cs join competitions c join leagues l on l.id = c.leagueId  on c.id = cs.competitionId join sports s on s.id = cs.sportId  where l.name in ('Cup', 'SuperCup')

select * from againstQualifyConfigs aqc join competitionSports cs on cs.id = aqc.competitionSportId join sports s on s.id = cs.sportId where s.name = 'superelf'

select * from chatMessagesUnread cmu 

INSERT INTO superelf.playerTotals
(nrOfWins, nrOfDraws, nrOfTimesStarted, nrOfTimesSubstituted, nrOfTimesSubstitute, nrOfTimesNotAppeared, nrOfFieldGoals, nrOfAssists, nrOfPenalties, nrOfOwnGoals, nrOfCleanSheets, nrOfSpottySheets, nrOfYellowCards, nrOfRedCards, updatedAt)
VALUES(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2022-09-15 00:20:00');

select * from playerTotals pt order by pt.id desc