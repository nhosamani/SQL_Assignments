Create database assignment;
use assignment;
create table SalesPeople (
Snum int Primary key,
Sname varchar(255) Unique,
City varchar(255),
Comm int);
insert into SalesPeople values(1003 ,'Axelrod','Newyork' ,10);
select * from Salespeople;

create table Customers(
Cnum int Primary Key,
City varchar(255) not null,
Snum int,
foreign key (Snum) references SalesPeople (Snum)
);
alter table customers add column Cname varchar(255);
insert into Customers(Cnum,Cname,City,Snum) values(2008,'Cisneros','Sanjose',1007);
select * from customers;

create table Orders(
Onum int primary key,
amount int,
Odate date,
Cnum int ,
foreign key(Cnum) references Customers(Cnum),
Snum int,
foreign key(Snum) references SalesPeople(Snum)
);

describe Orders;
alter table Orders modify column amount varchar(150);
Insert into Orders(Onum,amount,Odate,Cnum,Snum) values(3011 ,9891.88,"1990-10-06",2006,1001);

select * from SalesPeople;
select * from Customers;
select * from Orders;

/*  Count the number of Salesperson whose name begin with ‘a’/’A’*/

select * from SalesPeople where Sname like 'a%';

/* Display all the Salesperson whose all orders worth is more than Rs. 2000 */
select SalesPeople.Snum ,SalesPeople.Sname,SalesPeople.City,SalesPeople.Comm,Orders.Onum,Orders.amount from SalesPeople Inner Join Orders on SalesPeople.Snum=Orders.Snum 
where amount>2000
group by Onum;

/* Count the number of Salesperson belonging to Newyork */
select count(*) from SalesPeople where City='Newyork';

/* Display the number of Salespeople belonging to London and belonging to Paris*/
select count(*) from Salespeople where city in ('London','Paris');


/* Display the number of orders taken by each Salesperson and their date of orders */

select Orders.Onum,Orders.Odate,SalesPeople.Sname, Count(Orders.Onum) as NumberofOrders from Orders 
Inner join SalesPeople on Orders.Snum = SalesPeople.Snum
Group by Sname;
