-- Creating table container
CREATE TABLE container (
id INT PRIMARY KEY,
number INT,
type NVARCHAR(MAX),
length INT,
width INT,
height INT,
weight INT,
empty_not_empty BIT,
arrival_date DATETIME
);

-- Creating table operation
CREATE TABLE operation (
id INT PRIMARY KEY,
container_id INT FOREIGN KEY REFERENCES container(id),
operation_start_date DATETIME,
operation_end_date DATETIME,
operation_type NVARCHAR(MAX),
operator_name NVARCHAR(MAX),
inspection_location NVARCHAR(MAX)
);

-- Conversion to JSON using queries (CAST, CONVERT)
-- container
SELECT
'{ "id": ' + CAST(id AS NVARCHAR) +
', "number": ' + CAST(number AS NVARCHAR) +
', "type": "' + type + '"' +
', "length": ' + CAST(length AS NVARCHAR) +
', "width": ' + CAST(width AS NVARCHAR) +
', "height": ' + CAST(height AS NVARCHAR) +
', "weight": ' + CAST(weight AS NVARCHAR) +
', "empty": ' + CAST(empty_not_empty AS NVARCHAR) +
', "arrival_date": "' + CONVERT(NVARCHAR, arrival_date, 120) + '" }' AS JSONData
FROM container;

-- operations (selecting all data for a specific container)
SELECT
'{ "id": ' + CAST(id AS NVARCHAR) +
', "container_id": ' + CAST(container_id AS NVARCHAR) +
', "operation_start_date": "' + CONVERT(NVARCHAR, operation_start_date, 120) + '"' +
', "operation_end_date": "' + CONVERT(NVARCHAR, operation_end_date, 120) + '"' +
', "operation_type": "' + operation_type + '"' +
', "operator_name": "' + operator_name + '"' +
', "inspection_location": "' + inspection_location + '" }' AS JSONData
FROM operation WHERE container_id = 1;
