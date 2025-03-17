import 'package:flutter/material.dart';

abstract class CalendarAppIcon extends StatelessWidget {
  const CalendarAppIcon({super.key});

  factory CalendarAppIcon.arrowLeftNavigation(double size) =>
      _ArrowLeftNavigationIcon(size);
  factory CalendarAppIcon.arrowRight(double size) => _ArrowRightIcon(size);
  factory CalendarAppIcon.bell(double size) => _BellIcon(size);
  factory CalendarAppIcon.calendar(double size) => _CalendarIcon(size);
  factory CalendarAppIcon.clock(double size) => _ClockIcon(size);
  factory CalendarAppIcon.closeNavigation(double size) =>
      _CloseNavigationIcon(size);
  factory CalendarAppIcon.checkWhite(double size) => _CheckWhiteIcon(size);
  factory CalendarAppIcon.chevronDown(double size) => _ChevronDownIcon(size);
  factory CalendarAppIcon.chevronRight(double size) => _ChevronRightIcon(size);
  factory CalendarAppIcon.chevronUp(double size) => _ChevronUpIcon(size);
  factory CalendarAppIcon.delete(double size) => _DeleteIcon(size);
  factory CalendarAppIcon.keyboard(double size) => _KeyboardIcon(size);
  factory CalendarAppIcon.lock(double size) => _LockIcon(size);
  factory CalendarAppIcon.logoGoogle(double size) => _LogoGoogleIcon(size);
  factory CalendarAppIcon.menu(double size) => _MenuIcon(size);
  factory CalendarAppIcon.plus(double size) => _PlusIcon(size);
  factory CalendarAppIcon.plusWhite(double size) => _PlusWhiteIcon(size);
  factory CalendarAppIcon.repeat(double size) => _RepeatIcon(size);
  factory CalendarAppIcon.settings(double size) => _SettingsIcon(size);
}

class _ArrowLeftNavigationIcon extends CalendarAppIcon {
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

class _ArrowRightIcon extends CalendarAppIcon {
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

class _BellIcon extends CalendarAppIcon {
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

class _CalendarIcon extends CalendarAppIcon {
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

class _ClockIcon extends CalendarAppIcon {
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

class _CloseNavigationIcon extends CalendarAppIcon {
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

class _CheckWhiteIcon extends CalendarAppIcon {
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

class _ChevronDownIcon extends CalendarAppIcon {
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

class _ChevronRightIcon extends CalendarAppIcon {
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

class _ChevronUpIcon extends CalendarAppIcon {
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

class _DeleteIcon extends CalendarAppIcon {
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

class _KeyboardIcon extends CalendarAppIcon {
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

class _LockIcon extends CalendarAppIcon {
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

class _LogoGoogleIcon extends CalendarAppIcon {
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

class _MenuIcon extends CalendarAppIcon {
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

class _PlusIcon extends CalendarAppIcon {
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

class _PlusWhiteIcon extends CalendarAppIcon {
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

class _RepeatIcon extends CalendarAppIcon {
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

class _SettingsIcon extends CalendarAppIcon {
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
