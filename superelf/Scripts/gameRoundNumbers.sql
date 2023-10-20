-- s11Players for a certain season

-- gameRoundNumbers for a certain pool
select 	a.name, vp.startDateTime, vp.endDateTime, gr.number
from 	pools p 
		join poolCollections pc on pc.id = p.collectionId
		join associations a on pc.associationId = a.id
		join competitionConfigs cc on cc.id = p.competitionConfigId
		join viewPeriods vp on cc.createAndJoinPeriodId = vp.id
		join assemblePeriods ap on cc.assemblePeriodId = ap.id
		join viewPeriods vp2 on vp2.id = ap.viewPeriodId
		join gameRounds gr on vp.id = gr.viewPeriodId or vp2.id = gr.viewPeriodId
where	a.name = 'test123'

		
-- where	vp.startDateTime < '2016-07-01' and vp.endDateTime > '2015-07-01'
-- where	vp.startDateTime < '2016-01-01' and vp.endDateTime > '2016-01-01'
-- and		p.firstName like '%' and p.lastName = 'Milik'