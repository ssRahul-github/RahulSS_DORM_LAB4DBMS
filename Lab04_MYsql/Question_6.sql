select category.CAT_ID,category.cat_name,B2.PRO_NAME,min(B2.MIN_price) as minprice from category 
inner join (select product.CAT_ID, product.PRO_NAME,B1.* from product inner join 
(select pro_id , min(supp_price) as MIN_Price from 
supplier_pricing group by pro_id) as B1 where product.PRO_ID = B1.PRO_ID )
as B2 where B2.CAT_ID = category.CAT_ID group by CAT_ID;