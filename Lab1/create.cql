CREATE KEYSPACE IF NOT EXISTS "Client_place"
	WITH REPLICATION = {
	  'class' : 'SimpleStrategy',
	  'replication_factor' : 1
	}
AND DURABLE_WRITES = TRUE;

USE "Client_place";

CREATE TABLE IF NOT EXISTS "Client_place" (
	client_fullname text ,
	client_document map<text,text>,
	place_name text static ,
	place_site text,
	type_of_service set<frozen<map<text,text>>>,
	PRIMARY KEY((client_fullname),place_site)
);

CREATE KEYSPACE IF NOT EXISTS "Place_queue"
	WITH REPLICATION = {
	  'class' : 'SimpleStrategy',
	  'replication_factor' : 1
	}
AND DURABLE_WRITES = TRUE;

USE "Place_queue";

CREATE TABLE IF NOT EXISTS "Place_queue" (
	place_name text static ,
	place_site text,
	type_of_service set<frozen<map<text,text>>>,
	queue_name text ,
	queue_number int,
	number_of_people int,
	waiting_time text,
	PRIMARY KEY ((place_site,queue_name),number_of_people)
);

CREATE KEYSPACE IF NOT EXISTS "Client_queue"
	WITH REPLICATION = {
	  'class' : 'SimpleStrategy',
	  'replication_factor' : 1
	}
AND DURABLE_WRITES = TRUE;

USE "Client_queue";

CREATE TABLE IF NOT EXISTS "Client_queue" (
	client_fullname text static ,
	client_document map<text,text>,
	queue_name text ,
	queue_number int,
	number_of_people int,
	waiting_time text,
	PRIMARY KEY ((queue_name,queue_number),number_of_people,waiting_time)
);

CREATE KEYSPACE IF NOT EXISTS "Schedule_queue"
	WITH REPLICATION = {
	  'class' : 'SimpleStrategy',
	  'replication_factor' : 1
	}
AND DURABLE_WRITES = TRUE;

USE "Schedule_queue";

CREATE TYPE IF NOT EXISTS notification(
	name_notification text,
	info text
);

CREATE TABLE IF NOT EXISTS "Schedule_queue" (
	date text,
	time_in_queue text,
	push_notification frozen<notification>,
	queue_name text STATIC ,
	queue_number int,
	number_of_people int,
	waiting_time text,
	PRIMARY KEY((date,time_in_queue),queue_number)
);