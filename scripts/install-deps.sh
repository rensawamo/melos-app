#!/bin/sh

echo "Welcome to the Dart Frog project!"
echo "Install dependencies!!!"
brew update
brew install mise 
brew install mason
fvm dart pub global activate melos
fvm dart pub add dart_frog
fvm install