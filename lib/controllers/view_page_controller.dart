// Using the index for our imports to ensure all pieces are properly conditionally imported.
import 'package:bookmarks/browser_extension/chrome_types.dart';
import 'package:bookmarks/browser_extension/index.dart';
import 'package:url_launcher/url_launcher.dart';

// First the unimplmented base class of which all our implementations will inherit from.
class ViewPageController {
  ViewPageController();

  Future<void> openLink(String url, [bool? active]) async {
    // Throwing unimplemented errors aren't strictly necessary, but it can be useful to ensure that you don't forget to utilize the correctly implemented classes and methods.
    throw UnimplementedError();
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
