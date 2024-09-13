// Tab is a return type from many of the chrome.tabs methods. While the Chrome API type returns many more properties and methods than what is shown here, you should only define what is needed and used.
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
