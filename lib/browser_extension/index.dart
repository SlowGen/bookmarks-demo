// Instead of managing conditional imports in each file, we can manage them in one place.
// This ensures that you are always using the correct implementation for the current platform.
// To use, import this file instead of the individual files.

export 'package:bookmarks/browser_extension/fakes/chrome_api_fakes.dart'
    if (dart.library.js_interop) 'package:bookmarks/browser_extension/browser_interops/chrome_api.dart';
export 'package:bookmarks/browser_extension/fakes/tabs_methods_fakes.dart'
    if (dart.library.js_interop) 'package:bookmarks/browser_extension/browser_interops/tabs_methods.dart';
export 'package:bookmarks/browser_extension/fakes/storage_methods_fakes.dart'
    if (dart.library.js_interop) 'package:bookmarks/browser_extension/browser_interops/storage_methods.dart';
