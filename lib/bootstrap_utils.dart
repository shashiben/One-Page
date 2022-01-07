import 'constants.dart';

class BootstrapUtils {
  ///
  /// Returns what is the current prefix based on width
  ///
  static String getPrefixByWidth(double width) {
    if (width >= 1400) {
      return 'xxl';
    } else if (width >= 1200) {
      return 'xl';
    } else if (width >= 992) {
      return 'lg';
    } else if (width >= 768) {
      return 'md';
    } else if (width >= 576) {
      return 'sm';
    } else {
      return 'xs';
    }
  }

  ///
  /// Returns Current GridPrefix
  ///
  static GridPrefixes getPrefixEnumByWidth(double width) {
    if (width >= 1200) {
      return GridPrefixes.xl;
    } else if (width >= 992) {
      return GridPrefixes.lg;
    } else if (width >= 768) {
      return GridPrefixes.md;
    } else if (width >= 576) {
      return GridPrefixes.sm;
    } else {
      return GridPrefixes.xs;
    }
  }

  ///
  /// Returns the width for non-fluid containers based on a given width
  ///
  static double getMaxWidthForNonFluid(double width) {
    if (width >= 1200) {
      return 1140;
    } else if (width >= 992) {
      return 960;
    } else if (width >= 768) {
      return 720;
    } else if (width >= 576) {
      return 540;
    } else {
      return width;
    }
  }

  ///
  ///Get Initial Visibility Map
  ///
  static Map<String, bool> getInitialVisibilityMap() {
    final Map<String, bool> result = {};
    for (final String element in prefixesList) {
      result[element] = false;
    }
    return result;
  }

  ///
  ///Get Initial offsets
  ///
  static Map<String, int> getInitialOffsets() {
    final Map<String, int> result = {};
    for (final String element in prefixesList) {
      result[element] = -100;
    }
    return result;
  }

  ///
  ///Get values from string
  ///
  static Map<String, int> getAllColValues(String sizes) {
    final Map<String, int> result = {};
    final List<String> getPrefixList = sizes
        .toLowerCase()
        .trim()
        .split(' ')
        .where((String order) => order.trim().isNotEmpty)
        .toList();
    for (final String element in getPrefixList) {
      final List<String> splittedList = element.split('-');
      if (splittedList.length == 2) {
        if (splittedList.first == 'col' &&
            int.tryParse(splittedList.last) != null) {
          if (int.parse(splittedList.last) <= 12) {
            result['sm'] = int.parse(splittedList.last);
          }
        }
      } else if (splittedList.length == 3) {
        if (splittedList.first == 'col' &&
            int.tryParse(splittedList.last) != null) {
          if (int.parse(splittedList.last) <= 12) {
            result[splittedList.elementAt(1)] = int.parse(splittedList.last);
          }
        }
      }
    }
    return result;
  }

  ///
  ///Get Initial ratios
  ///
  static Map<String, int> getInitialRatios() {
    final Map<String, int> result = {};
    for (final String element in prefixesList) {
      result[element] = 100;
    }
    return result;
  }

  ///
  ///Get Initial Orders
  ///
  static Map<String, int> getInitialOrders() {
    final Map<String, int> result = {};
    for (final String element in prefixesList) {
      result[element] = 0;
    }
    return result;
  }

  static List<String> organizeSizeOrders(String orders,
      {Map<String, bool>? hiddenMap}) {
    List<String> result = [];
    if (orders.trim().isEmpty) {
      return result;
    } else {
      result = orders
          .toLowerCase()
          .trim()
          .split(' ')
          .where((String order) => order.trim().isNotEmpty)
          .toList();
      if (hiddenMap != null) {
        for (final String pfx in result) {
          if (allPrefixList.contains(pfx)) {
            hiddenMap[pfx == 'xs' ? '' : pfx] = true;
          }
        }
      }
      return result;
    }
  }

}
