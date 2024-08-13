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
