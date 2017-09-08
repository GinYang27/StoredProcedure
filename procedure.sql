DELIMITER //
CREATE PROCEDURE GetAvgReview(IN store_id INT(11))
	BEGIN
    
    CREATE OR REPLACE VIEW v1 as (
	SELECT r.id, r.star, c.massageServe_id 
	FROM (reviewofcustomerorder as r LEFT JOIN customerorderrecord as c ON r.customerOrderRecord_id = c.id));
    
    SELECT AVG(star) FROM(
		(SELECT v1.star, m.massageStore_id
		FROM v1 LEFT JOIN massageserve as m ON v1.massageServe_id = m.id)

		UNION ALL

		(SELECT rs.star, rs.massageStore_id
			FROM reviewofstore as rs)
		) AS T
	WHERE T.massageStore_id = store_id;
    END //
    
CREATE PROCEDURE GetAmountReview(IN store_id INT(11))
	BEGIN
    
    CREATE OR REPLACE VIEW v1 as (
	SELECT r.id, r.star, c.massageServe_id 
	FROM (reviewofcustomerorder as r LEFT JOIN customerorderrecord as c ON r.customerOrderRecord_id = c.id));
    
    SELECT COUNT(star) FROM(
		(SELECT v1.star, m.massageStore_id
		FROM v1 LEFT JOIN massageserve as m ON v1.massageServe_id = m.id)

		UNION ALL

		(SELECT rs.star, rs.massageStore_id
			FROM reviewofstore as rs)
		) AS T
	WHERE T.massageStore_id = store_id;
    END //
    
    
DELIMITER ;



