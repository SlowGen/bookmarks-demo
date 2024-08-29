import 'dart:js_interop';

// first declare access to our external API
@JS()
external Chrome get chrome;

// then build out the API using only what is needed. In this case, we only need Tabs, but in most apps accessing things like Runtime, Identity, Storage and Cookies are common.
extension type Chrome(JSObject _) implements JSObject {
  external Tabs get tabs;
  // external Runtime get runtime;  -- for example
  // external Storage get storage;  -- for example
}

// Then build out what you need from Tabs. In this case, we only need the create method, but getters and setters would also belong in similar declarations.
extension type Tabs(JSObject _) implements JSObject {
  external JSPromise<Tab> create(JSObject createProperties);
  // external JSPromise<Tab> get(int tabId);  -- for example
  // external JSPromise<Tab> getCurrent();  -- for example
}

// This is our return type from the above create method. While there are many more properties available, we only need these three.
extension type Tab(JSObject _) implements JSObject {
  external JSNumber get id;
  external JSString get url;
  external JSBoolean get active;
}

// The abstract classes are used as the bridge between our js_interops and our Dart code.
// The dynamic types are required to allow for the conversion between JSPromises and Dart Futures.
// These abstract classes should be organized by their respective API subgroups and include all methods that are being used.
abstract class TabsMethods {
  static dynamic create(String url, [bool active = true]) async {
    final createProperties = {'url': url, 'active': active}.jsify() as JSObject;
    return chrome.tabs.create(createProperties);
  }

  // in this example, we don't need to convert the argument to a JS type (int => JSNumber) because the JS interop will handle it for us.
  // This works well for primitive types only.

  // static dynamic get(int tabId) async {
  //   return chrome.tabs.get(tabId); -- for example

  // static dynamic getCurrent() async {
  //   return chrome.tabs.getCurrent(); -- for example
}
