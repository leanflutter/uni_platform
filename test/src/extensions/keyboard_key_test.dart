import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:uni_platform/src/extensions/keyboard_key.dart';
import 'package:uni_platform/uni_platform.dart';

void main() {
  test('Verify keymap', () async {
    Map<LogicalKeyboardKey, PhysicalKeyboardKey> keymap = {};

    final knownLogicalKeys = LogicalKeyboardKey.knownLogicalKeys;
    final knownPhysicalKeys = PhysicalKeyboardKey.knownPhysicalKeys;
    for (final logicalKey in knownLogicalKeys) {
      final physicalKey = knownPhysicalKeys.firstWhere(
        (key) => key.debugName == logicalKey.debugName,
        orElse: () => const PhysicalKeyboardKey(-1),
      );
      if (physicalKey.usbHidUsage == -1) {
        continue;
      }
      keymap[logicalKey] = physicalKey;
    }

    List<String> keymapLines = [];
    for (final logicalKey in keymap.keys) {
      final physicalKey = keymap[logicalKey]!;
      if (kDebugMode) {
        String logicalKeyId =
            logicalKey.keyId.toRadixString(16).padLeft(11, '0');
        String physicalKeyId =
            physicalKey.usbHidUsage.toRadixString(16).padLeft(8, '0');
        keymapLines.add(
          '0x$logicalKeyId: 0x$physicalKeyId, // ${logicalKey.debugName}',
        );
      }
    }

    if (kDebugMode) {
      print('''
Map<int, int> _keymap = {
  ${keymapLines.join('\n  ')}
};
''');
    }

    expect(keymap.keys.length, 231);
    expect(
      knownLogicalKeys.map((e) => e.debugName).where((e) => e != null).length,
      444,
    );
    expect(
      knownPhysicalKeys.map((e) => e.debugName).where((e) => e != null).length,
      269,
    );
    expect(LogicalKeyboardKey.keyA.physicalKey, PhysicalKeyboardKey.keyA);
    expect(LogicalKeyboardKey.keyB.physicalKey, PhysicalKeyboardKey.keyB);
    expect(LogicalKeyboardKey.keyC.physicalKey, PhysicalKeyboardKey.keyC);
    expect(PhysicalKeyboardKey.keyA.logicalKey, LogicalKeyboardKey.keyA);
    expect(PhysicalKeyboardKey.keyB.logicalKey, LogicalKeyboardKey.keyB);
    expect(PhysicalKeyboardKey.keyC.logicalKey, LogicalKeyboardKey.keyC);
    UniPlatform.operatingSystem = 'macos';
    expect(PhysicalKeyboardKey.keyA.keyCode, 0x00);
    expect(PhysicalKeyboardKey.keyB.keyCode, 0x0b);
    expect(PhysicalKeyboardKey.keyC.keyCode, 0x08);
    UniPlatform.operatingSystem = 'windows';
    expect(PhysicalKeyboardKey.keyA.keyCode, 0x41);
    expect(PhysicalKeyboardKey.keyB.keyCode, 0x42);
    expect(PhysicalKeyboardKey.keyC.keyCode, 0x43);
  });
}
