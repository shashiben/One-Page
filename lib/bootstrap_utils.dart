import 'package:bootstrap/argumen_model.dart';
import 'package:bootstrap/constants.dart';

class BootstrapUtils {
  ///
  /// Returns what is the current prefix based on width
  ///
  static String getPrefixByWidth(double width) {
    if (width >= 1400) {
      return "xxl";
    } else if (width >= 1200) {
      return "xl";
    } else if (width >= 992) {
      return "lg";
    } else if (width >= 768) {
      return "md";
    } else if (width >= 576) {
      return "sm";
    } else {
      return "xs";
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
    Map<String, bool> result = {};
    for (String element in prefixesList) {
      result[element] = false;
    }
    return result;
  }

  ///
  ///Get Initial offsets
  ///
  static Map<String, int> getInitialOffsets() {
    Map<String, int> result = {};
    for (String element in prefixesList) {
      result[element] = -100;
    }
    return result;
  }

  ///
  ///Get values from string
  ///
  static Map<String, int> getAllColValues(String sizes) {
    Map<String, int> result = {};
    List<String> getPrefixList = sizes
        .toLowerCase()
        .trim()
        .split(' ')
        .where((order) => order.trim().isNotEmpty)
        .toList();
    for (String element in getPrefixList) {
      var splittedList = element.split("-");
      if (splittedList.length == 2) {
        if (splittedList.first == "col" &&
            int.tryParse(splittedList.last) != null) {
          if (int.parse(splittedList.last) <= 12) {
            result["sm"] = int.parse(splittedList.last);
          }
        }
      } else if (splittedList.length == 3) {
        if (splittedList.first == "col" &&
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
    Map<String, int> result = {};
    for (String element in prefixesList) {
      result[element] = 100;
    }
    return result;
  }

  ///
  ///Get Initial Orders
  ///
  static Map<String, int> getInitialOrders() {
    Map<String, int> result = {};
    for (String element in prefixesList) {
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
          .where((order) => order.trim().isNotEmpty)
          .toList();
      if (hiddenMap != null) {
        for (String pfx in result) {
          if (allPrefixList.contains(pfx)) {
            hiddenMap[pfx == 'xs' ? '' : pfx] = true;
          }
        }
      }
      return result;
    }
  }

  ///
  ///Sort the things that are required initially
  ///

  static void initArray(ArgumentModel argumentModel) {
    final int prefixesSize = prefixesList.length;
    List<String> parts =
        BootstrapUtils.organizeSizeOrders(argumentModel.referenceArgument);
    for (String part in parts) {
      for (String pfx in prefixesList) {
        final String prefix =
            '${argumentModel.argumentPrefix}-$pfx${pfx == "" ? "" : "-"}';
        if (part.startsWith(prefix)) {
          String valString = part.split(prefix).last;
          if (valString != prefix) {
            int? value = int.tryParse(valString);
            if (value != null &&
                value < 13 &&
                value > argumentModel.lowerBoundValue) {
              argumentModel.argumentMap[pfx] = argumentModel.minMaxFct(
                  argumentModel.argumentMap[pfx], value);
            }
          }
        }
      }
    }
    for (int index = 0; index < prefixesSize; index++) {
      String pfx = prefixesReversedList[index];
      int? value = argumentModel.argumentMap[pfx];
      if (value == argumentModel.invalidValue) {
        int i;
        for (i = index + 1; i < prefixesSize; i++) {
          String pfx2 = prefixesReversedList[i];
          if (argumentModel.argumentMap[pfx2] != argumentModel.invalidValue) {
            value = argumentModel.argumentMap[pfx2]!;
            break;
          }
        }
        if (value == argumentModel.invalidValue) {
          for (int j = i - 1; j > -1; j--) {
            String pfx3 = prefixesReversedList[j];
            if (argumentModel.argumentMap[pfx3] != argumentModel.invalidValue) {
              value = argumentModel.argumentMap[pfx3]!;
              break;
            }
          }
        }
        argumentModel.argumentMap[pfx] = argumentModel.minMaxFct(
            argumentModel.minMaxNoValueReference, value);
      }
    }
  }
}
