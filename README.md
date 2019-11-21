## WIND NOD SETUP
(By performing the following steps, your node will be installed properly.)

(OS: Ubuntu 18.04 (64 Bit)

-------------------------------------------------------------------------

We install the necessary software for security. You can install more if you want.

```
sudo apt update
apt-get install fail2ban

```

We will generate the "api_key_hash" and "seed base58" codes required for the configuration file of the node.

```

apt install -y software-properties-common
apt install -y build-essential
apt install python-pip
pip install base58

```

Create a new file named “base58script.py”:

```

nano base58script.py

```

Copy the following information in the file:

Enter your seed in the following section

```

import base58
seed = "YOURSEEDHERE"
encoded_seed = base58.b58encode(seed)
print(encoded_seed)


```

Saved and close the file

```

CTRL S 
CTRL X

```

Activate your new script by the following command:
Run the following command to get your seed:
Keep that Base58 string 

```

chmod u+x base58script.py
python base58script.py

```
This is the result.

Save the resulting value. 

This is the "Wallet seed" value you will use in the configuration file.

root@vmi317203:~# python base58script.py

5y3VPzB2HwjFGvwQ9JMN54MAy2F2T7pPHurBCLfo


------------------------------------------------------------------------------------------

You can find your API key hash by the following steps:

You write your own password instead of "api key password"

```

curl -X POST --header 'Content-Type: application/json' --header 'Accept: application/json' -d 'api key password' 'http://144.91.84.27:6869/utils/hash/secure'

```

This is the result.

Record the hash value.

This is the "api-key-hash" value you will use in the configuration file.

{"message":"api key password","hash":"Df6wah7ibERpTWraHEzsPQvNoX5GnhHNbvJpZJD2C2Ze"}root@vmi317203:~#



We install the DOCKER program

```

sudo apt install apt-transport-https ca-certificates curl software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"

sudo apt update

apt-cache policy docker-ce

sudo apt install docker-ce

sudo systemctl status docker

Ctrl C

```


We install the git program

```

sudo apt install git

```

It's time to load the WIND node.

```

git clone https://github.com/windcoinplatform/WIND-node-docker-image.git

```

Now we're making custom changes to your node in the config file

```

cd WIND-node-docker-image
nano wind.custom.conf

```

In the opened file, we make the following changes from top to bottom

node-name = we are writing the node name

node-name = "MYNODE"

declared-address = SERVER We are writing the IP number. Remember to write 6860

declared-address = "144.91.84.27:6860"

seed = We are writing the seed we produced above

seed = "sJKV2N1rkDk12SV2rkDkm12SBkKQGBfL9mBJQGBfL9mBJ"

password = we set a password

password = "abcd123456"

api-key-hash = We are writing the hash value we generated above

api-key-hash = "afgfgedfg343453 ASFJSFASKLSFSLNFSDF"

```

    node-name = ""
    declared-address = ":6860"
    traffic-logger {
      ignore-tx-messages = [1, 2, 20, 21, 22, 24, 26, 27, 28]
      ignore-rx-messages = ${waves.network.traffic-logger.ignore-tx-messages}
    }
  }
  wallet {
    seed = ""
    password = ""
  }
  rest-api {
    enable = yes
    bind-address = "0.0.0.0"
    port = 6869
    api-key-hash = ""

```

Saved and close the file

```

CTRL S 
CTRL X

```

We create our Docker image.(Don't delete punctuation)


```
docker build -t node .

```

Finally we run the node

```

docker run -d -p 6860:6860 -p 6869:6869 node

```

NODE starts working.

To view node API documentation, open http://your ip:6869/ or

http://144.91.84.27:6869

To view WINDEXPLORER

http://144.91.84.27:8080

--------------------------------------------------------------------------------------------------------------------------------

