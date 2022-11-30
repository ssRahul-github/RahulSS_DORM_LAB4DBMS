delimiter $$
create procedure proceduree()
begin
select AA.supp_id,AA.supp_name,AA.med,
case
	when AA.med =5 THEN 'Excellent Service'
	when AA.med >4 THEN 'Good Service'
	when AA.med >2 THEN 'Average Service'
	else 'Poor Service'
 end as Type_of_Service from 
(select LASTT.supp_id, supplier.supp_name, LASTT.med from
(select BB.supp_id, sum(BB.rat_ratstars)/count(BB.rat_ratstars) as med from
(select supplier_pricing.supp_id, AA.ORD_ID, AA.RAT_RATSTARS from supplier_pricing inner join
(select `ORDER`.pricing_id, rating.ORD_ID, rating.RAT_RATSTARS from `ORDER` 
inner join rating on rating.ord_id = `ORDER`.ord_id ) as AA
on AA.pricing_id = supplier_pricing.pricing_id) 
as BB group by supplier_pricing.supp_id) 
as LASTT inner join supplier where LASTT.supp_id = supplier.supp_id) as AA;
end $$
delimiter ;  

call proceduree();