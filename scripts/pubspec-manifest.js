// This is not required, however heavily recommended. This script will update the manifest.json file in the web directory with the information from the pubspec.yaml file keeping the information in sync.

// There are many ways to accomplish the same goal, including using Dart or a shell script instead of Javascript. This is just one way to do it.

// This can also function to add a custom key and icons for using Flavors.


import { readFileSync, writeFileSync } from 'fs';
import { load } from 'js-yaml';
import { execSync } from 'child_process';

const webManifest = './web/manifest.json';

const tsManifest = './typescript/manifest.json';
const tsManifestFile = JSON.parse(readFileSync(tsManifest, 'utf8'));

const yamlFile = readFileSync('./pubspec.yaml', 'utf8');
const pubspec = load(yamlFile);

const url = new URL(pubspec.homepage);

const commit = execSync('git rev-parse HEAD')
  .toString('utf-8')
  .slice(0, 8);

const buildCount = execSync('git rev-list --count HEAD')
  .toString('utf-8')
  .trim();

tsManifestFile.name = pubspec.name;
tsManifestFile.description = pubspec.description;
tsManifestFile.version = pubspec.version + `.${buildCount}`;
tsManifestFile.homepage_url = url

writeFileSync(webManifest, JSON.stringify(tsManifestFile, null, 2));
