import 'dart:js_interop';

import 'package:bookmarks/browser_api/chrome_types.dart';

@JS()
@anonymous
external Chrome get chrome;

@JS()
@anonymous
class Chrome {
  external Tabs get tabs;
}

@JS()
@anonymous
class Tabs {
  external Future<dynamic> create(TabCreateRequest createProperties);
}
