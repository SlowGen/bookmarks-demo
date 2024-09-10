import 'package:bookmarks/browser_extension/index.dart';

class LastVisitedController {
  LastVisitedController();

  Future<void> setLastVisited(String url) async {
    throw UnimplementedError();
  }

  Future<String> getLastVisited() async {
    throw UnimplementedError();
  }

  Future<void> removeLastVisited() async {
    throw UnimplementedError();
  }

  Future<void> clearAll() async {
    throw UnimplementedError();
  }
}

class LastVisitedControllerWeb implements LastVisitedController {
  LastVisitedControllerWeb();

  @override
  Future<void> setLastVisited(String url) async {
    await StorageMethods.set({'last_visted': url});
  }

  @override
  Future<String> getLastVisited() async {
    final items = await StorageMethods.get('last_visted');
    return items ?? 'none found';
  }

  @override
  Future<void> removeLastVisited() async {
    await StorageMethods.remove('last_visted');
  }

  @override
  Future<void> clearAll() async {
    await StorageMethods.clear();
  }
}

class LastVisitedControllerMobile implements LastVisitedController {
  LastVisitedControllerMobile();

  @override
  Future<void> setLastVisited(String url) async {
    throw UnimplementedError();
  }

  @override
  Future<String> getLastVisited() async {
    throw UnimplementedError();
  }

  @override
  Future<void> removeLastVisited() async {
    throw UnimplementedError();
  }

  @override
  Future<void> clearAll() async {
    throw UnimplementedError();
  }
}
