import 'dart:js_interop';
import 'dart:js_interop_unsafe';

import 'package:bookmarks/browser_extension/browser_interops/chrome_api.dart';
import 'package:bookmarks/browser_extension/browser_interops/utilities.dart';

abstract class StorageMethods {
  static Future<void> set(Map<String, dynamic> items) async {
    // Use the toJSObject extension method to convert the Dart Map to a JSObject.
    await chrome.storage.local.set(items.toJSObject()).toDart;
  }

  // The 'get' method is a bit tricky because the browser storage object has no set type, it is just an object. Because of this we need to do a little bit of extra work. We use a dynamic return type because this can vary depending on what is stored in the storage object and we won't always know the exact Dart type we'll need to return.

  // As a fun challenge, try writing your own extension method to do this!

  static dynamic get(String key) async {
    // first convert the key to a JSString.
    final jsKey = key.toJS;

    // Next call the storage API and use .toDart to convert the JS Promise to a Dart Future.
    final JSObject storageObjectJS =
        await chrome.storage.local.get(jsKey).toDart;

    // then use the getProperty method to get the value from the object.
    final JSAny? keyValue = storageObjectJS.getProperty(jsKey);

    // this is ugly, but we need to check the type of the value and convert it to a Dart type. This is because the storage object can store any type of value.
    if (keyValue.runtimeType == JSString) {
      return (keyValue as JSString).toDart;
    } else if (keyValue.runtimeType == JSNumber) {
      return (keyValue as JSNumber).toDartInt;
    } else if (keyValue.runtimeType == JSBoolean) {
      return (keyValue as JSBoolean).toDart;
    } else {
      return null;
    }
  }

  static Future<void> remove(String key) async {
    // don't forget to convert the key to a JSString and then call .toDart to convert the JS Promise to a Dart Future.
    await chrome.storage.local.remove(key.toJS).toDart;
  }

  static Future<void> clear() async {
    await chrome.storage.local.clear().toDart;
  }
}
