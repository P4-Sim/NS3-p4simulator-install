## Overview

This is the p4simulator module in ns3 install scripts to help you download, install, run p4simulator quickly. By now we have tested it successfully on Ubuntu 20.04.

## p4simulator Installation

We recommend to install P4Simulator step by step, because there may be some errors in the installation process. We also provide a one-click installation script(`install_deps.sh`) to install P4Simulator. 

### download p4simulator install scripts

   `$ git clone https://github.com/Mingyumaz/NS3-p4simulator-install.git`   

   `$ cd NS3-p4simulator-install`

**You can choose one of the following ways to install P4Simulator.** 

The install process could be time-consuming, and we are thinking about a better way, so stay tuned!

### The first way: install P4Simulator step by step(recommend)

**1 install ns3**

`#bash install_ns3_pre.sh`

`#bash install_ns3.sh`

Here is a **[bug](https://www.nsnam.org/bugzilla/show_bug.cgi?id=2917)** in ns3, so you need to fix it by yourself before build(also you can see the last section).

PS: in line `../src/mesh/model/dot11s/ie-dot11s-beacon-timing.cc:209` from `catch (std::bad_cast)` to `catch (std::bad_cast&)` instead.

**2 install bmv2**

`#bash install_bmv2.sh`

**3 install p4c-bm**

`#bash install_p4c-bm.sh`

**4 install P4Simulator**

`#bash install_p4simulator.sh`

### The Second Way: install P4Simulator one step

`#bash install_deps.sh`

### The Third Way: install from the VM

For the Ubuntu 20.04, We recommend the use of the method **[Creating the VM](https://github.com/p4lang/tutorials/tree/master/vm-ubuntu-20.04)**. This creates the virtual machine and establishes the users p4 and vagrant, where the environment and source code are built under the user vagrant, and the developer can just use the p4 user.

After that, you can build the whole project with this Ubuntu VM, noting that bmv2 recommends that you build from source (with modifications such as turning on virtual queues, etc.).

## Run p4simulator in ns3

If everything goes well, you will find you are in this folder(ns-3.27), and you need to modify `_P4GlobalVar::g_homePath_` value in **src/P4Simulator/examples/p4-demo.cc and some other files** to your own home path.

**Note** that all path information should be modified before run the p4simulator.

```
src/p4simulator/model/global.h 
src/p4simulator/model/global.cc // change the P4GlobalVar::g_homePath path .etc
```

In the `global.cc` file, many global variables are used. It contains information such as the ns-3 emulator path, the json script path compiled by ns-3 and p4, and the variable name of the expected tracking value.


## fix the bugs for `ns-3`

```
Using the following version of g++

    $ g++ --version
    g++ (GCC) 8.1.0
    Copyright (C) 2018 Free Software Foundation, Inc.
    This is free software; see the source for copying conditions.  There is NO
    warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

I get the following error when building NS3

    ../src/mesh/model/dot11s/ie-dot11s-beacon-timing.cc: In member function ‘virtual bool ns3::dot11s::IeBeaconTiming::operator==(const ns3::WifiInformationElement&) const’:
    ../src/mesh/model/dot11s/ie-dot11s-beacon-timing.cc:209:15: error: catching polymorphic type ‘class std::bad_cast’ by value [-Werror=catch-value=]
       catch (std::bad_cast)
                   ^~~~~~~~
    cc1plus: all warnings being treated as errors

    Waf: Leaving directory `/home/mettinger/SNS3/ns-3-debug/build'
    Build failed
     -> task in 'ns3-mesh' failed (exit status 1):
	    {task 139826318416080: cxx ie-dot11s-beacon-timing.cc -> ie-dot11s-beacon-timing.cc.1.o}
    ['/usr/bin/g++', '-O0', '-ggdb', '-g3', '-Wall', '-Werror', '-std=c++11', '-Wno-error=deprecated-declarations', '-fstrict-aliasing', '-Wstrict-aliasing', '-fPIC', '-pthread', '-I.', '-I..', '-DNS3_BUILD_PROFILE_DEBUG', '-DNS3_ASSERT_ENABLE', '-DNS3_LOG_ENABLE', '-DHAVE_SYS_IOCTL_H=1', '-DHAVE_IF_NETS_H=1', '-DHAVE_NET_ETHERNET_H=1', '-DHAVE_PACKET_H=1', '-DHAVE_IF_TUN_H=1', '-DHAVE_=1', '-DHAVE_GSL=1', '-DHAVE_SQLITE3=1', '../src/mesh/model/dot11s/ie-dot11s-beacon-timing.cc', '-c', '-o', '/home/mettinger/SNS3/ns-3-debug/build/src/mesh/model/dot11s/ie-dot11s-beacon-timing.cc.1.o']


A simple fix is to catch (std::bad_cast&) instead.
```


