#!/bin/bash

# This example script is used to build the extension implementation of the storage demo. To view mobile, run/build as you normally would

# transpile typescript to javascript and copy to flutter web folder
tsc typescript/*.ts --outDir web --strict --target ES2021

# updates manifest.json with current pubspec details
node ./scripts/pubspec-manifest.js

# build extension. Note the --csp flag and the --no-web-resources-cdn flag, these are required to ensure that the app uses only local resources as required by extension rules
flutter build web --csp --no-web-resources-cdn --profile --target lib/main_storage_demo.dart
