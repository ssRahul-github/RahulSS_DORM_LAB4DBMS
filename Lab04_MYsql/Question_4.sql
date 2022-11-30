select product.pro_name, `ORDER`.* from `ORDER`, supplier_pricing, product where 
`ORDER`.cus_id=2 and 
`ORDER`.pricing_id=supplier_pricing.pricing_id and supplier_pricing.pro_id=product.pro_id;