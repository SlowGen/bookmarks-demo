// Fakes are used as a convenience for conditional importing providing us with a mobile friendly import for those platforms. While mobile implementations are using their own libraries, Dart does not always tree-shake the unused implementations.

// For more on conditional imports see https://dart.dev/guides/libraries/create-packages#conditionally-importing-and-exporting-library-files

// The documentation above is referring to creating & publishing packages, but the same principles apply to conditional imports in general as well as the usage of fakes (aka stubs)

external Chrome get chrome;

class Chrome {
  Tabs get tabs => throw UnimplementedError();
  Storage get storage => throw UnimplementedError();
}

class Tabs {
  Future<void> create(dynamic createProperties) => throw UnimplementedError();
}

class Storage {
  Local get local => throw UnimplementedError();
}

class Local {
  Future<void> set(dynamic items) => throw UnimplementedError();
  Future<void> get(dynamic key) => throw UnimplementedError();
  Future<void> remove(dynamic key) => throw UnimplementedError();
  Future<void> clear() => throw UnimplementedError();
}
