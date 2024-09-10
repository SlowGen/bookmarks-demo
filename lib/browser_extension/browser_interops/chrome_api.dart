import 'dart:js_interop';

import 'package:bookmarks/browser_extension/browser_interops/chrome_types.dart';

// For more on working with js_interop see https://dart.dev/interop/js-interop/usage

// the @JS() annotation is required for the top-level external grab and unnecessary for the sub-sections of the API. This is where we are grabbing the Chrome API from the browser and can be considered the entry point for the API.
@JS()
external Chrome get chrome;

// Then define what that entry point contains. Each of the sub-sections of the API are declared here, and then each also defined.
extension type Chrome(JSObject _) implements JSObject {
  external Tabs get tabs;
  // external Runtime get runtime;  -- for example
  external Storage get storage;
}

// Then build out what you need from Tabs. In this case, we only need the create method, but getters and setters would also belong in similar declarations.
extension type Tabs(JSObject _) implements JSObject {
  external JSPromise<Tab> create(JSObject createProperties);
  // external JSPromise<Tab> get(int tabId);  -- for example
  // external JSPromise<Tab> getCurrent();  -- for example
}

// As a further example: here is what the Storage API might look like.

extension type Storage(JSObject _) implements JSObject {
  external Local get local;
  // external Session get session;
}

extension type Local(JSObject _) implements JSObject {
  external JSPromise<JSAny> set(JSObject items);
  external JSPromise<JSObject> get(JSString key);
  external JSPromise<JSAny> remove(JSString key);
  external JSPromise<JSAny> clear();
}

// extension type Session(JSObject _) implements JSObject {
//   external JSPromise<JSAny> set(JSObject items);
//   external JSPromise<JSObject> get(JSArray<JSString> keys);
//   external JSPromise<JSAny> remove(JSArray<JSString> keys);
//   external JSPromise<JSAny> clear();
// }
