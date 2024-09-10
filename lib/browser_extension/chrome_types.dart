// Tab a return type from many of the chrome.tabs methods
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
