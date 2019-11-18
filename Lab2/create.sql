/*==============================================================*/
/* DBMS name:      PostgreSQL 9.x                               */
/* Created on:     23.10.2019 21:16:19                          */
/*==============================================================*/


drop index "client has scheldule_FK";

drop index "place has many clients_FK";

drop index Client_PK;

drop table Client;

drop index Place_PK;

drop table Place;

drop index "schedule has many queue_FK";

drop index "place has many queue_FK";

drop index Queue_PK;

drop table Queue;

drop index Schedule_PK;

drop table Schedule;

/*==============================================================*/
/* Table: Client                                                */
/*==============================================================*/
create table Client (
   place_name           TEXT           not null,
   client_fullname      TEXT           not null,
   client_documents     TEXT           not null,
   date                 DATE                 not null,
   constraint PK_CLIENT primary key (client_documents)
);

/*==============================================================*/
/* Index: Client_PK                                             */
/*==============================================================*/
create unique index Client_PK on Client (
client_documents
);

/*==============================================================*/
/* Index: "place has many clients_FK"                           */
/*==============================================================*/
create  index "place has many clients_FK" on Client (
place_name
);

/*==============================================================*/
/* Index: "client has scheldule_FK"                             */
/*==============================================================*/
create  index "client has scheldule_FK" on Client (
date
);

/*==============================================================*/
/* Table: Place                                                 */
/*==============================================================*/
create table Place (
   place_name           TEXT           not null,
   place_site           TEXT           not null,
   type_of_service      TEXT           not null,
   constraint PK_PLACE primary key (place_name)
);

/*==============================================================*/
/* Index: Place_PK                                              */
/*==============================================================*/
create unique index Place_PK on Place (
place_name
);

/*==============================================================*/
/* Table: Queue                                                 */
/*==============================================================*/
create table Queue (
   date                 DATE                 not null,
   place_name           TEXT           not null,
   queue_name           TEXT           not null,
   queue_number         NUMERIC(2)           not null,
   number_of_people     NUMERIC(2)           not null,
   waiting_time         TIME                 not null,
   constraint PK_QUEUE primary key (queue_name)
);

/*==============================================================*/
/* Index: Queue_PK                                              */
/*==============================================================*/
create unique index Queue_PK on Queue (
queue_name
);

/*==============================================================*/
/* Index: "place has many queue_FK"                             */
/*==============================================================*/
create  index "place has many queue_FK" on Queue (
place_name
);

/*==============================================================*/
/* Index: "schedule has many queue_FK"                          */
/*==============================================================*/
create  index "schedule has many queue_FK" on Queue (
date
);

/*==============================================================*/
/* Table: Schedule                                              */
/*==============================================================*/
create table Schedule (
   time_in_queue        TIME                 not null,
   date                 DATE                 not null,
   push_notification    TEXT                 not null,
   constraint PK_SCHEDULE primary key (date)
);

/*==============================================================*/
/* Index: Schedule_PK                                           */
/*==============================================================*/
create unique index Schedule_PK on Schedule (
date
);

alter table Client
   add constraint "FK_CLIENT_CLIENT HA_SCHEDULE" foreign key (date)
      references Schedule (date)
      on delete restrict on update restrict;

alter table Client
   add constraint "FK_CLIENT_PLACE HAS_PLACE" foreign key (place_name)
      references Place (place_name)
      on delete restrict on update restrict;

alter table Queue
   add constraint "FK_QUEUE_PLACE HAS_PLACE" foreign key (place_name)
      references Place (place_name)
      on delete restrict on update restrict;

alter table Queue
   add constraint "FK_QUEUE_SCHEDULE _SCHEDULE" foreign key (date)
      references Schedule (date)
      on delete restrict on update restrict;

