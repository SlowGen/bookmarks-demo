import 'package:bookmarks/browser_api/chrome_types.dart';
import 'package:flutter/foundation.dart';
import 'package:bookmarks/browser_api/chrome_fakes.dart'
    if (dart.library.js_interop) 'package:bookmarks/browser_api/chrome_api.dart';
import 'package:url_launcher/url_launcher.dart';

class ViewPageController {
  ViewPageController();
  final platformController = kIsWeb
      ? ViewPageControllerWeb()
      : kDebugMode
          ? ViewPageControllerTest()
          : ViewPageControllerMobile();

  Future<void> openLink(String url, [bool? active]) async {
    return platformController.openLink(url);
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
    final TabCreateRequest createProperties = TabCreateRequest(url, active);
    await chrome.tabs.create(createProperties);
  }
}

class ViewPageControllerTest extends ViewPageController {
  ViewPageControllerTest();

  @override
  Future<void> openLink(String url, [bool? active]) async {
    return;
  }
}
