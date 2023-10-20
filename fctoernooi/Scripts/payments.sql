SELECT * FROM payments order by id desc

SELECT * FROM payments where paymentId = 'tr_cFCwUhfaLv' 

delete FROM payments

select * from tournaments t  order by id desc

select * from planningConfigs  pc where pc.editMode is null or pc.editMode < 1

SET GLOBAL log_output = 'TABLE';
SET GLOBAL general_log = 'ON';
Take a look at the table mysql.general_log
If you prefer to output to a file instead of a table:

SET GLOBAL log_output = "FILE"; the default.
SET GLOBAL general_log_file = "/var/log/mysql/queries.log";
SET GLOBAL general_log = 'ON';

INSERT INTO planningConfigs (editMode, extension, enableTime, minutesPerGame, minutesPerGameExt, minutesInBetween, minutesBetweenGames, perPoule, selfReferee, nrOfSimSelfRes)

VALUES (NULL, 0, 1, 20, 0, 0, 5, 0, NULL, 0)

                   731 Query    