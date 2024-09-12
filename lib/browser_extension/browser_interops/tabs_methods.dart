import 'dart:js_interop';
import 'dart:js_interop_unsafe';

import 'package:bookmarks/browser_extension/browser_interops/chrome_api.dart';
import 'package:bookmarks/browser_extension/chrome_types.dart';

abstract class TabsMethods {
  static Future<Tab> create(String url, [bool active = true]) async {
    // first convert the arguments to JS, be sure to cast the specific type after using jsify as it will often default to JSAny
    final createProperties = {'url': url, 'active': active}.jsify() as JSObject;
    // here you must use .toDart to convert the JSPromise into a Dart Future
    // note the return type is still a JSObject, that will not be converted by toDart here
    final JSObject tab = await chrome.tabs.create(createProperties).toDart;

    // Unless you do not know exactly what you are working with, it is MUCH more reliable to use the JSObject methods to access properties and then create your own Dart Map. If you need to create specific methods for specific tasks, do that over creating a generic method that will be expensive to run and less reliable. Also note the arugments for the JS properties access are converted to JS and then typecast, and then finally converted to Dart.
    final int tabId = (tab.getProperty('id'.toJS) as JSNumber).toDartInt;
    final String tabUrl = (tab.getProperty('url'.toJS) as JSString).toDart;
    final bool tabActive = (tab.getProperty('active'.toJS) as JSBoolean).toDart;
    return Tab(tabId, tabUrl, tabActive);
  }
}
