import 'dart:js_interop';
import 'dart:js_interop_unsafe';

import 'package:bookmarks/browser_extension/browser_interops/chrome_api.dart';
import 'package:bookmarks/browser_extension/chrome_types.dart';

abstract class TabsMethods {
  static Future<Tab> create(String url, [bool active = true]) async {
    final createProperties = {'url': url, 'active': active}.jsify() as JSObject;
    final tab = await chrome.tabs.create(createProperties).toDart;
    final tabId = (tab.getProperty('id'.toJS) as JSNumber).toDartInt;
    final tabUrl = (tab.getProperty('url'.toJS) as JSString).toDart;
    final tabActive = (tab.getProperty('active'.toJS) as JSBoolean).toDart;
    return Tab(tabId, tabUrl, tabActive);
  }
}
