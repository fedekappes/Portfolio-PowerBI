CREATE VIEW stock AS
SELECT 
s2.ing_name,
s2.total_required,
(ing.ing_weight*inv.quantity) as total_inv_weight,
(ing.ing_weight*inv.quantity) - s2.total_required as remaining_weight
FROM (SELECT 
s1.ing_id,
s1.ing_name,
sum(s1.ingredient_required) AS total_required
FROM ingredient_cost s1
LEFT JOIN ingredient i ON s1.ing_id = i.ing_id
GROUP BY 
s1.ing_id,
s1.ing_name) s2
LEFT JOIN inventory inv ON inv.ing_id = s2.ing_id
LEFT JOIN ingredient ing ON ing.ing_id = s2.ing_id
GROUP BY 
s2.ing_name,
s2.total_required,
ing.ing_weight,
inv.quantity