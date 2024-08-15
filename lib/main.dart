import 'package:bookmarks/controllers/view_page_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  print('Starting bookmarks demo');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    print('Building app');
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
    final ViewPageController viewPageController = kIsWeb
        ? ViewPageControllerWeb()
        : kDebugMode
            ? ViewPageControllerTest()
            : ViewPageControllerMobile();
    print('Building home page');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bookmarks'),
      ),
      body: Center(
        child: Column(
          children: [
            const Text('Bookmarks'),
            Expanded(
              child: ListView.builder(
                itemCount: fakeBookmarksList.length,
                itemBuilder: (BuildContext context, int index) {
                  print('Building list item $index');
                  print('Opening link: ${fakeBookmarksList[index]}');
                  return ListTile(
                    title: Text(fakeBookmarksList[index]),
                    onTap: () {
                      print('Opening link: ${fakeBookmarksList[index]}');
                      viewPageController.openLink(
                          fakeBookmarksList[index], false);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
