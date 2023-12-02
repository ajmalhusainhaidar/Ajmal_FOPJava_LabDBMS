select c.CAT_ID,c.cat_NAME, min(t3.min_price) as Min_Price from category as c
inner join
(
select p.CAT_ID, p.pro_name, t2.*from product as p
inner join
(
select pro_id, min(supp_price)as Min_price from supplier_pricing group by PRO_ID
)as t2 on t2.PRO_ID=p.pro_id
) as T3 on T3.CAT_ID=c.CAT_ID group by t3.cat_id;

