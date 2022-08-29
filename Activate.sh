#!/usr/bin/env sh

ClientSSH(){
   sshpass -p 'alpine' ssh -o StrictHostKeyChecking=no root@localhost -p1082 $1;
};

ClientSCP(){
   sshpass -p 'alpine' scp -P 1082 -rp $1 root@localhost:$2;
};

if test -z $(find ~/.ssh -iname known_hosts);
then
   sleep 1;
else
   rm ~/.ssh/known_hosts;
fi;

iproxy 1082 44 &>log&
ClientSSH 'mount -o rw,union,update /';
