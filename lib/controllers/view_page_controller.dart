import 'package:bookmarks/browser_extension/chrome_types.dart';
// Using the index for our imports to ensure all pieces are properly conditionally imported.
import 'package:bookmarks/browser_extension/index.dart';
import 'package:url_launcher/url_launcher.dart';

// a note on the use of an unimplemented base class: This is optional. You could just as easily use your Mobile implementation as your base / default class. I choose to do it this way because I find it much easier to ensure that I am using the correct implementations. In some cases, an app may have several different platform types and implementations to deal with (say a regular web and an extension, or Watch vs Phone vs Tablet). This way makes it a little less prone to developer error.
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

// here we are using launchUrl, but you could use any method you prefer to open a link on mobile.
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
