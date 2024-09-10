import 'dart:js_interop';

extension type Tab(JSObject _) implements JSObject {
  external JSNumber get id;
  external JSString get url;
  external JSBoolean get active;
}

// This is our return type from the above create method. While there are many more properties available, we only need these three.

// extension type StorageObject(JSObject _) implements JSObject {
//   external LastVisited? get lastVisited;
// }

// extension type LastVisited(JSObject _) implements JSObject {
//   @JsonValue('last_visited')
//   external JSString? get lastVisited;
// }
