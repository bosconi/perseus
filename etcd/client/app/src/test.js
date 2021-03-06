const {EtcdKV} = require("./EtcdKV");
const {ReadIncWriteTest} = require('perseus-base');

const nodes = [ ];

for (const [host, port] of [["etcd1", 2379],["etcd2", 2379],["etcd3", 2379]]) {
    nodes.push(new EtcdKV(host, host + ":" + port));
}

const test = new ReadIncWriteTest(nodes, 1000);

(async () => {
    try {
        await test.run();
    } catch(e) {
        console.info("WAT?!");
        console.info(e);
    }
})();
