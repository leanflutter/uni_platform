import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uni_platform/uni_platform.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformType = 'Unknown';

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    String platformType;
    try {
      platformType = UniPlatform.select<String>(
        android: 'Android',
        fuchsia: 'Fuchsia',
        ios: 'iOS',
        linux: 'Linux',
        macos: 'macOS',
        windows: 'Windows',
        web: 'Web',
        otherwise: 'Unknown',
      );
    } on PlatformException {
      platformType = 'Failed to get platform type.';
    }

    if (!mounted) return;

    setState(() {
      _platformType = platformType;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Text('Running on: $_platformType\n'),
        ),
      ),
    );
  }
}
