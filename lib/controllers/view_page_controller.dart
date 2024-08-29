import 'package:bookmarks/browser_api/chrome_fakes.dart'
    if (dart.library.js_interop) 'package:bookmarks/browser_api/chrome_api.dart';
import 'package:url_launcher/url_launcher.dart';

class ViewPageController {
  ViewPageController();

  Future<void> openLink(String url, [bool? active]) async {
    throw UnimplementedError();
  }
}

class ViewPageControllerMobile implements ViewPageController {
  ViewPageControllerMobile();

  @override
  Future<void> openLink(String url, [bool? active]) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }
}

class ViewPageControllerWeb implements ViewPageController {
  ViewPageControllerWeb();

  @override
  Future<void> openLink(String url, [bool? active]) async {
    // while we aren't using the Tab return for anything functional here, it is a good demonstration of how to use the async API and get a return value.
    final Tab tab = await TabsMethods.create(url, active ?? true);
    print('Opened tab: $tab');
  }
}

class ViewPageControllerTest implements ViewPageController {
  ViewPageControllerTest();
  String testCase = 'https://example.com';

  void setTestCase(String testUrl) {
    testCase = testUrl;
  }

  @override
  Future<void> openLink(String url, [bool? active, bool? pinned]) async {
    print('Opening link: $testCase');
  }
}
