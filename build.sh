#! /bin/bash

print_usage(){
    echo "usage:"
	echo "if your host is installed eosio.cdt, compile with the following command"
	echo "$ build.sh eosio.cdt"
	echo "if your host is installed bos.cdt, compile with the following command"
	echo "$ build.sh bos.cdt"
}


cdt_version=1.4


SEDIOPTION=-i
ARCH=$( uname )
if ! [ "$ARCH" == "Linux" ]; then
SEDIOPTION="$SEDIOPTION '' "
fi

if [ "$1" == "bos.cdt" ];then
cdt_version=2.0.1
elif [ "$1" == "eosio.cdt" ];then
cdt_version=1.4
else
    print_usage && exit 0
fi

sed ${SEDIOPTION} 's/set(EOSIO_CDT_VERSION_MIN.*/set(EOSIO_CDT_VERSION_MIN "'${cdt_version}'")/g'           ./CMakeLists.txt
sed ${SEDIOPTION}  's/set(EOSIO_CDT_VERSION_SOFT_MAX.*/set(EOSIO_CDT_VERSION_SOFT_MAX "'${cdt_version}'")/g' ./CMakeLists.txt


printf "\t=========== Building eosio.contracts ===========\n\n"

RED='\033[0;31m'
NC='\033[0m'

CORES=`getconf _NPROCESSORS_ONLN`
mkdir -p build
pushd build &> /dev/null
cmake ../
make -j${CORES}
popd &> /dev/null
