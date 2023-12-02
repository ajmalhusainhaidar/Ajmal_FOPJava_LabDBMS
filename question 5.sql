select q.CUS_ID,q.CUS_name,q.ORD_ID, product.PRO_NAME from
(
select c.CUS_ID,c.CUS_NAME, P.ORD_ID,P.ORD_AMOUNT,P.PRO_ID FROM
(
	SELECT O.*,SP.PRO_ID FROM orders AS O
	INNER JOIN supplier_pricing AS SP
	WHERE O.PRICING_ID=sp.PRICING_ID
) AS P
	INNER JOIN CUSTOMER AS C
	where P.CUS_ID=C.CUS_ID and c.CUS_ID=2
)AS Q
inner join product
on q.pro_id= product.pro_id;