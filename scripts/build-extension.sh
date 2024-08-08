#!/bin/bash

tsc typescript/*.ts --outDir web --target ES2021 --strict

flutter build web --web-renderer html --csp --pwa-strategy none
