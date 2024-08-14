class TabCreateRequest {
  final String url;
  final bool? active;
  TabCreateRequest(this.url, [this.active = true]);
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
