import 'dart:js_interop';
import 'dart:js_interop_unsafe';

import 'package:bookmarks/browser_extension/chrome_types.dart';

// jsify always returns only as JSAny? here we are consolidating the steps in an extension method and additonally type casting to JSObject
extension JSObjectHelpers on Map {
  JSObject toJSObject() {
    return jsify() as JSObject;
  }
}

// This converts JSAny to a defined Dart type, in this case Tab. This
// can be done for all your return types that are defined in the CHrome API.
extension ChromeReturnTypes on JSPromise<JSAny> {
  Future<Tab> toTab() async {
    final JSObject resultObject = await toDart as JSObject;
    final int tabId =
        (resultObject.getProperty('id'.toJS) as JSNumber).toDartInt;
    final String tabUrl =
        (resultObject.getProperty('url'.toJS) as JSString).toDart;
    final bool tabActive =
        (resultObject.getProperty('active'.toJS) as JSBoolean).toDart;
    return Tab(tabId, tabUrl, tabActive);
  }
}
