CREATE VIEW staff_control AS
SELECT 
r.date,
s.staff_firstname,
s.staff_lastname,
s.hourly_pay,
sh.start_time,
sh.end_time,
TIMESTAMPDIFF(MINUTE, sh.start_time, sh.end_time)/60 AS hours_shift,
TIMESTAMPDIFF(MINUTE, sh.start_time, sh.end_time)/60 * s.hourly_pay AS staff_cost
FROM rota r
LEFT JOIN staff s ON s.staff_id = r.staff_id
LEFT JOIN shift sh ON sh.shift_id = r.shift_id;