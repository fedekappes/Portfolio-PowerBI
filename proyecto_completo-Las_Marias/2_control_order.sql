CREATE VIEW control_order AS
SELECT
o.order_id,
i.item_price,
o.quantity,
i.item_cat,
i.item_name,
o.order_date,
o.order_time,
a.delivery_address,
a.delivery_city,
a.delivery_zipcode,
o.delivery
FROM
orders o
LEFT JOIN items i ON o.item_id = i.item_id
LEFT JOIN address a ON o.add_id = a.add_id