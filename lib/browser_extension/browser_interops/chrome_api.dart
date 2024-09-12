// This file is a Dart file that is used to define the Chrome API for use in the browser extension. This is a good example of how to use js_interop to define a complex API in Dart. While our base app is only using the Tabs API, the Storage API is built out as an example of other usages.

// For more on working with js_interop see https://dart.dev/interop/js-interop/usage
import 'dart:js_interop';

// the @JS() annotation is required for the top-level external grab and unnecessary for the sub-sections of the API. This is where we are grabbing the Chrome API from the browser and can be considered the entry point for the API.
@JS()
external Chrome get chrome;

// Then define what that entry point contains. Each of the sub-sections of the API are declared here, and then each also defined.
extension type Chrome(JSObject _) implements JSObject {
  external Tabs get tabs;
  external Storage get storage;
}

// Then build out what you need from Tabs. In this case, we only need the create method, but getters and setters would also belong in similar declarations.
extension type Tabs(JSObject _) implements JSObject {
  external JSPromise<JSObject> create(JSObject createProperties);
  // external JSPromise<JSObject> get(int tabId);  -- for example
  // external JSPromise<JSObject> getCurrent();  -- for example
}

// As a further example: here is what the Storage API might look like.
extension type Storage(JSObject _) implements JSObject {
  external Local get local;
  // external Sync get sync;  -- for example
  // external Session get session; -- for example
}

extension type Local(JSObject _) implements JSObject {
  // JSPromise does not allow for an equivalent to Future<void> so we use JSAny here. JSVoid does exist, but it is not implemented for JSPromise as a possible return.
  external JSPromise<JSAny> set(JSObject items);
  external JSPromise<JSObject> get(JSString key);
  external JSPromise<JSAny> remove(JSString key);
  external JSPromise<JSAny> clear();
}
