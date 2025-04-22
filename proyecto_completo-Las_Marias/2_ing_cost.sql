CREATE VIEW ingredient_cost AS
SELECT 
s1.ing_id,
s1.item_name,
s1.ing_name,
s1.order_quantity,
(s1.order_quantity*s1.recipe_quantity) as ingredient_required,
(s1.ing_price/ing_weight) as unit_cost,
(s1.order_quantity*s1.ing_weight)*(s1.ing_price/ing_weight) as ingredient_cost
FROM
(SELECT
o.item_id,
i.sku,
i.item_name,
r.ing_id,
r.quantity as recipe_quantity,
ing.ing_name,
sum(o.quantity) as order_quantity,
ing.ing_weight,
ing.ing_price
FROM orders o
LEFT JOIN items i ON o.item_id = i.item_id
LEFT JOIN recipe r ON i.sku = r.recipe_id
LEFT JOIN ingredient ing ON r.ing_id = ing.ing_id
GROUP BY 
o.item_id, 
i. sku, 
i.item_name,
r.ing_id,
r.quantity,
ing.ing_name,
ing.ing_weight,
ing.ing_price) AS s1
