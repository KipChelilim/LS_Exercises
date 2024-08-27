SELECT SUM(price)
  FROM customers_services
  LEFT JOIN services ON service_id = services.id;