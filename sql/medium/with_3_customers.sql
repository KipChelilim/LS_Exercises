SELECT description, COUNT(customer_id)
  FROM services
  LEFT JOIN customers_services ON services.id = service_id
 GROUP BY services.id
HAVING COUNT(customer_id) >= 3;