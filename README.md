Perseus is a set of scripts to test how distributed databases behaves when a leader is separated from the peer but maintain connection to the clients. 

| Database | Crashed leader | Isolated leader |
| --- | --- | --- |
| [TiDB](https://github.com/rystsov/perseus/tree/master/tidb) | 18s | [BUG](https://github.com/pingcap/tidb/issues/2676): 2m 40s |
| [CockroachDB](https://github.com/rystsov/perseus/tree/master/cockroachdb) | 10s | [BUG](https://github.com/cockroachdb/cockroach/issues/13541): 15m |
| [RethinkDB](https://github.com/rystsov/perseus/tree/master/rethinkdb) | 0.6s | 15s |
| [Etcd](https://github.com/rystsov/perseus/tree/master/etcd) | 2s | 2s |
| [Gryadka](https://github.com/rystsov/perseus/tree/master/gryadka) | 0s | 0s |

**Crashed leader:** duration of an unavailability window caused by a crashed leader (kill -9)

**Isolated leader:** duration of an unavailability window caused by a leader isolated from the peers by a network partitioning (iptables)