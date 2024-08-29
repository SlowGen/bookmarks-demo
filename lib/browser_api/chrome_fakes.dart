// this is necessary to provide an alternative import for non-web builds.
// each piece of the js_interop must have a matching fake implementation
// or Dart type declaration.

external Chrome get chrome;

class Chrome {
  Tabs get tabs => throw UnimplementedError();
}

class Tabs {
  Future<dynamic> create(dynamic createProperties) =>
      throw UnimplementedError();
}

// These sort of type declarations could be consolidated into a single file for better organization and streamlined imports.
class Tab {
  final int id;
  final String url;
  final bool active;
  Tab(this.id, this.url, this.active);

  @override
  String toString() {
    return 'Tab{id: $id, url: $url, active: $active}';
  }
}

class TabsMethods {
  static Future<Tab> create(String url, [bool active = true]) async {
    throw UnimplementedError();
  }
}
