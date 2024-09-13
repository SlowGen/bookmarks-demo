// This main build demos usage of the Storage API

import 'package:bookmarks/controllers/last_visited_controller.dart';
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
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Below we have hard-coded the controller to use the correct implementation based on various conditions / platforms.
    // There are many ways to accomplish this such as using a service locator or dependency injection.
    // For example, you could instead use something like get_it to inject the correct controller

    // note the kIsWeb and kDebugMode check, this is useful for
    // running your application in debug mode and bypassing the
    // Chrome API which does not work in debug mode.
    // While not very useful to test functionality, it can be useful to test the UI/styling.

    // to demonstrate the use of local storage, we have a controller for that as well
    final LastVisitedController lastVisitedController = (kIsWeb && kDebugMode)
        ? LastVisitedControllerWeb()
        : kIsWeb
            ? LastVisitedControllerWeb()
            : LastVisitedControllerMobile();

    return Scaffold(
        appBar: AppBar(
          title: const Text('Bookmarks'),
        ),
        body: Column(
          children: [
            ElevatedButton(
              onPressed: () async {
                final String lastVisited =
                    await lastVisitedController.getLastVisited();
                print('Last Visited: $lastVisited');
              },
              child: const Text('Get Last Visited'),
            ),
            ElevatedButton(
              onPressed: () async {
                await lastVisitedController
                    .setLastVisited('https://flutter.dev');
                print('set last visited as flutter.dev');
              },
              child: const Text('Set Last Visited'),
            ),
            ElevatedButton(
              onPressed: () async {
                await lastVisitedController.removeLastVisited();
              },
              child: const Text('Clear Last Visited'),
            ),
            const Text('Inspect the extension console for output'),
          ],
        ));
  }
}
