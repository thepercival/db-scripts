SELECT distinct u.emailaddress  FROM poolUsers pu JOIN users u ON u.id = pu.userId where pu.admin = 1;

select * from formations 