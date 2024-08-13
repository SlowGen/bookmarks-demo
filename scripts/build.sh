#!/bin/bash

tsc typescript/*.ts --outDir web --strict

flutter build web --web-renderer html --csp --pwa-strategy none
