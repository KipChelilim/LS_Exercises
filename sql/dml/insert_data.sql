/*
Problem:
  add to devices
    accelerometer:
      3 parts
      default time stamp
    gyroscope
      5 parts
      default time stamp
  add to parts
    3 parts
      refer to accelerometer
      part number limited to 1 - 10000
    5 parts
      3 of these don't belong to any device
Example
  devices
    1 - Acelerometer - time
    2 - Gyroscope    - time
  parts
    1 - 2334 - 1
    2 - 5678 - 1
    3 - 3568 - 1
    4 - 2312 - 2
    5 - 9887 - 2
    6 - 3258 - 2
    7 - 2326 - 2
    8 - 2189 - 2
    8 - 3268 -
    9 - 2328 -
   10 - 1230 -

Algorithm
  modify table to add constraint
  insert devices
  insert
Code
*/

ALTER TABLE parts
  ADD CONSTRAINT part_number_range
CHECK (part_number BETWEEN 1 AND 10000);

INSERT INTO devices(name) VALUES ('Accelerometer'), ('Gyroscope');

INSERT INTO parts(part_number, device_id)
VALUES (1001, 1),
      (1002, 1),
      (1003, 1),
      (1004, 2),
      (1005, 2),
      (1006, 2),
      (1007, 2),
      (1008, 2),
      (1009, NULL),
      (1010, NULL),
      (1011, NULL);