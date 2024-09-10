import 'package:bookmarks/controllers/view_page_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bookmarks App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  // in real life, this would come from a database
  final List<String> fakeBookmarksList = [
    'https://flutter.dev',
    'https://dart.dev',
    'https://pub.dev',
  ];

  @override
  Widget build(BuildContext context) {
    // Below we have hard-coded the controller to use the correct implementation based on various conditions / platforms.
    // There are many ways to accomplish this such as using a service locator or dependency injection.
    // For example, you could instead use something like get_it to inject the correct controller

    // note the kIsWeb and kDebugMode check, this is useful for
    // running your application in debug mode and bypassing the
    // Chrome API which does not work in debug mode.
    // While not very useful to test functionality, it can be useful to test the UI/styling.
    final ViewPageController viewPageController = (kIsWeb && kDebugMode)
        ? ViewPageControllerTest()
        : kIsWeb
            ? ViewPageControllerWeb()
            : ViewPageControllerMobile();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Bookmarks'),
      ),
      body: ListView.builder(
        itemCount: fakeBookmarksList.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(fakeBookmarksList[index]),
            onTap: () {
              viewPageController.openLink(fakeBookmarksList[index], false);
            },
          );
        },
      ),
    );
  }
}
