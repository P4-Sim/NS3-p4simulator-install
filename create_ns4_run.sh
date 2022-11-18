#! /bin/bash
cd ../ns-allinone-3.27/ns-3.27/
echo "#! /bin/bash
touch res.txt
./waf configure --enable-examples
./waf build
./waf --run src/ns4/examples/p4-example" >run.sh
