import 'package:bookmarks/browser_api/chrome_fakes.dart'
    if (dart.library.js_interop) 'package:bookmarks/browser_api/chrome_api.dart';
import 'package:url_launcher/url_launcher.dart';

class ViewPageController {
  ViewPageController();

  Future<void> openLink(String url, [bool? active]) async {
    throw UnimplementedError();
  }
}

class ViewPageControllerMobile extends ViewPageController {
  ViewPageControllerMobile();

  @override
  Future<void> openLink(String url, [bool? active]) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }
}

class ViewPageControllerWeb extends ViewPageController {
  ViewPageControllerWeb();

  @override
  Future<void> openLink(String url, [bool? active]) async {
    await BrowserFunctions.openLink(url, active ?? true);
  }
}

class ViewPageControllerTest extends ViewPageController {
  ViewPageControllerTest();

  @override
  Future<void> openLink(String url, [bool? active, bool? pinned]) async {
    print('Opening link: $url');
    return;
  }
}
