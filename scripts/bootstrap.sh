#! /bin/bash


FILE_PATH=$(dirname "$0")
cd "$FILE_PATH/../" || exit

echo "Bootstrap start"
echo "Working directory: $(pwd)"


sh scripts/install-deps.sh


echo "melos bs: Start"
if type melos >/dev/null 2>&1; then
  if melos bs; then
    echo "melos bootstrap: Success"
  else
    echo "melos bootstrap: Failed"
  fi
else
  echo "melos bootstrap: it could not be found. Please install melos."
fi


echo "mason get: Start"
if type mason >/dev/null 2>&1; then
  if mason get; then
    echo "mason get: Success"
  else
    echo "mason get: Failed"
  fi
else
  echo "mason get: it could not be found. Please install mason."
fi


echo ""
echo "Starting Dart Frog server on Docker"
# cd backend && dart_frog dev
# if use docker 
docker build . -t dart-frog-app
docker run -i -t -p 8080:8080 dart-frog-app

echo ""
echo "Bootstrap finished"
