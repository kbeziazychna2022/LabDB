#client

INSERT INTO public.client(
	place_name, client_fullname, client_documents, date)
	VALUES ('Hospital', 'Alice Cooper', 'HE231456', '1999-09-14');
INSERT INTO public.client(
	place_name, client_fullname, client_documents, date)
	VALUES ('Library', 'Jughead Jones', 'HT213478', '2009-12-14');
INSERT INTO public.client(
	place_name, client_fullname, client_documents, date)
	VALUES ('Univesity', 'Veronica Lorge', 'HT670934', '1975-12-14');

#place

INSERT INTO public.place(
	place_name, place_site, type_of_service)
	VALUES ('Hospital', 'hospital@i.ua', 'mrt');
INSERT INTO public.place(
	place_name, place_site, type_of_service)
	VALUES ('Library', 'lib@i.ua', 'give book');
INSERT INTO public.place(
	place_name, place_site, type_of_service)
	VALUES ('University', 'univ@i.ua', 'studentbook');

#queue

INSERT INTO public.queue(
	date, place_name, queue_name, queue_number, number_of_people, waiting_time)
	VALUES ('1999-09-14', 'Hospital', 'Queue4',3, 56, '00:15');
INSERT INTO public.queue(
	date, place_name, queue_name, queue_number, number_of_people, waiting_time)
	VALUES ('2009-12-14', 'Library', 'Queue2',1, 2, '00:01');
INSERT INTO public.queue(
	date, place_name, queue_name, queue_number, number_of_people, waiting_time)
	VALUES ('1977-09-14', 'University', 'Queue3',10, 21, '00:23');

#schedule

INSERT INTO public.schedule(
	time_in_queue, date, push_notification)
	VALUES ('12:00','1998-09-14', 'your queue1');
INSERT INTO public.schedule(
	time_in_queue, date, push_notification)
	VALUES ('13:00','2007-12-14', 'your queue2');
INSERT INTO public.schedule(
	time_in_queue, date, push_notification)
	VALUES ('15:00','1977-12-14', 'your queue3');