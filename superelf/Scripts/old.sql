SELECT Id, CompetitionsPerSeasonId, Name, Stake, Picture, StartDateTime, EndDateTime
FROM superelfold.Pools
order by StartDateTime;

SELECT p.FirstName, p.LastName, p.DateOfBirth, p.ExternId, b.StartDateTime, b.EndDateTime, b.Line, b.Number FROM Bets b join UsersPerPool pu on b.UsersPerPoolId = pu.Id join Persons p on b.PersonId = p.Id where pu.Id = 11 and b.StartDateTime > "2014-09-01 06:00:00" and b.StartDateTime < "2014-09-13 16:00:00" order by b.Line, b.Number


select * from CompetitionsPerSeason cps 

select * from Seasons s 


select * from competitions l 

SELECT p.FirstName, p.LastName, p.DateOfBirth, p.ExternId, b.StartDateTime, b.EndDateTime, b.Line, b.Number FROM Bets b join UsersPerPool pu on b.UsersPerPoolId = pu.Id join Persons p on b.PersonId = p.Id where pu.Id = 4 and b.EndDateTime > "2015-01-28 20:00:00" order by b.Line, b.Number

select * from UsersPerPool upp 

select * from UsersExt ue 