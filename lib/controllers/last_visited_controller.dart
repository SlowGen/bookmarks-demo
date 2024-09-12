import 'package:bookmarks/browser_extension/index.dart';

// a note on the use of an unimplemented base class: This is optional. You could just as easily use your Mobile implementation as your base / default class. I choose to do it this way because I find it much easier to ensure that I am using the correct implementations. In some cases, an app may have several different platform types and implementations to deal with (say a regular web and an extension, or Watch vs Phone vs Tablet). This way makes it a little less prone to developer error.

// You could also use UnsupportedError() and should use what works for your situation.

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

// Mobile would be done according to your preferred usual way (such as Shared Preferences)
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

class LastVisitedControllerTest implements LastVisitedController {
  String? testKey;
  dynamic testValue;
  LastVisitedControllerTest();

  void setTestKey(String key) {
    testKey = key;
  }

  void setTestValue(dynamic value) {
    testValue = value;
  }

  @override
  Future<void> setLastVisited(String url) async {
    testKey = 'last_visited';
    testValue = url;
  }

  @override
  Future<String> getLastVisited() async {
    return testValue;
  }

  @override
  Future<void> removeLastVisited() async {
    testKey = null;
    testValue = null;
  }

  @override
  Future<void> clearAll() async {
    testKey = null;
    testValue = null;
  }
}
