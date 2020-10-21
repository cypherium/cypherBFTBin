
Operating system support
---
Cypherium is compatible with Mac, Windows, and Linux operating system.

Public iP for VPS is needed
--
Your ip of your machine or VPS which used to deploy cypher node  must be `public IP`.such AWS ec2 which has `public IP` to deploy your cypher node!
Please open 8000,6000,9090,7100 ports for UDP and TCP rule for VPS.`

Install the openssl
--

for linux
 ```
sudo apt-get install openssl
sudo apt-get install libssl-dev
 ```
for mac:
 ```
git clone https://github.com/openssl/openssl
cd openssl
sudo ./config --prefix=/usr/local/openssl
make
make install
openssl version
 ```
Download repository
---
 We suggest you switch your computer account to root account
 #### 1. Install Git:
   for linux,run follow command:
    ```
   sudo apt-get install git  
    ```

   for mac,visit follow URL to install:
    ```
    http://sourceforge.net/projects/git-osx-installer/
    ```
 #### 2. Open the terminal and clone repository:
 ```
  git clone https://github.com/cypherium/cypherBFTBin.git
  cd cypherBFTBin
  ls
 ```
 #### 3.List the mainly use files
  `resetStart.sh`:can delete chaindb automic,and restart chaind directly,the txBlock and keyBlock will syn from 0.
  `start.sh`:continue the txBlock and keyBlock Height,and going on.<br>

   Below are all start mode commands:<br>
   ```./start.sh --silent```or ```./start.sh 0``` :start cypher application and output the log to the cypherlog.txt<br>
   ```./start.sh --detail```or ```./start.sh 1```:start cypher application and print the log online<br>
   ```./resetStart.sh --silent```or ```./start.sh 0```:reset start cypher application and output the log to the cypherlog.txt<br>
   ```./resetStart.sh --detail```or ```./start.sh 1```:reset start cypher application and print the log online<br>

 Run the cypher
 ---

 #### init database
 We suggest you run the script under root account of computer
 for console detail print mode you should run this:
 ```
 sudo ./start.sh --detail
 ```
 or  for silent mode ,you should run this
 ```
 sudo ./start.sh
 ```
 now the log is output to the `cypherlog.txt` file,you can check  the dynamic log.
Congratulations! You have successfully started the Cypherium Node!

Troubleshooting
---
   #### If you get `panic: not exists jdk class!` crash
   * Execute `sudo passwd` to create root password if you have not created.
   * Please give the `jdk` folder read/write permission by typing `sudo chmod -R 777 ./jdk`.
   #### If you cannot execute the bin, try the following tips:
   *  Make sure you are operating on the root account of your computer. (You can do this with the command “sudo” and entering your password.
   If you have not created a root password yet, `sudo passwd` will help you set a password to your root account.)
   * Execute command `sudo chmod -R 777 .` when your current directory path is at `../cypherBFTBin/`
   * Execute `sudo rm -rf chaindb` to delete the database. Then, regenerate the database by executing `./cypher -–datadir chaindb  init ../genesis.json`
   * Execute shell `./resetStart.sh` can delete database automic,and restart directly.As soon as you finding the chainId is different from previous chaindId which is checked through executing
   *  Make sure you are operating on the root account of your computer. (You can do this with the command “su” and entering your password.
   If you have not created a root password yet, `sudo passwd` will help you set a password to your root account.)
   * Execute command `sudo chmod -R 777 .` when your current directory path is at `../cypherBFTBin/`
   * Execute `sudo rm -rf chaindb` to delete the database. Then, regenerate the database by executing `./cypher -–datadir chaindb  init ../genesis.json`
   * Execute shell `./resetStart.sh` can delete database automic,and restart directly.As soon as you finding the chainId is different from previous chaindId which is checked through executing

With the database up and running, try out these commands
---

#### 1. cph.txBlockNumber

#### 2. personal.newAccount("cypher2019xxddlllaaxxx")
Among " " your should assign one password

#### 3. net

#### 4. admin.peers

#### 5. cph.accounts
    list all the accounts
#### 6. cph.getBalance(...)
cph.getBalance("0x2dbde7263aaaf1286b9c41b1138191e178cb2fd4")
   The string of “ 0x2dbde7263aaaf1286b9c41b1138191e178cb2fd4” is your wallet account.
This	wallet account string you shoud copy and store it when you executiong comand
 “ personal.newAccount(...) “; also your can using command “ cph.accounts ” to find if from  serveal acccounts.

Txpool
--
#### 1.txpool.status

#### 2.txpool.content
 all transactions in your nodes database and memory


Manual send transaction demonstration
--
#### 1.Guarantee you have two account
check this through “cph.accounts”

If you do not have,please new two accouts by using comand “ personal.newAccount() “
#### 2.check your account balance
```
 cph.getBalance("0x461f9d24b10edca41c1d9296f971c5c028e6c64c")
 cph.getBalance("0x01482d12a73186e9e0ac1421eb96381bbdcd4557")
```
#### 3.unlock your account
```
personal.unlockAccount("0x461f9d24b10edca41c1d9296f971c5c028e6c64c")
```
#### 4.sendTransaction
```
cph.sendTransaction({from:'461f9d24b10edca41c1d9296f971c5c028e6c64c',to: '01482d12a73186e9e0ac1421eb96381bbdcd4557', value: 1000000000000000000})
```
#### 5.wait several seconds to checkout balance
```
 cph.getBalance("0x461f9d24b10edca41c1d9296f971c5c028e6c64c")
 cph.getBalance("0x01482d12a73186e9e0ac1421eb96381bbdcd4557")
```
RUN:Operator miner functions
---
#### 1.miner.start(1, "0x2dbde7263aaaf1286b9c41b1138191e178cb2fd4")
First param 1 is for threads accord to you computer power;Second param is "0x2dbde7263aaaf1286b9c41b1138191e178cb2fd4" is your account.You must be enter your password.


#### 2.miner.status()
After miner.start(),your can check your current status or your current node role by using function for miner.status():

You will wait minimum 1 hour to check with command function for miner.status() to confirm whether your node have been promoted successfully.
If you are node accounts status is "I'm committee member, Doing consensus." or "I'm leader, Doing consensus."your account have been chosen into committee successfully:


Finally,after waiting about 1 hour you can check you account’s balance through function for cph.getBalance()
#### 3.miner.content()
you can check miner’s candidate from yourself and other nodes.


#### 4.miner.stop()
Stop the to find candidate to take part in consensus.

Current version for user
---
Current Version: 0.1<br>
ChainId: 16100<br>
Update: <br>
User needs to do:```git pull``` ```./resetStart.sh```


