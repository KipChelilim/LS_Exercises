-- My version
-- SELECT customers.id, name, payment_token
--   FROM customers
--       INNER JOIN customers_services ON customers.id = customers_services.customer_id
--       INNER JOIN services ON customers_services.service_id = services.id
-- GROUP BY customers.id, name, payment_token;

-- LS Solution
SELECT DISTINCT customers.*
  FROM customers
       INNER JOIN customers_services
               ON customers.id = customers_services.customer_id;