import 'dart:io';

import 'package:flutter/foundation.dart';

class UniPlatform {
  static bool get isAndroid => !kIsWeb && Platform.isAndroid;
  static bool get isFuchsia => !kIsWeb && Platform.isFuchsia;
  static bool get isIOS => !kIsWeb && Platform.isIOS;
  static bool get isLinux => !kIsWeb && Platform.isLinux;
  static bool get isMacOS => !kIsWeb && Platform.isMacOS;
  static bool get isWeb => kIsWeb;
  static bool get isWindows => !kIsWeb && Platform.isWindows;

  static T select<T>({
    // Specified based on platform type
    T? android,
    T? fuchsia,
    T? iOS,
    T? linux,
    T? macOS,
    T? windows,
    T? web,
    // Specified based on device type
    T? desktop,
    T? mobile,
    // Unspecified platform
    T? otherwise,
  }) {
    final isDesktop = isLinux || isMacOS || isWindows;
    final isMobile = isAndroid || isIOS;
    if (isAndroid && android != null) {
      return android;
    } else if (isFuchsia && fuchsia != null) {
      return fuchsia;
    } else if (isIOS && iOS != null) {
      return iOS;
    } else if (isLinux && linux != null) {
      return linux;
    } else if (isMacOS && macOS != null) {
      return macOS;
    } else if (isWindows && windows != null) {
      return windows;
    } else if (isWeb && web != null) {
      return web;
    } else if (isDesktop && desktop != null) {
      return desktop;
    } else if (isMobile && mobile != null) {
      return mobile;
    } else if (otherwise != null) {
      return otherwise;
    }
    throw Exception('No platform selected');
  }
}
