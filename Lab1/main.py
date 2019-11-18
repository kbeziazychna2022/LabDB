from cassandra import ConsistencyLevel
from cassandra.cluster import Cluster
from cassandra.query import SimpleStatement, tuple_factory

if name == "main":
    cluster = Cluster(['127.0.0.1'], port=9042)
    session = cluster.connect('Client_queue', wait_for_all_pools=True)
    session.row_factory = tuple_factory

    query1 = SimpleStatement(
        "SELECT client_fullname,client_document,queue_number FROM \"Client_queue\"",
        consistency_level=ConsistencyLevel.LOCAL_ONE)
    executive1 = session.execute(query1)

    session = cluster.connect('Schedule_queue', wait_for_all_pools=True)
    session.row_factory = tuple_factory

    query2 = SimpleStatement(
        "SELECT date,time_in_queue,queue_name FROM \"Schedule_queue\"",
        consistency_level=ConsistencyLevel.LOCAL_ONE)
    executive2 = session.execute(query2)

    session = cluster.connect('Place_queue', wait_for_all_pools=True)
    session.row_factory = tuple_factory

    query3 = SimpleStatement(
        "SELECT type_of_service, waiting_time,number_of_people FROM \"Place_queue\"",
        consistency_level=ConsistencyLevel.LOCAL_ONE)
    executive3 = session.execute(query3)

    session = cluster.connect('Client_place', wait_for_all_pools=True)
    session.row_factory = tuple_factory

    query4 = SimpleStatement(
        "SELECT client_fullname,client_document,type_of_service FROM \"Client_place\"",
        consistency_level=ConsistencyLevel.LOCAL_ONE)
    executive4 = session.execute(query4)

    for Rows in executive1:
        print(Rows)
    for Rows in executive2:
        print(Rows)
    for Rows in executive3:
        print(Rows)
    for Rows in executive4:
        print(Rows)