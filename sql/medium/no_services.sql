SELECT customers.*
  FROM customers
  LEFT OUTER JOIN customers_services
               ON customers.id = customers_services.customer_id
 WHERE service_id IS NULL;

 --Further Exploration
 SELECT customers.*, services.*
  FROM customers
  FULL  JOIN customers_services
               ON customers.id = customers_services.customer_id
  FULL OUTER JOIN services
               ON customers_services.service_id = services.id
 WHERE (service_id IS NULL) OR (customer_id IS NULL);