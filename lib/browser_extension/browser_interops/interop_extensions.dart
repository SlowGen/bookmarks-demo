import 'dart:js_interop';
import 'dart:js_interop_unsafe';

import 'package:bookmarks/browser_extension/chrome_types.dart';

extension JSObjectHelpers on Map {
  JSObject toJSObject() {
    return jsify() as JSObject;
  }
}

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
