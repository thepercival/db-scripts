SELECT DISTINCT RIGHT(logoUrl, )  FROM sponsors where logoUrl is not null

UPDATE sponsors set logoExtension = RIGHT(logoUrl, 3) where logoUrl is not null

select * from logoUrl