from cassandra import ConsistencyLevel
from cassandra.cluster import Cluster
from cassandra.query import BatchStatement

if name == "main":
    cluster = Cluster(['127.0.0.1'], port=9042)
    session = cluster.connect(wait_for_all_pools=True)

    batch = BatchStatement(consistency_level=ConsistencyLevel.ANY)

    batch.add('UPDATE Client_place.Client_place SET place_name = \'KPI\''
              ' WHERE client_fullname = \'Alice Beyly)\' IF place_name =\'NAU\'')
    batch.add('UPDATE Schedule_queue.Schedule_queue SET queue_name = \'queue1\' WHERE'
              'time_in_queue = \'15:35\' '
              'IF date = \'2019-02-12\'')

    session.execute(batch)