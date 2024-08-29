# bookmarks

This is a DEMO project for building a browser extension alongside a Flutter mobile app. This code will simulate a bookmarking app that allows a user to access a (fake) database of bookmarks that they can access, add, edit and delete using either the mobile app or the browser extension.

This example code was built as part of a presentation for FlutterConUSA2024.

You can view the slide deck here: [Browser Extensions with Flutter]('') ADD PDF LINK

Video of the presentation will be available soon.

## Getting Started

You must have Flutter, node and npm installed on your machine to run this project.

1. Clone the repo
2. Run `npm install` in the root directory
3. Run `flutter pub get`

To build the extension, run `scripts/build.sh` to compile the typescript code, run the versioning script and build into the `build/web` directory. You can then load unpacked the extension from there.

You can build and run the mobile app as you would normally.

 For more on Flutter/Dart JS interop: [Flutter JS Interop](https://dart.dev/interop/js-interop/usage)

 For more on extensions: [Chrome Extensions](https://developer.chrome.com/docs/extensions/mv3/getstarted/)

 How to convert to Safari: [Safari Extensions](https://developer.apple.com/documentation/safariservices/converting-a-web-extension-for-safari)
