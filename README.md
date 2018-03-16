# guotianchain

基于hyperledger-fabric 1.0.6构建的guotianchain链，实现了 1个orderer + 两个联盟4个peer节点的拓扑网络结构。

运行前准备
1. curl、docker、docker-compose、golang 等

2. github上下载代码
   
   git clone https://github.com/Guotian-Dev/guotianchain.git

3. 下载 fabric v1.0.6 docker 镜像
  
4. 平台运行fabric特定的二进制bin，需要下载1.0.6版本的二进制文件，下载之后保存到当前目录到bin文件夹下，
   cd guotianchain
   curl -sSL https://goo.gl/6wtTN5 | bash -s 1.0.6


运行
1. 进入的first-network目录
   cd first-network

2. 生成节点的公钥和证书
   ./byfn.sh -m generate

3. 启动区块链
   ./byfn.sh -m up

4. 关闭区块链
   ./byfn.sh -m down

5. 重启区块链
   ./byfn.sh -m restart


chaincode 安装和使用，使用安装token（积分代币）的例子
1. peer安装
   peer chaincode install -n token -v 1.0 -p github.com/hyperledger/fabric/examples/chaincode/go/token/chaincode

2. 初始化
   peer chaincode instantiate -o orderer.guotianchain.com:7050  -C guotianchannel -n token -v 1.0 -p github.com/token/chaincode -c '{"Args":["init","{"name: "Fabric Demo Token", "symbol": "FTD", "decimals": 2, "totalSupply": 1000}"]}'

   peer chaincode instantiate -o orderer.example.com:7050 --tls --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/example.com/orderers/orderer.example.com/msp/tlscacerts/tlsca.example.com-cert.pem -C $CHANNEL_NAME -n mycc -v 1.0 -c '{"Args":["init","a", "100", "b","200"]}' -P "OR ('Org1MSP.peer','Org2MSP.peer')"

3. 调用合约

3.1 查询金额
   peer chaincode query -C guotianchannel -n token -c '{"Args":["balance","{"user"; "myuser"}"]}'

3.2 转帐
   peer chaincode invoke -o orderer_address:7050 -C mychannel -n token -c '{"Args":["transfer","{"to": "otherUser", "value": 200}"]}'

cli操作chaincode
1. 重新启动cli
   
   docker stop <CONTAINER_ID>：停止container
   docker start <CONTAINER_ID>：重新启动container

   本次例子
   docker start 2204744796dd

2. 进入cli容器内部,先用以下命令进入CLI内部Bash：
   docker exec -it cli bash

3. 查询chaincode
   peer chaincode query -C guotianchannel -n mycc -c '{"Args":["query","a"]}'










