-- mysql -u $DBUSERNAME -p < /tmp/$DBFILEPREFIX\_$BACKUPDATE.sql

select * from planningInputs where name = '[5] - [against(2vs2) h2h:gpp=>0:7 f(1) & against(1vs1) h2h:gpp=>0:7 f(1)] - ref=>0:'

select 	* 
from 	planningInputs 
where 	seekingPercentage < 0
order by createdAt

select * from planningInputs where seekingPercentage < 0 order by createdAt;

update seekingsPercentage = 100 where 

select 	* 
from 	planningInputs 
where 	seekingPercentage < 0 
and 	not exists (
			select * from plannings where inputId = planningInputs.id
		)