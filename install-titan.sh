# Argument is the version to install, or default value
VERSION=${1:-'0.4.4'}

BACKEND=cassandra #"cassandra" includes rextser, cassandra, and all other backend/indexing support
TITAN=titan-${BACKEND}-${VERSION}
# Install [Titan](http://thinkaurelius.github.io/titan/)

if [ ! -d /usr/local/${TITAN} ]; then
echo "Installing Titan ${VERSION}..."
  cd /usr/local
  FILE=${TITAN}.zip
  curl --silent -LO http://s3.thinkaurelius.com/downloads/titan/${FILE}
  unzip -qo ${FILE}
  rm -f ${FILE}
  echo "Titan has been installed."
  cd /usr/local/
  cp -r /local/git/Titan-Rexster/lib ${TITAN}/
  cp -r /local/git/Titan-Rexster/conf ${TITAN}/
  cp /local/git/Titan-Rexster/start-titan.groovy ${TITAN}/
fi
