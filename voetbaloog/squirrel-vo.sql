-- poules ek 2021
select 	* 
from 	Poules p 
		join Rounds r on p.RoundId = r.Id 
		join CompetitionsPerSeason cs on cs.id = r.CompetitionsPerSeasonId 
		join Seasons s on s.Id = cs.SeasonId 
where 	s.Name = '2021' 
order by r.Number, p.Number

-- places ek 2021
select 	* 
from 	PoulePlaces pp		
		join Poules p on p.id = pp.PouleId
		join Rounds r on p.RoundId = r.Id 
		join CompetitionsPerSeason cs on cs.id = r.CompetitionsPerSeasonId 
		join Seasons s on s.Id = cs.SeasonId 
where 	s.Name = '2021' 
and		r.Number = 1
order by r.Number, p.Number

--  - qualifyrules
select 	qr.id, rfrom.Number as fromRoundNumber, rto.Number as toRoundNumber, qr.ConfigNr
from 	QualifyRules qr
		join Rounds rfrom on qr.FromRoundId = rfrom.Id 
		join CompetitionsPerSeason cs on cs.id = rfrom.CompetitionsPerSeasonId 
		join Seasons s on s.Id = cs.SeasonId 
		join Rounds rto on qr.ToRoundId = rto.Id 
where 	s.Name = '2021' 
and		rfrom.Number = 0
order by rfrom.Number

-- Bets
select	b.*, rbc.*, r.Number
from		Bets b
		join RoundBetConfigs rbc on rbc.id = b.RoundBetConfigId
		join Rounds r on r.id = rbc.RoundId
		join UsersPerPool pu on pu.id = b.UsersPerPoolId
		join UsersExt u on u.id = pu.UserId
		join Pools p on p.id = pu.PoolId
		join CompetitionsPerSeason cs on cs.id = p.CompetitionsPerSeasonId
		join Seasons s on s.id = cs.SeasonId
where	u.LoginName = 'coen' and p.name = 'Familie Duim' and s.Name = '2021' and rbc.BetType = 1 and r.Number = 1
order by 	b.Id

select * from Seasons

select * from Pools where Name = 'Familie Duim'

update QualifyRules set ConfigNr = 2 where Id = 370;

-- pouleplace - qualifyrules
select 	ppqr.id, rfrom.Number as fromRoundNumber, pfrom.Number as fromPouleNumber, ppfrom.Number as fromPlaceNumber, rto.Number as toRoundNumber, pto.Number as toPouleNumber, ppto.Number as toPlaceNumber, ppqr.QualifyRuleId, rfrom.Id 
from 	PoulePlaceQualifyRules ppqr
		join PoulePlaces ppfrom on ppfrom.Id = ppqr.FromPoulePlaceId		
		join Poules pfrom on pfrom.id = ppfrom.PouleId
		join Rounds rfrom on pfrom.RoundId = rfrom.Id 
		join CompetitionsPerSeason cs on cs.id = rfrom.CompetitionsPerSeasonId 
		join Seasons s on s.Id = cs.SeasonId 
		join PoulePlaces ppto on ppto.Id = ppqr.ToPoulePlaceId
		join Poules pto on pto.id = ppto.PouleId
		join Rounds rto on pto.RoundId = rto.Id 
where 	s.Name = '2021' 
and		rfrom.Number = 0
order by rfrom.Number, pto.Number, ppto.Number, pfrom.Number, ppfrom.Number;

update PoulePlaceQualifyRules set FromPoulePlaceId = ( select PP.Id from PoulePlaces PP join Poules P on P.Id = PP.PouleId where P.RoundId = 87 and P.Number = 0 and PP.Number = 0 ) where Id = 374;
update PoulePlaceQualifyRules set FromPoulePlaceId = ( select PP.Id from PoulePlaces PP join Poules P on P.Id = PP.PouleId where P.RoundId = 87 and P.Number = 1 and PP.Number = 0 ) where Id = 371;
update PoulePlaceQualifyRules set FromPoulePlaceId = ( select PP.Id from PoulePlaces PP join Poules P on P.Id = PP.PouleId where P.RoundId = 87 and P.Number = 0 and PP.Number = 2 ) where Id = 383; -- ADEF
update PoulePlaceQualifyRules set FromPoulePlaceId = ( select PP.Id from PoulePlaces PP join Poules P on P.Id = PP.PouleId where P.RoundId = 87 and P.Number = 5 and PP.Number = 0 ) where Id = 369;
update PoulePlaceQualifyRules set FromPoulePlaceId = ( select PP.Id from PoulePlaces PP join Poules P on P.Id = PP.PouleId where P.RoundId = 87 and P.Number = 2 and PP.Number = 2 ) where Id = 381; -- ABC
update PoulePlaceQualifyRules set FromPoulePlaceId = ( select PP.Id from PoulePlaces PP join Poules P on P.Id = PP.PouleId where P.RoundId = 87 and P.Number = 3 and PP.Number = 1 ) where Id = 373;
update PoulePlaceQualifyRules set FromPoulePlaceId = ( select PP.Id from PoulePlaces PP join Poules P on P.Id = PP.PouleId where P.RoundId = 87 and P.Number = 4 and PP.Number = 1 ) where Id = 378;
update PoulePlaceQualifyRules set FromPoulePlaceId = ( select PP.Id from PoulePlaces PP join Poules P on P.Id = PP.PouleId where P.RoundId = 87 and P.Number = 2 and PP.Number = 0 ) where Id = 370;
update PoulePlaceQualifyRules set FromPoulePlaceId = ( select PP.Id from PoulePlaces PP join Poules P on P.Id = PP.PouleId where P.RoundId = 87 and P.Number = 3 and PP.Number = 2 ) where Id = 382; -- DEF
update PoulePlaceQualifyRules set FromPoulePlaceId = ( select PP.Id from PoulePlaces PP join Poules P on P.Id = PP.PouleId where P.RoundId = 87 and P.Number = 0 and PP.Number = 1 ) where Id = 372;
update PoulePlaceQualifyRules set FromPoulePlaceId = ( select PP.Id from PoulePlaces PP join Poules P on P.Id = PP.PouleId where P.RoundId = 87 and P.Number = 1 and PP.Number = 1 ) where Id = 377;
update PoulePlaceQualifyRules set FromPoulePlaceId = ( select PP.Id from PoulePlaces PP join Poules P on P.Id = PP.PouleId where P.RoundId = 87 and P.Number = 4 and PP.Number = 0 ) where Id = 368;
update PoulePlaceQualifyRules set FromPoulePlaceId = ( select PP.Id from PoulePlaces PP join Poules P on P.Id = PP.PouleId where P.RoundId = 87 and P.Number = 1 and PP.Number = 2 ) where Id = 380; -- ABCD;
update PoulePlaceQualifyRules set FromPoulePlaceId = ( select PP.Id from PoulePlaces PP join Poules P on P.Id = PP.PouleId where P.RoundId = 87 and P.Number = 3 and PP.Number = 0 ) where Id = 375;
update PoulePlaceQualifyRules set FromPoulePlaceId = ( select PP.Id from PoulePlaces PP join Poules P on P.Id = PP.PouleId where P.RoundId = 87 and P.Number = 5 and PP.Number = 1 ) where Id = 379;

select * from PoulePlaceQualifyRules order by id desc
