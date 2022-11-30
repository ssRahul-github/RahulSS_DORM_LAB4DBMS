select count(A2.cus_gender) as CustomersCount , A2.cus_gender from
(select A1.cus_id, A1.cus_gender, A1.ord_amount, A1.cus_name from
(select `ORDER`.*, customer.cus_gender, customer.cus_name from `ORDER` inner join 
customer where `ORDER`.cus_id=customer.cus_id having `ORDER`.ord_amount>=3000) 
as A1 group by A1.cus_id)
as A2 group by A2.cus_gender;