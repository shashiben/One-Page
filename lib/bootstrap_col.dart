import 'package:flutter/material.dart';

import 'bootstrap_utils.dart';
import 'constants.dart';
import 'extensions/extensions.dart';

class BootstrapCol extends StatelessWidget {
  final List<int?> _config = <int?>[]..length = 5;
  final Widget child;
  final String sizes;

  BootstrapCol({
    Key? key,
    required this.sizes,
    required this.child,
  }) : super(key: key) {
    final Map<String, int> siz = BootstrapUtils.getAllColValues(sizes);
    _config[GridPrefixes.xs.index] = siz['xs'] ?? 12;
    _config[GridPrefixes.sm.index] =
        siz['sm'] ?? _config[GridPrefixes.xs.index];
    _config[GridPrefixes.md.index] =
        siz['md'] ?? _config[GridPrefixes.sm.index];
    _config[GridPrefixes.lg.index] =
        siz['lg'] ?? _config[GridPrefixes.md.index];
    _config[GridPrefixes.xl.index] =
        siz['xl'] ?? _config[GridPrefixes.lg.index];
  }

  int? currentConfig(BuildContext context) {
    return _config[BootstrapUtils.getPrefixEnumByWidth(context.width).index];
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: currentConfig(context) ?? 1,
      child: child,
    );
  }
}
