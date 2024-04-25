#!/bin/sh

echo "Welcome to the Dart Frog project!"
echo "Install dependencies!!!"
brew update
brew install mise 
brew install mason
dart pub global activate melos
