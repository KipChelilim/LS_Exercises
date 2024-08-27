SELECT SUM(price)
  FROM customers_services
  LEFT JOIN services ON service_id = services.id
WHERE price > 100;

-- Forgot about cross join
-- SELECT COUNT(customers.id) *
--       (SELECT SUM(services.price) FROM services WHERE price > 100) AS sum
--   FROM customers;

-- LS Solution
SELECT SUM(price)
  FROM customers
 CROSS JOIN services
 WHERE price > 100;