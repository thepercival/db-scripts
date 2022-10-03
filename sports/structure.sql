-- structure   
select 	c.name as categoryName, rn.number as roundNumber, qg.target as qualifyTarget, qg.number as qualifyNr, p.number as pouleNr, pl.placeNr
from 	places pl 
		join poules p on p.id = pl.pouleid 
		join rounds r on r.id = p.roundid 
		join roundNumbers rn on r.numberId = rn.id 
		left join qualifyGroups qg on qg.id = r.parentQualifyGroupId
		join categories c on c.id = r.categoryId 
where 	c.competitionId = 11924
order by	c.number, rn.number, qg.target, qg.number, p.number, pl.placeNr

-- structure fctoernoooi
select 	c.name as categoryName, rn.number as roundNumber, qg.target as qualifyTarget, qg.number as qualifyNr, p.number as pouleNr, pl.placeNr, cr.name as competitorName
from 	places pl 
		join poules p on p.id = pl.pouleid 
		join rounds r on r.id = p.roundid 
		join roundNumbers rn on r.numberId = rn.id 
		left join qualifyGroups qg on qg.id = r.parentQualifyGroupId
		join categories c on c.id = r.categoryId 
		join tournaments t on t.competitionId = c.competitionId 
		left join competitors cr on cr.tournamentId = t.id and c.number = cr.categoryNr and p.number = cr.pouleNr and pl.placeNr = cr.placeNr
where 	t.id = 11922
order by	c.number, rn.number, qg.target, qg.number, p.number, pl.placeNr