#!/bin/sh
set -e
TAS_HOME="TasDemo"
WPMC_HOME="Workload_Monitor_Connector"
WPMC_ARTIFACT="WPMConnector.jar"
WPM_HOME="wpm"
TASC_HOME="ControllerTas"
RG_HOME=
LATTICE_HOME="LatticeCloudTM"

echo "Downloading the TAS demo package"

echo "Compiling the Radargun Framework"

echo "Downloading LatticeCloudTM"
git clone git://github.com/cloudtm/LatticeCloudTM.git ${LATTICE_HOME} 

echo "Downloading WPM"
git clone https://github.com/cloudtm/wpm ${WPM_HOME} 
echo "Compiling WPM"
cd ${WPM_HOME}
ant
cd ..
echo "Downloading TasController package"
git clone https://github.com/didona/test.git ${TASC_HOME}
echo "Downloading the WPMConnector package"
git clone https://github.com/cloudtm/Workload_Monitor_Connector ${WPMC_HOME}
echo "Compiling the WPMConnector package"
cd ${WPMC_HOME}
ant
cd ..
echo "Moving WPMConnector jar to Tas Controller's lib folder"
cp ${WPMC_HOME}/${WPMC_ARTIFACT} ${TASC_HOME}/lib/
echo "Compiling the Tas Controller"
cd ${TASC_HOME}
ant makejar
cd ..

