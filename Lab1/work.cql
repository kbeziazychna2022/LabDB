//1 query and insert/update/delete
INSERT INTO "Client_place" (client_fullname,client_document,place_name,place_site,type_of_service)
	VALUES('Andre Malis',{'passport': 'HE120956', 'id': '1234567890'}, 'HospitalKPI','hospital@gmail.com', {{'doctor':'MR.Mars'},{'room': '234'}} );
INSERT INTO "Client_place" (client_fullname,client_document,place_name,place_site,type_of_service)
	VALUES('Anastasia Keyn',{'passport': 'HE123456', 'id': '0987654321'}, 'KPI','kpi@gmail.com', {{'teacher':'MR.Like'},{'room': '17-456'}} );
INSERT INTO "Client_place" (client_fullname,client_document,place_name,place_site,type_of_service)
	VALUES('Alice Beyly',{'passport': 'HE100946', 'id': '0639054321'}, 'Passport','PS@gmail.com', {{'window':'3'},{'room': '105'}} );

SELECT * FROM "Client_place"; 

UPDATE "Client_place" SET client_document = {'passport': 'HE123496', 'id': '0987654323'}
WHERE client_fullname = 'Anastasia Keyn' AND place_site = 'kpi@gmail.com';  
SELECT * FROM "Client_place";   
UPDATE "Client_place" SET place_name = 'NAU'
WHERE client_fullname = 'Alice Beyly';
SELECT * FROM "Client_place";
UPDATE "Client_place" SET type_of_service = {{'doctor':'MR.Ladohy'},{'room': '34'}}
WHERE client_fullname = 'Andre Malis' AND place_site = 'hospital@gmail.com';
SELECT * FROM "Client_place"; 
  
SELECT client_fullname,client_document,type_of_service
FROM "Client_place"; 

DELETE FROM "Client_place" WHERE client_fullname = 'Alice Beyly';
DELETE place_name FROM "Client_place" WHERE client_fullname = 'Andre Malis' ;
DELETE place_name FROM "Client_place" WHERE client_fullname = 'Anastasia Keyn' ;
SELECT * FROM "Client_place";
//2 query and insert/update/delete
INSERT INTO "Place_queue" (place_name,place_site,type_of_service, queue_name,queue_number, number_of_people,waiting_time)
	VALUES('Hospital','hosp@i.ua',{{'doctor':'MR.Man'},{'room': '2123'}}, 'queue_hospital',8 ,50, '20 minute' );
INSERT INTO "Place_queue" (place_name,place_site,type_of_service, queue_name,queue_number, number_of_people,waiting_time)
	VALUES('Dekanat','dekan@i.ua',{{'dekan':'Mrs.Eilish'},{'room': '5-102'}}, 'diplom',3 ,10, '5 minute' );
INSERT INTO "Place_queue" (place_name,place_site,type_of_service, queue_name,queue_number, number_of_people,waiting_time)
	VALUES('CoralTravel','coral@i.ua',{{'asisstante':'Mrs. Danish'},{'room': '32'}}, 'Holiday',2 ,5, '45 minute' );
SELECT * FROM "Place_queue" ;

UPDATE "Place_queue" SET place_name = 'Clinic'
WHERE queue_name = 'queue_hospital'  AND place_site = 'hosp@i.ua';  
SELECT * FROM "Place_queue" ;
UPDATE "Place_queue" SET type_of_service = {{'dekan':'Mrs.Temnikova'},{'room': '2-14'}}
WHERE queue_name = 'diplom'  AND place_site = 'dekan@i.ua' AND number_of_people = 10;  
SELECT * FROM "Place_queue" ;
UPDATE "Place_queue" SET queue_number = 2
WHERE queue_name = 'diplom'  AND place_site = 'dekan@i.ua' AND number_of_people = 10;  
SELECT * FROM "Place_queue" ;

SELECT type_of_service, waiting_time,number_of_people
FROM "Place_queue";

DELETE FROM "Place_queue" WHERE place_site= 'hosp@i.ua' AND queue_name ='queue_hospital';
DELETE place_name FROM "Place_queue" WHERE place_site = 'dekan@i.ua' AND queue_name ='diplom' ;
DELETE place_name FROM "Place_queue" WHERE place_site = 'coral@i.ua' AND queue_name ='Holiday';
SELECT * FROM "Place_queue";
//3 query and insert/update/delete
INSERT INTO "Client_queue" (client_fullname,client_document, queue_name,queue_number, number_of_people,waiting_time)
	VALUES('Alex Malik',{'passport': 'HE120956', 'id': '1234567890'},'plane',8 ,50, '20 minute' );
INSERT INTO "Client_queue" (client_fullname,client_document, queue_name,queue_number, number_of_people,waiting_time)
	VALUES('Bettie Rock',{'passport': 'HE998877', 'id': '2345098761'},'train',3 ,50, '10 minute' );
INSERT INTO "Client_queue" (client_fullname,client_document, queue_name,queue_number, number_of_people,waiting_time)
	VALUES('Lisa Benks',{'passport': 'HF134956', 'id': '1200992290'},'service',12 ,100, '35 minute' );
SELECT * FROM "Client_queue" ;

UPDATE "Client_queue" SET client_fullname = 'Alice Malik'
WHERE queue_name = 'plane'  AND queue_number = 8;  
SELECT * FROM "Client_queue" ;
UPDATE "Client_queue" SET client_document = {'passport': 'SF998877', 'id': '2345098761'}
WHERE queue_name = 'train'  AND queue_number = 3 AND waiting_time = '10 minute' AND number_of_people = 50;  
SELECT * FROM "Client_queue" ;
UPDATE "Client_queue" SET client_fullname = 'Lisa Berks' 
WHERE queue_name = 'service'  AND queue_number = 12; 
SELECT * FROM "Client_queue" ;

SELECT client_fullname,client_document,queue_number
FROM "Client_queue";

DELETE FROM "Client_queue" WHERE queue_number = 8 AND queue_name ='plane';
DELETE client_fullname FROM "Client_queue" WHERE queue_number = 3 AND queue_name ='train' ;
DELETE client_fullname FROM "Client_queue" WHERE queue_number = 12 AND queue_name ='service';
SELECT * FROM "Client_queue";
//4 query and insert/update/delete
INSERT INTO "Schedule_queue"(date,time_in_queue,push_notification,queue_name,queue_number,
	number_of_people,waiting_time)
	VALUES('2019-02-14','15:05',{"name_notification":'queue1',"info":'your queue'},'queue1',1,65,'1 minute');
INSERT INTO "Schedule_queue"(date,time_in_queue,push_notification,queue_name,queue_number,
	number_of_people,waiting_time)
	VALUES('2019-02-12','15:35',{"name_notification":'queue2',"info":'2 people left'},'queue2',3,19,'15 minute');
INSERT INTO "Schedule_queue"(date,time_in_queue,push_notification,queue_name,queue_number,
	number_of_people,waiting_time)
	VALUES('2019-02-13','17:00',{"name_notification":'queue3',"info":'31 people left'},'queue3',91,125,'2 hours');
SELECT * FROM "Schedule_queue";

UPDATE "Schedule_queue" SET queue_name = 'queue1'
WHERE time_in_queue = '15:35' AND date = '2019-02-12';
SELECT * FROM "Schedule_queue";
UPDATE "Schedule_queue" SET push_notification = {name_notification:'queue10',info:'31 people left'} 
WHERE  date = '2019-02-13' AND time_in_queue = '17:00' AND queue_number = 91;
SELECT * FROM "Schedule_queue";
UPDATE "Schedule_queue" SET queue_name = 'queue3'
WHERE time_in_queue = '15:05' AND date = '2019-02-14';
SELECT * FROM "Schedule_queue";

SELECT date,time_in_queue,queue_name
FROM "Schedule_queue";

DELETE FROM "Schedule_queue" WHERE date = '2019-02-14' AND time_in_queue = '15:05';
DELETE queue_name FROM "Schedule_queue" WHERE date = '2019-02-13' AND time_in_queue = '17:00' ;
DELETE queue_name FROM "Schedule_queue" WHERE date = '2019-02-12' AND time_in_queue = '15:35' ;
SELECT * FROM "Schedule_queue";


