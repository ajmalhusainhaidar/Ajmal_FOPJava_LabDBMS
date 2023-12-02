
select count(T2.CUS_gender) as no_of_customer,T2.cus_gender as gender from
(
select T1.cus_id,T1.cus_gender,T1.ORD_AMOUNT,T1.cus_name from
(
select o.*,c.cus_name,c.cus_gender from orders as o
inner join customer as c
ON c.CUS_ID=o.CUS_ID having o.ORD_AMOUNT>=3000
)as T1
)as T2 group by T2.cus_gender;
