SELECT devices.name, parts.part_number
  FROM devices INNER JOIN parts on devices.id = parts.device_id;