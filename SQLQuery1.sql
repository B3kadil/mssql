--создаём таблицу container
CREATE TABLE container(
id INT PRIMARY KEY,
number INT,
тип NVARCHAR(MAX),
длина INT,
ширина INT,
высота INT,
вес INT,
пустой_непустой BIT,
дата_поступления DATETIME
);

--создаём таблицу operation
CREATE TABLE operation(
id INT PRIMARY KEY,
id_container INT FOREIGN KEY REFERENCES container(id),
дата_начала_операции DATETIME,
дата_окончания_операции DATETIME,
тип_операции NVARCHAR(MAX),
ФИО_оператора NVARCHAR(MAX),
место_инспекции NVARCHAR(MAX)
);

--преобразование в json с помощью запроса(CAST, CONVERT)
--контейнер
SELECT 
    '{ "id": ' + CAST(id AS NVARCHAR) + 
    ', "number": ' + CAST(number AS NVARCHAR) + 
    ', "тип": "' + тип + '"' + 
    ', "Длина": ' + CAST(длина AS NVARCHAR) + 
    ', "ширина": ' + CAST(ширина AS NVARCHAR) + 
    ', "высота": ' + CAST(высота AS NVARCHAR) + 
    ', "вес": ' + CAST(вес AS NVARCHAR) + 
    ', "пустой": ' + CAST(пустой_непустой AS NVARCHAR) + 
    ', "дата_поступления": "' + CONVERT(NVARCHAR, дата_поступления, 120) + '" }' AS JSONData
FROM container;

--операции (выбирается все данные определенного контейне)
SELECT 
    '{ "id": ' + CAST(id AS NVARCHAR) + 
    ', "id_container": ' + CAST(id_container AS NVARCHAR) + 
    ', "дата_начала_операции": "' + CONVERT(NVARCHAR, Дата_начала_операции, 120) + '"' + 
    ', "дата_окончания_операции": "' + CONVERT(NVARCHAR, Дата_окончания_операции, 120) + '"' + 
    ', "тип_операции": "' + Тип_операции + '"' + 
    ', "ФИО_оператора": "' + ФИО_оператора + '"' + 
    ', "место_инспекции": "' + Место_инспекции + '" }' AS JSONData
FROM operation WHERE id_container = 1;

