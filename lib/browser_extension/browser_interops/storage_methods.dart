import 'dart:js_interop';
import 'dart:js_interop_unsafe';

import 'package:bookmarks/browser_extension/browser_interops/chrome_api.dart';

abstract class StorageMethods {
  static dynamic set(Map<String, dynamic> items) async {
    final itemsJS = items.jsify() as JSObject;
    return chrome.storage.local.set(itemsJS);
  }

  static dynamic get(String key) async {
    final JSObject storageObjectJS =
        await chrome.storage.local.get(key.toJS).toDart;
    return storageObjectJS.getProperty(key.toJS);
  }

  static dynamic remove(String key) async {
    return chrome.storage.local.remove(key.toJS);
  }

  static dynamic clear() async {
    return chrome.storage.local.clear();
  }
}
