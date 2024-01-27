# uni_platform

[![pub version][pub-image]][pub-url] [![][discord-image]][discord-url]

[pub-image]: https://img.shields.io/pub/v/uni_platform.svg
[pub-url]: https://pub.dev/packages/uni_platform
[discord-image]: https://img.shields.io/discord/884679008049037342.svg
[discord-url]: https://discord.gg/zPa6EZ2jqb

Substitutes the Platform class, ensuring works across all platforms.

---

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->

- [Quick Start](#quick-start)
  - [Installation](#installation)
  - [Usage](#usage)
- [License](#license)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

## Quick Start

### Installation

Add this to your package's pubspec.yaml file:

```yaml
dependencies:
  uni_platform: ^0.1.1
```

### Usage

select method:

```dart
import 'package:uni_platform/uni_platform.dart';

String platformType = UniPlatform.select<String>(
  android: 'Android',
  fuchsia: 'Fuchsia',
  iOS: 'iOS',
  linux: 'Linux',
  macOS: 'macOS',
  windows: 'Windows',
  web: 'Web',
  otherwise: 'Unknown',
);
```

call method:

```dart
String platformType = UniPlatform.call<String>(
  android: () => 'Android',
  fuchsia: () => 'Fuchsia',
  iOS: () => 'iOS',
  linux: () => 'Linux',
  macOS: () => 'macOS',
  windows: () => 'Windows',
  web: () => 'Web',
  otherwise: () => 'Unknown',
);
```

> Please see the example app of this plugin for a full example.

## License

[MIT](./LICENSE)
