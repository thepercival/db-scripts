select * from planningConfigs pc join roundNumbers rn on rn.id = pc.ro

-- select planningConfig orphans
select * from planningConfigs where not exists ( select * from roundNumbers rn where rn.planningConfigId = planningConfigs.id )


delete from planningConfigs where not exists ( select * from roundNumbers rn where rn.planningConfigId = planningConfigs.id );

select * from planningConfigs where not exists ( select * from roundNumbers rn where rn.planningConfigId = planningConfigs.id ) order by id desc

select * from roundNumbers rn left join planningConfigs pc on rn.planningConfigId = pc.id where rn.competitionid = 8682

delete 	pcbase
from		planningConfigs pcbase join
		(	
			select rn.planningConfigId
			from 	roundNumbers rn join planningConfigs pc on rn.planningConfigId = pc.id
			where 	( 
						select 	count(*) 
						from 	roundNumbers rnsub join planningConfigs pcsub on rnsub.planningConfigId = pcsub.id and rnsub.number < rn.number and rnsub.competitionId = rn.competitionId
						where	pcsub.enableTime = pc.enableTime
						and		pcsub.minutesPerGame = pc.minutesPerGame
						and		pcsub.minutesPerGameExt = pc.minutesPerGameExt
						and		pcsub.minutesInBetween = pc.minutesInBetween
						and		pcsub.minutesBetweenGames = pc.minutesBetweenGames
						and		pcsub.selfReferee = pc.selfReferee
						and		pcsub.extension = pc.extension
						and		pcsub.editMode = pc.editMode
					) 
			) rnbase on rnbase.planningConfigId = pcbase.id

-- roundnumbers which have planningConfigs where are not necessary
select 	rn.*, ' planningConfig => ', pc.*
from 	roundNumbers rn join planningConfigs pc on rn.planningConfigId = pc.id
where 	( 
			select 	count(*) 
			from 	roundNumbers rnsub join planningConfigs pcsub on rnsub.planningConfigId = pcsub.id and rnsub.number < rn.number and rnsub.competitionId = rn.competitionId
			where	pcsub.enableTime = pc.enableTime
			and		pcsub.minutesPerGame = pc.minutesPerGame
			and		pcsub.minutesPerGameExt = pc.minutesPerGameExt
			and		pcsub.minutesInBetween = pc.minutesInBetween
			and		pcsub.minutesBetweenGames = pc.minutesBetweenGames
			and		pcsub.selfReferee = pc.selfReferee
			and		pcsub.extension = pc.extension
			and		pcsub.editMode = pc.editMode
		) 
order by rn.competitionid desc