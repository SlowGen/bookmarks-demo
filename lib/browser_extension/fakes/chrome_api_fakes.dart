external Chrome get chrome;

class Chrome {
  Tabs get tabs => throw UnimplementedError();
}

class Tabs {
  Future<dynamic> create(dynamic createProperties) =>
      throw UnimplementedError();
}






// this is necessary to provide an alternative import for non-web builds.
// each piece of the js_interop must have a matching fake implementation
// or Dart type declaration.
