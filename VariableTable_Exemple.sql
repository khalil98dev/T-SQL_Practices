use C21_DB1; 


DECLARE @SimpleData Table 
(
Name varchar(52),
DateOfBirth Date not null
)

insert into @SimpleData values ('khalil','11/11/1998'); 
insert into @SimpleData values ('Oussama','11/11/2005'); 
insert into @SimpleData values ('Mohamed','11/11/2002'); 
insert into @SimpleData values ('Ali','11/11/2003'); 
insert into @SimpleData values ('Yasser','11/11/1990'); 
insert into @SimpleData values ('Annis','11/11/1970'); 
insert into @SimpleData values ('Khaoula','11/11/1960'); 
insert into @SimpleData values ('Malak','11/11/1999'); 
insert into @SimpleData values ('Ines','11/11/1992'); 
insert into @SimpleData values ('Ypunes','11/11/1991'); 



Create Table People 
(
PersonID int IDENTITY(1,1) primary key, 
Name varchar (50) not null, 
DateOfBorth Date not null, 
Age int not null 
);



Insert into People 

select Name,DateOfBirth ,DATEDIFF(YEAR,DateOfBirth,GETDATE())    as Age  

from @SimpleData

select * from People ; 

