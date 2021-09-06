import 'package:flutter/material.dart';

extension CustomTheme on ColorScheme {
  Color get blockBackgroundColor =>
      brightness == Brightness.light ? Color(0xFFFFFFFF) : Color(0xFF252525);

  Color get separatorColor =>
      brightness == Brightness.light ? Color(0x1F000000) : Color(0x1FFFFFFF);

  Color get selectionDateColor =>
      brightness == Brightness.light ? Color(0x0D000000) : Color(0x33FFFFFF);

  Color get primaryFontColor =>
      brightness == Brightness.light ? Color(0xFF000000) : Color(0xFFDEDEDE);

  Color get secondaryFontColor =>
      brightness == Brightness.light ? Color(0xFF000000) : Color(0xFFACACAC);

  Color get lessonFontColor =>
      brightness == Brightness.light ? Color(0xFF595959) : Color(0xFFA0A0A0);
}
