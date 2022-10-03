select 	* 
from 	persons p 
		join teamPlayers pl on pl.personId = p.id
where	p.lastName = 'Duarte' and firstName = 'Laros'

select * from teamPlayers
		