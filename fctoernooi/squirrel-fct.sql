insert into recesses(tournamentId, startDateTime, endDateTime) (select id, breakStartDateTime, breakEndDateTime from tournaments where breakStartDateTime is not null and breakEndDateTime is not null);

update users set validateIn = 3, nrOfCredits = 3;

select * from users where id = 5

select c.*, p.*, u.id, u.nrOfCredits, u.emailaddress, u.validated, u.validateIn from creditActions c left join payments p on c.paymentId = p.id join users u on u.id = c.userId

select t.* from tournaments t join competitions c on t.competitionid = c.id join leagues l on l.id = c.leagueid where l.name like '%Mechelen%';

select t.* from tournaments t join competitions c on t.competitionid = c.id join leagues l on l.id = c.leagueid where t.id = 2850;

select * from tournamentUsers where userId = 6676;

select * from tournaments where id in (select tournamentid from tournamentUsers where userId = 6676)

insert into tournamentUsers(tournamentId,userid,roles) values(5427,5,7);

select * from users where emailaddress = 'j.rikken@ziggo.nl' -- 6676

update users set validateIn = 3, nrOfCredits = 3;

CREATE TABLE creditActions (id INT AUTO_INCREMENT NOT NULL, atDateTime DATETIME NOT NULL COMMENT '(DC2Type:datetime_immutable)', nrOfCredits SMALLINT NOT NULL, userId INT NOT NULL, INDEX IDX_9237EB9664B64DCC (userId), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB;

select * from creditActions
alter table creditActions add column action varchar(20) NOT NULL COMMENT '(DC2Type:enum_CreditAction)'

tantekippe@htc4.nl