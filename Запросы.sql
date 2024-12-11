USE beauty_salon;
-- выдать список услуг и их стоимость
select name_service as 'Услуга', 
price as 'Цена' from services;

-- выдать список посетителей с их персональными данными
select name_client as 'ФИО клиента', 
phone_number as 'Номер телефона', 
address as 'Адрес' from clients;

-- рассчитать стоимость предоставленных услуг 
-- для заданного клиента за определенное посещение салона
select name_client as 'ФИО клиента', 
sum(price) as 'Стоимость предоставленных услуг за день' from Clients
inner join procedures_performed using(client_id)
inner join services using(service_id)
where client_id = 1 and date_time like '2024-11-11 %';

-- рассчитать стоимость предоставленных услуг 
-- за определенный промежуток времени
select sum(price) as 'Стоимость услуг за определённй период' from services 
inner join procedures_performed using(service_id)
where date_time between '2024-11-11 09:00:00' and '2024-11-12 16:00:00';

-- вывести список сотрудников с их персональными данными
select name_employee as 'ФИО сотрудника', 
position as 'Должность', 
phone_number as 'Номер телефона', 
address as 'Адрес' from employees;

-- сформировать график работы сотрудников
select name_employee as 'ФИО сотрудника', 
work_schedule as 'График работы' from employees
inner join work_schedules using(schedule_id);

-- рассчитать стоимость услуг по каждому сотруднику
select name_employee as 'ФИО сотрудника', 
sum(price) as 'Стоимость' from Employees
inner join procedures_performed using(employee_id)
inner join services using(service_id)
group by name_employee;


-- рассчитать стоимость потребленных услуг 
-- каждым посетителем
select name_client as 'ФИО клиента', 
sum(price) as 'Стоимость всех услуг' from clients
inner join procedures_performed using(client_id)
inner join services using(service_id)
group by name_client;


-- рассчитать стоимость и количество потраченных 
-- препаратов за определенный период
select name_preparation as 'Название препарата', 
count(preparation_id) as 'Количество потраченных препаратов', 
sum(price_preparation) as 'Стоимость потраченных препаратов'  
from preparations
inner join services using(preparation_id)
inner join procedures_performed using(service_id)
where date_time between '2024-11-11 09:00:00' and '2024-11-14 16:00:00'
group by name_preparation;



-- сформировать заказ на препараты, количество которых недостаточно для работы салона
select name_preparation as 'Название препарата', 
(30-number_of_preparation) as 'Нужно заказать', 
(30-number_of_preparation)*price_preparation as 'Затраты на недостающие препараты'  
from preparations
where number_of_preparation < 15;