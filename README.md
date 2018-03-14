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
