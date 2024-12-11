USE beauty_salon_2;

CREATE TABLE Preparations (
    preparation_id INT IDENTITY(1,1) PRIMARY KEY,
    name_preparation VARCHAR(50),
    number_of_preparation INT,
    price_preparation INT
);

CREATE TABLE Services (
    service_id INT IDENTITY(1,1) PRIMARY KEY,
    name_service VARCHAR(150),
    price INT,
    preparation_id INT,
    FOREIGN KEY (preparation_id) REFERENCES Preparations(preparation_id)
);

CREATE TABLE Clients (
    client_id INT IDENTITY(1,1) PRIMARY KEY,
    name_client VARCHAR(50),
    phone_number BIGINT,
    address VARCHAR(50)
);

CREATE TABLE Work_schedules (
    schedule_id INT IDENTITY(1,1) PRIMARY KEY,
    work_schedule VARCHAR(50)
);

CREATE TABLE Employees (
    employee_id INT IDENTITY(1,1) PRIMARY KEY,
    name_employee VARCHAR(50),
    position VARCHAR(50),
    phone_number BIGINT,
    address VARCHAR(50),
    schedule_id INT,
    FOREIGN KEY (schedule_id) REFERENCES Work_schedules(schedule_id)
);

CREATE TABLE Procedures_performed (
    procedure_id INT IDENTITY(1,1) PRIMARY KEY,
    client_id INT,
    service_id INT,
    employee_id INT,
    date_time DATETIME,
    FOREIGN KEY (client_id) REFERENCES Clients(client_id),
    FOREIGN KEY (service_id) REFERENCES Services(service_id),
    FOREIGN KEY (employee_id) REFERENCES Employees(employee_id)
);

INSERT INTO Clients (name_client, phone_number, address) VALUES 
('��������� ����� ���������', 89121013478, NULL),
('�������� ������ �����������', 89505673498, '��. ������ �. 2 ��. 12'),
('���������� ������� ��������', 89129672315, '��. ���������� �. 3 ��. 17'),
('����������� ����� ��������', 89505431521, NULL),
('�������� ����� ����������', 89129558317, '��. ���������� �. 23 ��. 9'),
('�������� ���� ������������', 89123456789, '��. ���������, �. 5 ��. 5'),
('������� ����� ��������', 89124567890, '��-� ������, �. 15 ��. 8'),
('������� ������� ���������', 89120123456, '��. �����, �. 4, �� 80'),
('���������� ��� ���������', 89123457643, NULL),
('�������� ������ ����������', 89125437623, NULL),
('��������� ������� ����������', 89128192245, NULL);

SELECT * FROM Clients;

INSERT INTO Work_schedules (work_schedule) VALUES 
('��, ��, �� 9:00 - 17:00'),
('��, ��, �� 9:00 - 17:00'),
('��, ��, ��, ��, �� 9:00 - 13:00'),
('��, ��, ��, ��, �� 13:00 - 17:00'),
('��, ��, ��, ��, �� 9:00 - 17:00');

SELECT * FROM Work_schedules;

INSERT INTO Employees (name_employee, position, phone_number, address, schedule_id) VALUES 
('���������� ���� ��������', '������ ��������/��������', 89121129112, '��. ������, �. 12 ��. 5', 1),
('��������� ���� ���������', '������ ��������/��������', 89129558932, '��. �������, �. 20 ��. 10', 2),
('��������� ������� ����������', '����������-�������', 89507842266, '��. ����������, �. 15 ��. 7', 3),
('���������� ����� ��������', '����������-�������', 89508863211, '��. �����, �. 14 ��. 1', 4),
('����� ����� ���������', '��������', 89120005478, '��. ���������, �. 6 ��. 2', 3),
('��������� ��������� ����������', '��������', 89120003389, '��. ������������, �. 4 ��. 5', 4),
('�������������� ������� ���������', '�������������', 89121024478, '��. ���������, �. 21 ��. 6', 5),
('�������� ���� ����������', '����-����������', 89121451567, '��. ���������, �. 26 ��. 2', 2);

SELECT * FROM Employees;

INSERT INTO Preparations (name_preparation, number_of_preparation, price_preparation) VALUES 
('Juvederm UltraSmile', 20, 14000), 
('Volbella', 30, 11000), 
('Teosyal Redensity', 15, 10000), 
('Kiss', 10, 13500), 
('Belotero Balance', 16, 12000), 
('Intense', 7, 13000), 
('Etermis 4', 5, 9500);

SELECT * FROM Preparations;

INSERT INTO Services (name_service, price, preparation_id) VALUES 
('C������/������� (��������)', 2400, NULL), 
('C������/������� (�������)', 2600, NULL), 
('C������/������� (�������)', 2800, NULL), 
('����������� (��������)', 2600, NULL), 
('����������� (�������)', 3200, NULL), 
('����������� (�������)', 3500, NULL), 
('������� �������� (������� + ������ � �������� ���� �����)', 3400, NULL),
('������� �������� (������� + �������� ���� �����)', 2800, NULL), 
('������� �������� (������� + �������� �����)', 2100, NULL), 
('������� �������� (������� + ������ � �������� ���� �����)', 4300, NULL), 
('������� �������� (������� + �������� �����)', 3500, NULL),
('��������� �������� ��� (Juvederm UltraSmile)', 19000, 1),
('��������� �������� ��� (Volbella)', 16000, 2),
('��������� �������� ��� (Teosyal Redensity)', 15500, 3),
('��������� �������� ��� (Kiss)', 18500, 4),
('��������� �������� ��� (Belotero Balance)', 17000, 5),
('��������� �������� ��� (Intense)', 18000, 6),
('��������� �������� ��� (Etermis 4)', 14500, 7),
('������ �������', 4500, NULL),
('�������� ������', 6000, NULL),
('��������� ������', 7000, NULL),
('����������� ������', 7000, NULL),
('������ ���������� ������', 1000, NULL),
('��������� ���������� ������', 4000, NULL),
('����������� ������', 1500, NULL),
('��������� ������', 1300, NULL),
('������������ ������', 1500, NULL);

SELECT * FROM Services;

INSERT INTO Procedures_performed (client_id, service_id, employee_id, date_time) VALUES 
(1, 2, 3, '2024-11-11 09:00:00'),
(1, 5, 3, '2024-11-11 10:00:00'),
(2, 7, 1, '2024-11-11 09:00:00'),
(2, 11, 2, '2024-11-11 10:00:00'),
(3, 15, 8, '2024-11-11 09:00:00'),
(3, 20, 5, '2024-11-11 09:00:00'),
(4, 18, 8, '2024-11-12 12:00:00'),
(5, 21, 5, '2024-11-12 09:00:00'),
(6, 23, 6, '2024-11-12 13:00:00'),
(7, 24, 6, '2024-11-12 16:00:00'),
(8, 27, 5, '2024-11-12 09:00:00'),
(9, 9, 2, '2024-11-12 11:00:00'),
(10, 13, 8, '2024-11-14 11:00:00'),
(11, 1, 3, '2024-11-13 10:00:00');

SELECT * FROM Procedures_performed;
