
## Overview
This is the p4simulator module in ns3 install scripts to help you download, install, run p4simulator quickly. By now we have tested it successfully on Ubuntu 20.04.

## p4simulator Installation
We recommend to install P4Simulator step by step, because there may be some errors in the installation process. We also provide a one-click installation script(`install_deps.sh`) to install P4Simulator. 

### download p4simulator install scripts
   `$ git clone https://github.com/Mingyumaz/NS3-p4simulator-install.git`   

   `$ cd NS3-p4simulator-install`

**You can choose one of the following ways to install P4Simulator.** 

The install process could be time-consuming, and we are thinking about a better way, so stay tuned!. 
### The first way: install P4Simulator step by step(recommend)

**1 install ns3**

`#bash install_ns3_pre.sh`

`#bash install_ns3.sh`

Here is a [bug](https://www.nsnam.org/bugzilla/show_bug.cgi?id=2917) in ns3, so you need to fix it by yourself before build.

PS: in line `../src/mesh/model/dot11s/ie-dot11s-beacon-timing.cc:209` from `catch (std::bad_cast)` to `catch (std::bad_cast&)` instead.

**2 install bmv2**

`#bash install_bmv2.sh`

**3 install p4c-bm**

`#bash install_p4c-bm.sh`

**4 install P4Simulator**

`#bash install_p4simulator.sh`

### The Second Way: install P4Simulator one step

`#bash install_deps.sh`

## Run p4simulator in ns3 with example

If everything goes well, you will find you are in this folder(ns-3.27), 
and you need to modify `_P4GlobalVar::g_homePath_` value in **src/P4Simulator/examples/p4-demo.cc and some other files** to your own home path.
**Note** that all path information should be modified before run the examples.

(My home path is **/home/kp**), and then run the example.

`#bash p4simulator_example_run.sh`

