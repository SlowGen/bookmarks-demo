import 'dart:js_interop';

import 'package:bookmarks/browser_extension/browser_interops/chrome_types.dart';

@JS()
external Chrome get chrome;

extension type Chrome(JSObject _) implements JSObject {
  external Tabs get tabs;
  // external Runtime get runtime;  -- for example
  // external Storage get storage;  -- for example
}

extension type Tabs(JSObject _) implements JSObject {
  external JSPromise<Tab> create(JSObject createProperties);
}

// first declare access to our external API
// then build out the API using only what is needed. In this case, we only need Tabs, but in most apps accessing things like Runtime, Identity, Storage and Cookies are common.
// Then build out what you need from Tabs. In this case, we only need the create method, but getters and setters would also belong in similar declarations.
  // external JSPromise<Tab> get(int tabId);  -- for example
  // external JSPromise<Tab> getCurrent();  -- for example
