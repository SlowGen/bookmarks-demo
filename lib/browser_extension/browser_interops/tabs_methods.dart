import 'dart:js_interop';

import 'package:bookmarks/browser_extension/browser_interops/chrome_api.dart';
import 'package:bookmarks/browser_extension/chrome_types.dart';
import 'package:bookmarks/browser_extension/browser_interops/utilities.dart';

abstract class TabsMethods {
  static Future<Tab> create(String url, [bool active = true]) async {
    final JSObject createProperties =
        {'url': url.toJS, 'active': active.toJS}.toJSObject();
    return chrome.tabs.create(createProperties).toTab();
  }
}
