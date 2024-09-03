import 'dart:js_interop';

import 'package:bookmarks/browser_extension/browser_interops/chrome_api.dart';

abstract class TabsMethods {
  static dynamic create(String url, [bool active = true]) async {
    final createProperties = {'url': url, 'active': active}.jsify() as JSObject;
    return chrome.tabs.create(createProperties);
  }
}


// The abstract classes are used as the bridge between our js_interops and our Dart code.
// The dynamic types are required to allow for the conversion between JSPromises and Dart Futures.
// These abstract classes should be organized by their respective API subgroups and include all methods that are being used.


  // in this example, we don't need to convert the argument to a JS type (int => JSNumber) because the JS interop will handle it for us.
  // This works well for primitive types only.

  // static dynamic get(int tabId) async {
  //   return chrome.tabs.get(tabId); -- for example

  // static dynamic getCurrent() async {
  //   return chrome.tabs.getCurrent(); -- for example
