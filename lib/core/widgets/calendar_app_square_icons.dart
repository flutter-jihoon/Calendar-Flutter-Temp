import 'package:flutter/material.dart';

sealed class CalendarAppSquareIcon extends StatelessWidget {
  const CalendarAppSquareIcon({super.key});

  factory CalendarAppSquareIcon.arrowLeftNavigation(double size) =>
      _ArrowLeftNavigationIcon(size);
  factory CalendarAppSquareIcon.arrowRight(double size) =>
      _ArrowRightIcon(size);
  factory CalendarAppSquareIcon.bell(double size) => _BellIcon(size);
  factory CalendarAppSquareIcon.calendar(double size) => _CalendarIcon(size);
  factory CalendarAppSquareIcon.clock(double size) => _ClockIcon(size);
  factory CalendarAppSquareIcon.closeNavigation(double size) =>
      _CloseNavigationIcon(size);
  factory CalendarAppSquareIcon.checkWhite(double size) =>
      _CheckWhiteIcon(size);
  factory CalendarAppSquareIcon.chevronDown(double size) =>
      _ChevronDownIcon(size);
  factory CalendarAppSquareIcon.chevronRight(double size) =>
      _ChevronRightIcon(size);
  factory CalendarAppSquareIcon.chevronUp(double size) => _ChevronUpIcon(size);
  factory CalendarAppSquareIcon.delete(double size) => _DeleteIcon(size);
  factory CalendarAppSquareIcon.keyboard(double size) => _KeyboardIcon(size);
  factory CalendarAppSquareIcon.lock(double size) => _LockIcon(size);
  factory CalendarAppSquareIcon.logoGoogle(double size) =>
      _LogoGoogleIcon(size);
  factory CalendarAppSquareIcon.menu(double size) => _MenuIcon(size);
  factory CalendarAppSquareIcon.plus(double size) => _PlusIcon(size);
  factory CalendarAppSquareIcon.plusWhite(double size) => _PlusWhiteIcon(size);
  factory CalendarAppSquareIcon.repeat(double size) => _RepeatIcon(size);
  factory CalendarAppSquareIcon.settings(double size) => _SettingsIcon(size);
}

final class _ArrowLeftNavigationIcon extends CalendarAppSquareIcon {
  final double size;
  const _ArrowLeftNavigationIcon(this.size);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'packages/calendar_flutter/assets/icons/arrow_left_navigation.webp',
      width: size,
      height: size,
    );
  }
}

final class _ArrowRightIcon extends CalendarAppSquareIcon {
  final double size;
  const _ArrowRightIcon(this.size);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'packages/calendar_flutter/assets/icons/arrow_right.webp',
      width: size,
      height: size,
    );
  }
}

final class _BellIcon extends CalendarAppSquareIcon {
  final double size;
  const _BellIcon(this.size);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'packages/calendar_flutter/assets/icons/bell.webp',
      width: size,
      height: size,
    );
  }
}

final class _CalendarIcon extends CalendarAppSquareIcon {
  final double size;
  const _CalendarIcon(this.size);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'packages/calendar_flutter/assets/icons/calendar.webp',
      width: size,
      height: size,
    );
  }
}

final class _ClockIcon extends CalendarAppSquareIcon {
  final double size;
  const _ClockIcon(this.size);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'packages/calendar_flutter/assets/icons/clock.webp',
      width: size,
      height: size,
    );
  }
}

final class _CloseNavigationIcon extends CalendarAppSquareIcon {
  final double size;
  const _CloseNavigationIcon(this.size);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'packages/calendar_flutter/assets/icons/close_navigation.webp',
      width: size,
      height: size,
    );
  }
}

final class _CheckWhiteIcon extends CalendarAppSquareIcon {
  final double size;
  const _CheckWhiteIcon(this.size);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'packages/calendar_flutter/assets/icons/check_white.webp',
      width: size,
      height: size,
    );
  }
}

final class _ChevronDownIcon extends CalendarAppSquareIcon {
  final double size;
  const _ChevronDownIcon(this.size);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'packages/calendar_flutter/assets/icons/chevron_down.webp',
      width: size,
      height: size,
    );
  }
}

final class _ChevronRightIcon extends CalendarAppSquareIcon {
  final double size;
  const _ChevronRightIcon(this.size);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'packages/calendar_flutter/assets/icons/chevron_right.webp',
      width: size,
      height: size,
    );
  }
}

final class _ChevronUpIcon extends CalendarAppSquareIcon {
  final double size;
  const _ChevronUpIcon(this.size);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'packages/calendar_flutter/assets/icons/chevron_up.webp',
      width: size,
      height: size,
    );
  }
}

final class _DeleteIcon extends CalendarAppSquareIcon {
  final double size;
  const _DeleteIcon(this.size);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'packages/calendar_flutter/assets/icons/delete.webp',
      width: size,
      height: size,
    );
  }
}

final class _KeyboardIcon extends CalendarAppSquareIcon {
  final double size;
  const _KeyboardIcon(this.size);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'packages/calendar_flutter/assets/icons/keyboard.webp',
      width: size,
      height: size,
    );
  }
}

final class _LockIcon extends CalendarAppSquareIcon {
  final double size;
  const _LockIcon(this.size);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'packages/calendar_flutter/assets/icons/lock.webp',
      width: size,
      height: size,
    );
  }
}

final class _LogoGoogleIcon extends CalendarAppSquareIcon {
  final double size;
  const _LogoGoogleIcon(this.size);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'packages/calendar_flutter/assets/icons/logo_google.webp',
      width: size,
      height: size,
    );
  }
}

final class _MenuIcon extends CalendarAppSquareIcon {
  final double size;
  const _MenuIcon(this.size);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'packages/calendar_flutter/assets/icons/menu.webp',
      width: size,
      height: size,
    );
  }
}

final class _PlusIcon extends CalendarAppSquareIcon {
  final double size;
  const _PlusIcon(this.size);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'packages/calendar_flutter/assets/icons/plus.webp',
      width: size,
      height: size,
    );
  }
}

final class _PlusWhiteIcon extends CalendarAppSquareIcon {
  final double size;
  const _PlusWhiteIcon(this.size);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'packages/calendar_flutter/assets/icons/plus_white.webp',
      width: size,
      height: size,
    );
  }
}

final class _RepeatIcon extends CalendarAppSquareIcon {
  final double size;
  const _RepeatIcon(this.size);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'packages/calendar_flutter/assets/icons/repeat.webp',
      width: size,
      height: size,
    );
  }
}

final class _SettingsIcon extends CalendarAppSquareIcon {
  final double size;
  const _SettingsIcon(this.size);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'packages/calendar_flutter/assets/icons/settings.webp',
      width: size,
      height: size,
    );
  }
}
