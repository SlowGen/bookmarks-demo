external Chrome get chrome;

class Chrome {
  Tabs get tabs => throw UnimplementedError();
}

class Tabs {
  Future<dynamic> create(dynamic createProperties) =>
      throw UnimplementedError();
}

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
