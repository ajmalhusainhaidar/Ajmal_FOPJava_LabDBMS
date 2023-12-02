select report.SUPP_ID, report.Average,
CASE 
	when report.Average =5 then'Excellent Service'
	when report.Average >4 then'Good Service'
	when report.Average >2 then'Average Service'
else 'Poor Service' 
end as type_of_service from
(
select test2.SUPP_ID,avg(rat_ratstars) as average from
(
select sp.supp_id, t1.ord_id,t1.rat_ratstars from supplier_pricing as sp
Inner join
(
select o.pricing_id,rat.ord_id, rat.rat_ratstars from orders as o
inner join
rating as rat on o.ord_id= rat.ORD_ID
) as t1 on sp.pricing_id=t1.PRICING_ID
) as test2 group by test2.supp_id) as report