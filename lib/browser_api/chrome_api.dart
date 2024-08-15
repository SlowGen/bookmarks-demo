import 'dart:js_interop';

extension type Chrome(JSObject _) implements JSObject {
  external Tabs get tabs;
}

@JS()
external Chrome get chrome;

extension type Tabs(JSObject _) implements JSObject {
  external JSPromise<Tab> create(JSObject createProperties);
}

extension type Tab(JSObject _) implements JSObject {
  external int get id;
  external String get url;
  external bool get active;
}

abstract class BrowserFunctions {
  static dynamic openLink(String url, [bool active = true]) async {
    final createProperties = {'url': url, 'active': active}.jsify() as JSObject;
    return chrome.tabs.create(createProperties);
  }
}
