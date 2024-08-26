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
      title: 'Bookmarks Demo',
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
    // instead use something like get_it to inject the correct controller
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
