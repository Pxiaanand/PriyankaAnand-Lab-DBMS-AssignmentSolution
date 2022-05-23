create database E_Commerce_Website;

create table if not exists Supplier(
SUPP_ID int PRIMARY KEY, 
SUPP_NAME varchar(50) NOT NULL, 
SUPP_CITY varchar(50) NOT NULL, 
SUPP_PHONE varchar(50));

create table if not exists Customer(
CUS_ID int PRIMARY KEY, 
CUS_NAME varchar(50) NOT NULL, 
CUS_PHONE varchar(50) NOT NULL, 
CUS_CITY varchar(50), 
CUS_GENDER char(1));

create table if not exists Category(
CAT_ID int PRIMARY KEY, 
CAT_NAME varchar(20) NOT NULL);

#Updating values into Supplier Table
insert into Supplier values(1,"Rajesh Retails","Delhi","1234567890");
insert into Supplier values(2,"Appario Ltd.","Mumbai","2589631470");
insert into Supplier values(3,"Knome Products","Banglore","9785462315");
insert into Supplier values(4,"Bansal Retails","Kochi","8975463285");
insert into Supplier values(5,"Mittal Ltd.","Lucknow","7898456532");

#Updating values into Customer Table
insert into Customer values(1,"AAKASH","9999999999","DELHI", "M");
insert into Customer values(2,"AMAN","9785463215","NOIDA", "M");
insert into Customer values(3,"NEHA","9999999999","MUMBAI", "F");
insert into Customer values(4,"MEGHA","9994562399","KOLKATA", "F");
insert into Customer values(5,"PULKIT","7895999999","LUCKNOW", "M");


#Updating values into CategoryTable
insert into Category values(1,"BOOKS");
insert into Category values(2,"GAMES");
insert into Category values(3,"GROCERIES");
insert into Category values(4,"ELECTRONICS");
insert into Category values(5,"CLOTHES");
set SQL_SAFE_UPDATES=0;

create table if not exists Product(
PRO_ID int PRIMARY KEY, 
PRO_NAME varchar(50) NOT NULL default "Dummy",
PRO_DESC varchar(60) NOT NULL, 
CAT_ID int,
FOREIGN key(CAT_ID) references Category(CAT_ID)
);

create table if not exists Supplier_Pricing(
PRICING_ID int PRIMARY KEY,
PRO_ID int,
SUPP_ID int,
SUPP_PRICE int Default 0,
FOREIGN key(PRO_ID) references Product(PRO_ID),
FOREIGN key(SUPP_ID) references Supplier(SUPP_ID)
);

create table if not exists `order`(
ORD_ID int PRIMARY KEY,
ORD_AMOUNT int NOT NULL,
ORD_DATE date NOT NULL,
CUS_ID int NOT NULL,
PRICING_ID int NOT NULL,
FOREIGN key(CUS_ID) references Customer(CUS_ID),
FOREIGN key(PRICING_ID) references Supplier_Pricing(PRICING_ID)
);


create table if not exists Rating(
RAT_ID int PRIMARY KEY,
ORD_ID int,
RAT_RATSTARS int NOT NULL,
FOREIGN key(ORD_ID) references `order`(ORD_ID)
);

#Inserting values into Product Table
insert into Product values(1,"GTA V","Windows 7 and above with i5 processor and 8GB RAM",2);
insert into Product values(2,"TSHIRT","SIZE-L with Black, Blue and White variations",5);
insert into Product values(3,"ROG LAPTOP","Windows 10 with 15inch screen, i7 processor, 1TB SSD",4);
insert into Product values(4,"OATS","Highly Nutritious from Nestle",3);
insert into Product values(5,"HARRY POTTER","Best Collection of all time by J.K Rowling",1);
insert into Product values(6,"MILK","1L Toned MIlk",3);
insert into Product values(7,"Boat EarPhones","1.5Meter long Dolby Atmos",4);
insert into Product values(8,"Jeans","Stretchable Denim Jeans with various sizes and color",5);
insert into Product values(9,"Project IGI","compatible with windows 7 and above",2);
insert into Product values(10,"Hoodie","Black GUCCI for 13 yrs and above",5);
insert into Product values(11,"Rich Dad Poor Dad","Written by RObert Kiyosaki",1);
insert into Product values(12,"Train Your Brain","By Shireen Stephen",1);

#Inserting values into Supplier_Pricing
insert into Supplier_Pricing values(1,1,2,1500);
insert into Supplier_Pricing values(2,3,5,30000);
insert into Supplier_Pricing values(3,5,1,3000);
insert into Supplier_Pricing values(4,2,3,2500);
insert into Supplier_Pricing values(5,4,1,1000);
insert into Supplier_Pricing values(6,12,2,780);
insert into Supplier_Pricing values(7,12,4,789);
insert into Supplier_Pricing values(8,3,1,31000);
insert into Supplier_Pricing values(9,1,5,1450);
insert into Supplier_Pricing values(10,4,2,999);
insert into Supplier_Pricing values(11,7,3,549);
insert into Supplier_Pricing values(12,7,4,529);
insert into Supplier_Pricing values(13,6,2,105);
insert into Supplier_Pricing values(14,6,1,99);
insert into Supplier_Pricing values(15,2,5,2999);
insert into Supplier_Pricing values(16,5,2,2999);

#Inserting values into Order Table
insert into `order` values (101,1500,"2021-10-06",2,1);
insert into `order` values(102,1000,"2021-10-12",3,5);
insert into `order` values(103,30000,"2021-09-16",5,2);
insert into `order` values(104,1500,"2021-10-05",1,1);
insert into `order` values(105,3000,"2021-08-16",4,3);
insert into `order` values(106,1450,"2021-08-18",1,9);
insert into `order` values(107,789,"2021-09-01",3,7);
insert into `order` values(108,780,"2021-09-07",5,6);
insert into `order` values(109,3000,"2021-0-10",5,3);
insert into `order` values(110,2500,"2021-09-10",2,4);
insert into `order` values(111,1000,"2021-09-15",4,5);
insert into `order` values(112,789,"2021-09-16",4,7);
insert into `order` values(113,31000,"2021-09-16",1,8);
insert into `order` values(114,1000,"2021-09-16",3,5);
insert into `order` values(115,3000,"2021-09-16",5,3);
insert into `order` values(116,99,"2021-09-17",2,14);

#Inserting values into Rating Table
insert into Rating values(1,101,4);
insert into Rating values(2,102,3);
insert into Rating values(3,103,1);
insert into Rating values(4,104,2);
insert into Rating values(5,105,4);
insert into Rating values(6,106,3);
insert into Rating values(7,107,4);
insert into Rating values(8,108,4);
insert into Rating values(9,109,3);
insert into Rating values(10,110,5);
insert into Rating values(11,111,3);
insert into Rating values(12,112,4);
insert into Rating values(13,113,2);
insert into Rating values(14,114,1);
insert into Rating values(15,115,1);
insert into Rating values(16,116,0);

#Display the total number of customers based on gender who have placed orders of worth at least Rs.3000
#3
select cus_gender as GENDER, count(CUS_GENDER) as Number_of_Customers from customer join
(select CUS_ID, sum(ORD_Amount) as Total_Amount from `Order`group by CUS_ID having Total_Amount>=3000) Sum_Order
on customer.cus_id = Sum_order.cus_id
group by cus_gender;


#Display all the orders along with product name ordered by a customer having Customer_Id=2
#4
select `Order`.*,supplier_pricing.PRO_ID, product.PRO_NAME 
from `Order` inner join supplier_pricing on `Order`.pricing_id = supplier_pricing.PRICING_ID 
inner join product on supplier_pricing.PRO_ID = product.PRO_ID
where cus_ID=2;


#Display the Supplier details who can supply more than one product.
#5

#With SubQuery
select * from supplier where SUPP_ID in
(select supp_table.supp_id from (select supp_id, count(distinct pro_id) as No_of_Products 
from supplier_pricing 
group by supp_id 
having No_of_Products>1 ) supp_table);

#With Joins
select supplier.* 
from supplier join supplier_pricing
on supplier.supp_id = supplier_pricing.supp_id
group by supplier_pricing.supp_id
having count(supplier_pricing.supp_id)>1;


#Find the least expensive product from each category and print the table with category id, name, product name and price of the product
#6
Select CAT_ID, CAT_NAME, PRO_NAME, min(supplier_pricing.supp_price) as Minimum_Price from supplier_pricing join
(Select category.*, product.PRO_NAME, product.PRO_ID
from category
inner join product on category.cat_ID = product.cat_ID)Product_Details 
on supplier_pricing.pro_id = Product_Details.pro_id
group by CAT_ID;


#Display the Id and Name of the Product ordered after “2021-10-05”
#7
/*SubQuery + Inner Join*/
Select Product.PRO_ID, Product.PRO_NAME from product inner join
(select supplier_pricing.PRO_ID, supplier_pricing.PRICING_ID from supplier_pricing inner join
(Select `order`.ORD_DATE, `order`.PRICING_ID from `order` where (`order`.ORD_Date) > '2021-10-05' order by `order`.ORD_Date ASC)Price_List
on supplier_pricing.PRICING_ID = Price_List.PRICING_ID)Product_ID
on product.PRO_ID = Product_ID.PRO_ID;

/* using In*/
Select Product.PRO_ID, Product.PRO_NAME from product where Product.PRO_ID in
(select supplier_pricing.PRO_ID from supplier_pricing where supplier_pricing.PRICING_ID in
(Select `order`.PRICING_ID from `order` where (`order`.ORD_Date) > '2021-10-05' ));


#Display customer name and gender whose names start or end with character 'A'
#8
Select Customer.Cus_Name, Customer.Cus_Gender from Customer where
Customer.Cus_Name like 'A%' or Customer.Cus_Name like '%A';

#Create a stored procedure to display supplier id, name, rating and Type_of_Service. For Type_of_Service, If rating =5, print “Excellent Service”,If rating >4 print “Good Service”, If rating >2 print “Average Service” else print “Poor Service”
#9

DELIMITER &&
CREATE PROCEDURE Supplier_Rating()

Select supplier.supp_id as SUPPLIER_ID, supplier.supp_name as SUPPLIER_NAME, sum(rating.rat_ratstars)/count(rating.rat_ratstars) as Average_Rating, 
CASE
WHEN sum(rating.rat_ratstars)/count(rating.rat_ratstars)=5 THEN "EXCELLENT SERVICE"
WHEN sum(rating.rat_ratstars)/count(rating.rat_ratstars)=4 THEN "GOOD SERVICE"
WHEN sum(rating.rat_ratstars)/count(rating.rat_ratstars)>=2 and sum(rating.rat_ratstars)/count(rating.rat_ratstars)<4 THEN "AVERAGE SERVICE"
ELSE "POOR SERVICE"
END as Type_of_Service
from supplier join supplier_pricing on supplier.supp_id = supplier_pricing.supp_id
join `order` on `order`.pricing_id = supplier_pricing.pricing_id
join rating on rating.ord_id = `order`.ord_id
group by SUPPLIER_ID
#as Supplier_Rating;


call Supplier_Rating;








 

