--������ ������� container
CREATE TABLE container(
id INT PRIMARY KEY,
number INT,
��� NVARCHAR(MAX),
����� INT,
������ INT,
������ INT,
��� INT,
������_�������� BIT,
����_����������� DATETIME
);

--������ ������� operation
CREATE TABLE operation(
id INT PRIMARY KEY,
id_container INT FOREIGN KEY REFERENCES container(id),
����_������_�������� DATETIME,
����_���������_�������� DATETIME,
���_�������� NVARCHAR(MAX),
���_��������� NVARCHAR(MAX),
�����_��������� NVARCHAR(MAX)
);

--�������������� � json � ������� �������(CAST, CONVERT)
--���������
SELECT 
    '{ "id": ' + CAST(id AS NVARCHAR) + 
    ', "number": ' + CAST(number AS NVARCHAR) + 
    ', "���": "' + ��� + '"' + 
    ', "�����": ' + CAST(����� AS NVARCHAR) + 
    ', "������": ' + CAST(������ AS NVARCHAR) + 
    ', "������": ' + CAST(������ AS NVARCHAR) + 
    ', "���": ' + CAST(��� AS NVARCHAR) + 
    ', "������": ' + CAST(������_�������� AS NVARCHAR) + 
    ', "����_�����������": "' + CONVERT(NVARCHAR, ����_�����������, 120) + '" }' AS JSONData
FROM container;

--�������� (���������� ��� ������ ������������� ��������)
SELECT 
    '{ "id": ' + CAST(id AS NVARCHAR) + 
    ', "id_container": ' + CAST(id_container AS NVARCHAR) + 
    ', "����_������_��������": "' + CONVERT(NVARCHAR, ����_������_��������, 120) + '"' + 
    ', "����_���������_��������": "' + CONVERT(NVARCHAR, ����_���������_��������, 120) + '"' + 
    ', "���_��������": "' + ���_�������� + '"' + 
    ', "���_���������": "' + ���_��������� + '"' + 
    ', "�����_���������": "' + �����_��������� + '" }' AS JSONData
FROM operation WHERE id_container = 1;

