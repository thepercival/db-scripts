SELECT * FROM plannings pl JOIN planningInputs i ON i.id = pl.inputId where i.name = '[5,5,5] - [against(1vs1) h2h:gpp=>1:0 f(2)] - ref=>0:';

SELECT * FROM plannings pl JOIN planningInputs i ON i.id = pl.inputId where i.id = 60478

SELECT * FROM plannings pl JOIN planningInputs i ON i.id = pl.inputId where i.id = 64000

-- INVALID PLANNINGSPLANNIGNS 
SELECT * FROM plannings pl JOIN planningInputs i ON i.id = pl.inputId where pl.validity > 0 and pl.state = 'succeeded' order by pl.inputId desc
-- 64879

-- PLANNIGNS WHERE minNrOfBatchGames < minNrOfBatchGames from  
SELECT 	* 
FROM 	plannings pl 
		JOIN planningInputs i ON i.id = pl.inputId 
where 	1 = 1
and 	pl.state = 'succeeded'
and 	pl.minNrOfBatchGames = pl.maxNrOfBatchGames
and 	exists (
			select 	*  
			from 	plannings plSub 
			where 	plSub.inputId = i.Id
			and 	plSub.nrOfBatches < pl.nrOfBatches
			and 	plSub.state = 'succeeded'
			and 	plSub.minNrOfBatchGames < plSub.maxNrOfBatchGames
-- 			and 	plSub.minNrOfBatchGames <= pl.minNrOfBatchGames
-- 			and 	plSub.maxNrOfBatchGames <= pl.maxNrOfBatchGames
		)
		
)
i.name = '[5,5,5] - [against(1vs1) h2h:gpp=>1:0 f(2)] - ref=>0:';