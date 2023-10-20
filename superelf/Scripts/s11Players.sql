-- s11Players for a certain season
select 	* 
from 	players pl
		join persons p on p.id = pl.personId
		join viewPeriods vp on vp.id = pl.viewPeriodId
--where	vp.startDateTime < '2016-07-01' and vp.endDateTime > '2015-07-01'
-- where	vp.startDateTime < '2016-01-01' and vp.endDateTime > '2016-01-01'
and		p.firstName like '%' and p.lastName = 'Gakpo'

-- ------------------------------------------ teamplayers within a season -------------------------
-- 
select 	* 
from 	teamPlayers tmPl
		join teams tm on tm.id = tmPl.teamId
		join persons p on p.id = tmPl.personId
where 	tmPl.startDateTime <= '2016-07-01' and tmPl.endDateTime >= '2015-07-01'
and		p.firstName = 'Arek' and p.lastName = 'Milik'

select * from persons where lastName like 'Mil%'

-- ------------------------------------------ s11Players for a certain season -------------------------
select 	* 
from 	players pl
		join persons p on p.id = pl.personId
		join viewPeriods vp on vp.id = pl.viewPeriodId
-- where	vp.startDateTime < '2016-07-01' and vp.endDateTime > '2015-07-01'
-- where	vp.startDateTime < '2016-01-01' and vp.endDateTime > '2016-01-01'
and		p.firstName like '%' and p.lastName = 'Saito'

-- ------------------------------------------- s11Players with totals and stats ------------------------
select 	* 
from 	players pl
		join persons p on p.id = pl.personId
		join viewPeriods vp on vp.id = pl.viewPeriodId
		join playerTotals plt on plt.id = pl.totalsId
		join statistics s  on s.playerId = pl.id
		-- join gameRounds gr  on gr.id = s.gameRoundId
--where	vp.startDateTime < '2016-07-01' and vp.endDateTime > '2015-07-01'
-- where	vp.startDateTime < '2016-01-01' and vp.endDateTime > '2016-01-01'
and		p.firstName like '%' and p.lastName = 'Gakpo'

select * from statistics where playerId = 114

select * from playerTotals where id = 114

select 	* 
from 	externalPersons ep
		join persons p on p.id = ep.importableObjectId		
where		p.firstName like '%' and p.lastName = 'Gakpo'


select * from players pl join persons p on p.id = pl.personId join viewPeriods vp on vp.id = pl.viewPeriodId where p.firstName like '%' and p.lastName = 'Gakpo'

select * from 	players pl join persons p on p.id = pl.personId join viewPeriods vp on vp.id = pl.viewPeriodId join playerTotals plt on plt.id = pl.totalsId join statistics s  on s.playerId = pl.id where p.firstName like '%' and p.lastName = 'Gakpo'


