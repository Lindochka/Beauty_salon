USE beauty_salon; 

CREATE TABLE Preparations (
preparation_id INT AUTO_INCREMENT PRIMARY KEY,
 name_preparation VARCHAR(50),
 number_of_preparation INT,
 price_preparation INT);
 
 
CREATE TABLE Services (
service_id INT AUTO_INCREMENT PRIMARY KEY,
 name_service VARCHAR(150),
 price INT,
 preparation_id INT,
 FOREIGN KEY (preparation_id) REFERENCES Preparations(preparation_id) 
 );
 
CREATE TABLE Clients (
client_id INT AUTO_INCREMENT PRIMARY KEY,
 name_client VARCHAR(50),
 phone_number BIGINT,
 address varchar(50)
 );
 
CREATE TABLE Work_schedules (
schedule_id INT AUTO_INCREMENT PRIMARY KEY,
 work_schedule VARCHAR(50)
 );
 
 CREATE TABLE Employees (
employee_id INT AUTO_INCREMENT PRIMARY KEY,
 name_employee VARCHAR(50),
 position VARCHAR(50),
 phone_number BIGINT,
 address varchar(50),
 schedule_id INT,
 FOREIGN KEY (schedule_id) REFERENCES Work_schedules(schedule_id) 
 );
 
 CREATE TABLE Procedures_performed (
procedure_id INT AUTO_INCREMENT PRIMARY KEY,
 client_id INT,
 service_id INT,
 employee_id INT,
 date_time DATETIME,
 FOREIGN KEY (client_id) REFERENCES Clients(client_id),
 FOREIGN KEY (service_id) REFERENCES Services(service_id), 
 FOREIGN KEY (employee_id) REFERENCES employees(employee_id) 
);
 
 
INSERT INTO clients (name_client, phone_number, address) values 
('Лоскутова Линда Сергеевна', 89121013478, NULL),
('Зулпуева Элмира Нургазыевна', 89505673498, 'ул. Ленина д. 2 кв. 12'),
('Капибарова Анджела Игоревна', 89129672315, 'ул. Ломоносова д. 3 кв. 17'),
('Апельсинова Ирина Олеговна', 89505431521, NULL),
('Демидова Ольга Валериевна', 89129558317, 'ул. Лермонтова д. 23 кв. 9'),
('Смирнова Анна Владимировна', 89123456789, 'ул. Цветочная, д. 5 кв. 5'),
('Иванова Мария Ивановна', 89124567890, 'пр-т Ленина, д. 15 кв. 8'),
('Громова Татьяна Сергеевна', 89120123456, 'ул. Ясная, д. 4, кв 80'),
('Старостина Яна Антоновна', 89123457643, NULL),
('Лебедева Галина Николаевна', 89125437623, NULL),
('Сидоренко Татьяна Генадьевна', 89128192245, NULL);
SELECT * FROM clients;


INSERT INTO Work_schedules (work_schedule) VALUES 
('пн, ср, пт 9:00 - 17:00'),
('вт, чт, сб 9:00 - 17:00'),
('пн, вт, ср, чт, пт 9:00 - 13:00'),
('пн, вт, ср, чт, пт 13:00 - 17:00'),
('пн, вт, ср, чт, пт 9:00 - 17:00');
SELECT * FROM work_schedules;


INSERT INTO Employees (name_employee, position, phone_number, address, schedule_id) values 
('Маникюрова Анна Игоревна', 'Мастер маникюра/педикюра', 89121129112, 'ул. Лесная, д. 12 кв. 5', 1),
('Дизайнова Инга Никитична', 'Мастер маникюра/педикюра', 89129558932, 'ул. Золотая, д. 20 кв. 10', 2),
('Стрижкова Наталья Николаевна', 'Парикмахер-стилист', 89507842266, 'ул. Московская, д. 15 кв. 7', 3),
('Постригала Мария Петровна', 'Парикмахер-стилист', 89508863211, 'ул. Южная, д. 14 кв. 1', 4),
('Пудра Ольга Сергеевна', 'Визажист', 89120005478, 'ул. Сибирская, д. 6 кв. 2', 3),
('Румянцева Валентина Викторовна', 'Визажист', 89120003389, 'ул. Чистопрудная, д. 4 кв. 5', 4),
('Главенственная Феличия Филюсовна', 'Администратор', 89121024478, 'ул. Фруктовая, д. 21 кв. 6', 5),
('Губкокол Алла Максимовна', 'Врач-косметолог', 89121451567, 'ул. Питерская, д. 26 кв. 2', 2);
SELECT *FROM Employees;

 INSERT INTO Preparations (name_preparation, number_of_preparation, price_preparation) VALUES 
('Juvederm UltraSmile', 20, 14000), 
('Volbella', 30, 11000), 
('Teosyal Redensity', 15, 10000), 
('Kiss', 10, 13500), 
('Belotero Balance', 16, 12000), 
('Intense', 7, 13000), 
('Etermis 4', 5, 9500);
SELECT * FROM preparations;
 
 
  INSERT INTO services (name_service, price, preparation_id) VALUES 
('Cкрижка/Укладка (Короткие)', 2400, NULL), 
('Cкрижка/Укладка (Средние)', 2600, NULL), 
('Cкрижка/Укладка (Длинные)', 2800, NULL), 
('Окрашивание (Короткие)', 2600, NULL), 
('Окрашивание (Средние)', 3200, NULL), 
('Окрашивание (Длинные)', 3500, NULL), 
('Маникюр комплекс (Маникюр + снятие и покрытие гель лаком)', 3400, NULL),
('Маникюр комплекс (Маникюр + покрытие гель лаком)', 2800, NULL), 
('Маникюр комплекс (Маникюр + покрытие лаком)', 2100, NULL), 
('Маникюр комплекс (Педикюр + снятие и покрытие гель лаком)', 4300, NULL), 
('Маникюр комплекс (Педикюр + покрытие лаком)', 3500, NULL),
('Контурная пластика губ (Juvederm UltraSmile)', 19000, 1),
('Контурная пластика губ (Volbella)', 16000, 2),
('Контурная пластика губ (Teosyal Redensity)', 15500, 3),
('Контурная пластика губ (Kiss)', 18500, 4),
('Контурная пластика губ (Belotero Balance)', 17000, 5),
('Контурная пластика губ (Intense)', 18000, 6),
('Контурная пластика губ (Etermis 4)', 14500, 7),
('Макияж дневной', 4500, NULL),
('Вечерний макияж', 6000, NULL),
('Свадебный макияж', 7000, NULL),
('Наращивание ресниц', 7000, NULL),
('Снятие наращенных ресниц', 1000, NULL),
('Коррекция наращенных ресниц', 4000, NULL),
('Архитектура бровей', 1500, NULL),
('Коррекция бровей', 1300, NULL),
('Окрашиваание бровей', 1500, NULL);
SELECT * FROM services;


INSERT INTO procedures_performed (client_id, service_id, employee_id, date_time) VALUES 
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
SELECT * FROM procedures_performed;


