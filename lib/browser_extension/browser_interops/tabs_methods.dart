import 'dart:js_interop';
import 'dart:js_interop_unsafe';

import 'package:bookmarks/browser_extension/browser_interops/chrome_api.dart';
import 'package:bookmarks/browser_extension/chrome_types.dart';

abstract class TabsMethods {
  static Future<Tab> create(String url, [bool active = true]) async {
    final createProperties = {'url': url, 'active': active}.jsify() as JSObject;
    final JSObject tab = await chrome.tabs.create(createProperties).toDart;
    final int tabId = (tab.getProperty('id'.toJS) as JSNumber).toDartInt;
    final String tabUrl = (tab.getProperty('url'.toJS) as JSString).toDart;
    final bool tabActive = (tab.getProperty('active'.toJS) as JSBoolean).toDart;
    return Tab(tabId, tabUrl, tabActive);
  }
}
