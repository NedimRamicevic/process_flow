import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  double dynamicHeight(double value) => MediaQuery.of(this).size.height * value;
  double dynamicWidth(double value) => MediaQuery.of(this).size.width * value;

  double get lowWidthValue => dynamicWidth(0.1);
  double get lowHeighthValue => dynamicHeight(0.01);
  double get mediumHeightValue => dynamicHeight(0.05);
  double get highHeightValue => dynamicHeight(0.23);
}

extension Texts on BuildContext {
  TextStyle get title => const TextStyle(
        fontSize: 18,
        color: Colors.black,
      );
  TextStyle get desc => const TextStyle(
        fontSize: 16,
        color: Colors.black,
      );
}

extension EmptyWidetBox on BuildContext {
  Widget get emptyWidgetHeight => SizedBox(
        height: lowHeighthValue,
      );
  Widget get emptyWidgetWidth => SizedBox(height: lowWidthValue);
}
