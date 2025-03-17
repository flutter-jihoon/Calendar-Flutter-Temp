import 'package:flutter/material.dart';

enum CalendarTheme {
  basic(
    eventColors: [
      Color(0xFF97D84F),
      Color(0xFF50D2C2),
      Color(0xFF5DA7FF),
      Color(0xFF8C88FF),
      Color(0xFFD667CD),
      Color(0xFFFF4484),
      Color(0xFFFFA13B),
      Color(0xFFECC216),
      Color(0xFF137C41),
      Color(0xFF27BC7A),
      Color(0xFF00A4F0),
      Color(0xFF5F5AD9),
      Color(0xFFAF33A5),
      Color(0xFFDB2865),
      Color(0xFFC26500),
      Color(0xFF70666F),
      Color(0xFF912147),
      Color(0xFF67649E),
    ],
  ),
  spring(
    eventColors: [
      Color(0xFF97D84F),
      Color(0xFF00A651),
      Color(0xFF00B9E3),
      Color(0xFF00DCE3),
      Color(0xFFC9D436),
      Color(0xFF56DC9A),
      Color(0xFFFFA13B),
      Color(0xFF68E0A5),
      Color(0xFF94F2CC),
      Color(0xFF33DAC8),
      Color(0xFF87C288),
      Color(0xFFDDC839),
      Color(0xFFFFA13B),
      Color(0xFFF17A2B),
      Color(0xFFE01010),
      Color(0xFF00812D),
      Color(0xFF406400),
      Color(0xFF00646E),
    ],
  ),
  note1(
    eventColors: [
      Color(0xFFFFDDDD),
      Color(0xFFFFE7D1),
      Color(0xFFFFFBD6),
      Color(0xFFEDF7D3),
      Color(0xFFE8F7FF),
      Color(0xFFEFE2FD),
      Color(0xFFEBD7CF),
      Color(0xFFFFE6F7),
      Color(0xFFF3F3F3),
      Color(0x00ddffeb),
      Color(0xFFDFDFFB),
      Color(0xFFE9CCE9),
      Color(0xFFFBD0E6),
      Color(0xFFE0E0CC),
      Color(0xFFD9EFD9),
      Color(0xFFCCE9E9),
      Color(0xFFD2DDEF),
      Color(0xFFE1E1E2),
    ],
  ),
  note2(
    eventColors: [
      Color(0xFFFFB6B6),
      Color(0xFFFECC9F),
      Color(0xFFFFF6AA),
      Color(0xFFD9EEA2),
      Color(0xFFCFEFFF),
      Color(0xFFDEC1FA),
      Color(0xFFD4AA9A),
      Color(0xFFFFCBEF),
      Color(0xFFE5E5E5),
      Color(0xFFB7FFD6),
      Color(0xFFBCBCF7),
      Color(0xFFD193D1),
      Color(0xFFF79CCA),
      Color(0xFFBEBE93),
      Color(0xFFAFDEAF),
      Color(0xFF93D0D0),
      Color(0xFFA0B7DD),
      Color(0xFFBFC0C2),
    ],
  ),
  pink(
    eventColors: [
      Color(0xFFCF5A80),
      Color(0xFFCCB99A),
      Color(0xFFFF93B4),
      Color(0xFFF9B2CA),
      Color(0xFFAB886C),
      Color(0xFFF679A3),
      Color(0xFFE7ADC1),
      Color(0xFFE2BD83),
      Color(0xFFE18BA7),
      Color(0xFFFF6B9B),
      Color(0xFFED91E2),
      Color(0xFFFD5E94),
      Color(0xFFDFC871),
      Color(0xFFE08F4F),
      Color(0xFFDAB6C2),
      Color(0xFF8E5468),
      Color(0xFFA0234E),
      Color(0xFFF51964),
    ],
  ),
  purple(
    eventColors: [
      Color(0xFF8FABDA),
      Color(0xFF9A4792),
      Color(0xFFD87E7F),
      Color(0xFF7A1989),
      Color(0xFFD667CD),
      Color(0xFFF2C672),
      Color(0xFF80C3DD),
      Color(0xFFBC48B1),
      Color(0xFFDA537E),
      Color(0xFFE35DFF),
      Color(0xFFB920D8),
      Color(0xFFD667CD),
      Color(0xFF891958),
      Color(0xFFA7BEE4),
      Color(0xFF528BC2),
      Color(0xFF882A9B),
      Color(0xFF7E6184),
      Color(0xFFB295AF),
    ],
  ),
  mono(
    eventColors: [
      Color(0xFFB4B4B4),
      Color(0xFF8E8E8E),
      Color(0xFF656565),
      Color(0xFF2A2A2A),
      Color(0xFF6E6E6E),
      Color(0xFFCACACA),
      Color(0xFF4C4C4C),
      Color(0xFF777777),
      Color(0xFF888888),
      Color(0xFF999999),
      Color(0xFFB5B5B5),
      Color(0xFFC4C4C4),
      Color(0xFFD6D6D6),
      Color(0xFFE0E0E0),
      Color(0xFFE4E4E4),
      Color(0xFFC1DEDC),
      Color(0xFF9CC1BF),
      Color(0xFF6CAFAB),
    ],
  ),
  dark1(
    eventColors: [
      Color(0xFF4B6331),
      Color(0xFF32615B),
      Color(0xFF365171),
      Color(0xFF474671),
      Color(0xFF623A5F),
      Color(0xFF712D44),
      Color(0xFF714F2A),
      Color(0xFF6A5B1D),
      Color(0xFF1C412C),
      Color(0xFF235941),
      Color(0xFF15506C),
      Color(0xFF373563),
      Color(0xFF542750),
      Color(0xFF642239),
      Color(0xFF5B3915),
      Color(0xFF3D3A3D),
      Color(0xFF49202E),
      Color(0xFF3A394E),
    ],
  ),
  dark2(
    eventColors: [
      Color(0xFFC1E795),
      Color(0xFF96E4DA),
      Color(0xFF9ECAFF),
      Color(0xFFBAB8FF),
      Color(0xFFE6A4E1),
      Color(0xFFFF8FB5),
      Color(0xFFFFC789),
      Color(0xFFF4DA73),
      Color(0xFF71B08D),
      Color(0xFF7DD7AF),
      Color(0xFF66C8F6),
      Color(0xFF9F9CE8),
      Color(0xFFCF85C9),
      Color(0xFFE97EA3),
      Color(0xFFDAA366),
      Color(0xFFA9A3A9),
      Color(0xFFBD7A91),
      Color(0xFFA4A2C5),
    ],
  );

  final List<Color> eventColors;
  const CalendarTheme({required this.eventColors});
}

abstract class AppPalette {
  static const Color transparent = Colors.transparent;
  static const Color text = Color(0xFF048BF1);
  static const Color primary = Color(0xFF009BFF);
  static const Color bg01 = Color(0xFFEBF7FF);
  static const Color bg02 = Color(0xFFF2FAFF);
  static const Color bg03 = Color(0xFFF0F3F5);
  static const Color red = Color(0xFFFF0000);
  static const Color yellow = Color(0xFFFFCC00);
  static const Color btn = Color(0xFFB3BDC8);
  static const Color grey100 = Color(0xFFFFFFFF);
  static const Color grey200 = Color(0xFFF2F2F2);
  static const Color grey250 = Color(0xFFEEEEEE);
  static const Color grey300 = Color(0xFFD5D5D5);
  static const Color grey400 = Color(0xFFC3C3C3);
  static const Color grey500 = Color(0xFF999999);
  static const Color grey600 = Color(0xFF666666);
  static const Color grey700 = Color(0xFF333333);
  static const Color grey800 = Color(0xFF000000);
  static const Color divider = Color(0xFFE9E9E9);
}
