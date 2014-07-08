
# Argument is the version to install, or default value
VERSION=${1:-'0.4.4'}

BACKEND=cassandra #"cassandra" includes rextser, cassandra, and all other backend/indexing support
TITAN=titan-${BACKEND}-${VERSION}
REXSTERHOME=/rexster


echo "Installing Rexster..."
wget -q http://tinkerpop.com/downloads/rexster/rexster-server-2.4.0.zip && unzip rexster-server-2.4.0.zip -d /tmp/rexster
mv /tmp/rexster/rexster-server-2.4.0/ /rexster
cd /rexster
mkdir -p ${REXSTERHOME}/ext/titan
cd ${REXSTERHOME}
#bump rexster heap size
cp bin/rexster.sh bin/rexster.sh.orig
sudo bash -c 'cat bin/rexster.sh.orig | sed -e "/-server/s/-Xms128m -Xmx512m/-Xms128m -Xmx2048m -XX:MaxPermSize=256m/" > bin/rexster.sh'
sudo chmod a+x bin/rexster.sh
mv /local/git/Titan-Rexster/start.sh /rexster
cp -r /local/git/Titan-Rexster/lib ${REXSTERHOME}/ext/titan
