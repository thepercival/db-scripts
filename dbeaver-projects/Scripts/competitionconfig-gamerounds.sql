select 	* 
from 	poolUsers pu 
		join pools p on p.id = pu.poolId 
		join poolCollections pc on pc.id = p.collectionId 
		join associations a on a.id = pc.associationId 
where a.name = 'kamp duim'

select * from competitors c

select * from gameRounds gr join viewPeriods vp on vp.id = gr.viewPeriodId 

select * from leagues l 

select * from plannings pl


-- s11Players for a certain season

-- gameRoundNumbers for a certain pool
select 	gr.idvp.startDateTime, vp.endDateTime
from 	competitionConfigs cc
		join viewPeriods vp on cc.createAndJoinPeriodId = vp.id
		join assemblePeriods ap on cc.assemblePeriodId = ap.id
		join viewPeriods vp2 on vp2.id = ap.viewPeriodId
		join gameRounds gr on vp.id = gr.viewPeriodId or vp2.id = gr.viewPeriodId
where	cc.id = 1

select * from againstGames ag where gameRoundNumber = 3

update againstGames set startDateTime = '2022-09-01 11:22:00' where id = 308

select * from externalAgainstGames eag where eag.importableObjectId = 33

		
-- where	vp.startDateTime < '2016-07-01' and vp.endDateTime > '2015-07-01'
-- where	vp.startDateTime < '2016-01-01' and vp.endDateTime > '2016-01-01'
-- and		p.firstName like '%' and p.lastName = 'Milik'
