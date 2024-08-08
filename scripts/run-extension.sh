#!/bin/bash

tsc typescript/*.ts --outDir web --target ES2021 --strict

flutter run -d chrome
