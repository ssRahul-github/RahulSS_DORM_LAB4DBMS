select C2.PRO_ID,product.PRO_NAME from 
product inner join (select supplier_pricing.PRO_ID,C1.PRICING_ID from supplier_pricing inner join 
(select `order`.PRICING_ID,`order`.ORD_DATE  from `order` where ORD_DATE > "2021-10-05" group by PRICING_ID) as C1 
where C1.PRICING_ID = supplier_pricing.PRICING_ID) as C2 where C2.PRO_ID = product.PRO_ID;