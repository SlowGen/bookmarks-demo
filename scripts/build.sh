#!/bin/bash

# transplie typescript to javascript and copy to flutter web folder
tsc typescript/*.ts --outDir web --strict --target ES2021

# updates manifest.json with current pubspec details
node ./scripts/pubspec-manifest.js

# build flutter web
flutter build web --web-renderer html --csp --pwa-strategy none
