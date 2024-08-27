SELECT services.description
  FROM customers_services
 RIGHT JOIN services
       ON customers_services.service_id = services.id
WHERE customers_services.id IS NULL;