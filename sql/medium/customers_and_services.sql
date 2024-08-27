SELECT name, string_agg(description, ', ') AS services
  FROM customers
  LEFT JOIN customers_services ON customers.id = customer_id
  LEFT JOIN services ON service_id = services.id
 GROUP BY customers.id; -- name wont work if customers have same name, fixed