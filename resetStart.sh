#!/bin/sh
GENESISDIR="./genesis.json"
ostype()
{
  osname=`uname -s`
  #echo "osname $osname"
  OSTYPE=UNKNOWN
  case $osname in
     "FreeBSD") OSTYPE="freebsd"
     ;;
     "SunOS") OSTYPE="solaris"
     ;;
     "Linux") OSTYPE="linux"
     ;;
     "Darwin") OSTYPE="mac"
     ;;
     "linux") OSTYPE="linux"
     ;;
     "darwin") OSTYPE="mac"
     ;;
     *) echo "other system $osname"
     ;;
    esac
  return 0
}
ostype
CHAINDB="./$OSTYPE/chaindb"
BINDIR="./$OSTYPE/cypher"

#echo "CHAINDB $CHAINDB"
#echo "BINDIR $BINDIR"

sudo rm -rf $CHAINDB/cypher $CHAINDB/cypher.ipc cypherlog.txt
$BINDIR --datadir "$CHAINDB" init $GENESISDIR
./start.sh $1
