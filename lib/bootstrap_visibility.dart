import 'package:flutter/material.dart';

import 'bootstrap_utils.dart';
import 'constants.dart';

///
/// Helper Widget which defines whether its child is visible
/// depending on the parent container width and the rules
/// defined in [sizes]
///
class BootstrapVisibility extends StatelessWidget {
  BootstrapVisibility({
    Key? key,
    required this.child,
    String sizes = "",
  })  : sizes = sizes.trim(),
        super(key: key) {
    _initialize();
  }

  ///
  /// The child to display (or not)
  ///
  final Widget child;

  ///
  /// Sizes
  ///
  /// corresponds to .col*
  /// If the 'col-*' that corresponds to the screen dimensions is present,
  /// the child is displayed.  Otherwise, the child is not displayed.
  ///
  final String sizes;
  final Map<String, bool> _visibilityPerSize =
      BootstrapUtils.getInitialVisibilityMap();

  void _initialize() {
    List<String> parts = sizes.isEmpty
        ? []
        : sizes
            .toLowerCase()
            .split(' ')
            .where((t) => t.trim().isNotEmpty)
            .toList();
    for (String part in parts) {
      for (String pfx in prefixesList) {
        final String prefix = 'col-$pfx';
        if (part.startsWith(prefix) && pfx != '') {
          _visibilityPerSize[pfx] = true;
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    String prefix =
        BootstrapUtils.getPrefixByWidth(MediaQuery.of(context).size.width);
    if (prefix == '') {
      prefix = 'xs';
    }
    return (_visibilityPerSize[prefix] ?? false) ? child : const SizedBox();
  }
}
