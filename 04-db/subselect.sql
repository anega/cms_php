SELECT DISTINCT o.id, o.price FROM `offer` o
LEFT JOIN `product` p ON p.id = o.product_id
LEFT JOIN `product_item` pi ON pi.product_id = p.id
LEFT JOIN `inventory` i ON i.product_item_id = pi.id
LEFT JOIN `user` u ON u.id = pi.user_id
WHERE u.id = 2 AND o.id = (
SELECT ho.id FROM `offer` ho
LEFT JOIN `product` hop ON hop.id = ho.product_id
WHERE hop.id = p.id AND ho.size = o.size ORDER BY ho.price DESC LIMIT 1);
