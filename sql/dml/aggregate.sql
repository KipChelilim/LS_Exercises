SELECT devices.name, count(parts.id) AS number_of_parts
  FROM devices LEFT OUTER JOIN parts ON devices.id = parts.device_id
 GROUP BY devices.name;