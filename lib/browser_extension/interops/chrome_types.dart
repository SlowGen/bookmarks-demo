import 'dart:js_interop';

// This is our return type from the above create method. While there are many more properties available, we only need these three.
extension type Tab(JSObject _) implements JSObject {
  external JSNumber get id;
  external JSString get url;
  external JSBoolean get active;
}
