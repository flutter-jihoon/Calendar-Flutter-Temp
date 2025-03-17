import 'package:flutter/material.dart';

abstract final class AppTextStyles {
  static get _baseTextStyle {
    return TextStyle(
      overflow: TextOverflow.ellipsis,
    );
  }

  static TextStyle style12Regular({
    Color? color,
    double? height,
    double? letterSpacing,
  }) {
    return _baseTextStyle.copyWith(
      fontSize: 12.0,
      fontWeight: FontWeight.normal,
      color: color,
      height: height,
      letterSpacing: letterSpacing,
    );
  }

  static TextStyle style12Medium({
    Color? color,
    double? height,
    double? letterSpacing,
  }) {
    return _baseTextStyle.copyWith(
      fontSize: 12.0,
      fontWeight: FontWeight.w500,
      color: color,
      height: height,
      letterSpacing: letterSpacing,
    );
  }

  static TextStyle style12Bold({
    Color? color,
    double? height,
    double? letterSpacing,
  }) {
    return _baseTextStyle.copyWith(
      fontSize: 12.0,
      fontWeight: FontWeight.bold,
      color: color,
      height: height,
      letterSpacing: letterSpacing,
    );
  }

  static TextStyle style13Regular({
    Color? color,
    double? height,
    double? letterSpacing,
  }) {
    return _baseTextStyle.copyWith(
      fontSize: 13.0,
      fontWeight: FontWeight.normal,
      color: color,
      height: height,
      letterSpacing: letterSpacing,
    );
  }

  static TextStyle style13Medium({
    Color? color,
    double? height,
    double? letterSpacing,
  }) {
    return _baseTextStyle.copyWith(
      fontSize: 13.0,
      fontWeight: FontWeight.w500,
      color: color,
      height: height,
      letterSpacing: letterSpacing,
    );
  }

  static TextStyle style13Bold({
    Color? color,
    double? height,
    double? letterSpacing,
  }) {
    return _baseTextStyle.copyWith(
      fontSize: 13.0,
      fontWeight: FontWeight.bold,
      color: color,
      height: height,
      letterSpacing: letterSpacing,
    );
  }

  static TextStyle style14Regular({
    Color? color,
    double? height,
    double? letterSpacing,
  }) {
    return _baseTextStyle.copyWith(
      fontSize: 14.0,
      fontWeight: FontWeight.normal,
      color: color,
      height: height,
      letterSpacing: letterSpacing,
    );
  }

  static TextStyle style14Medium({
    Color? color,
    double? height,
    double? letterSpacing,
  }) {
    return _baseTextStyle.copyWith(
      fontSize: 14.0,
      fontWeight: FontWeight.w500,
      color: color,
      height: height,
      letterSpacing: letterSpacing,
    );
  }

  static TextStyle style14Bold({
    Color? color,
    double? height,
    double? letterSpacing,
  }) {
    return _baseTextStyle.copyWith(
      fontSize: 14.0,
      fontWeight: FontWeight.bold,
      color: color,
      height: height,
      letterSpacing: letterSpacing,
    );
  }

  static TextStyle style15Regular({
    Color? color,
    double? height,
    double? letterSpacing,
  }) {
    return _baseTextStyle.copyWith(
      fontSize: 15.0,
      fontWeight: FontWeight.normal,
      color: color,
      height: height,
      letterSpacing: letterSpacing,
    );
  }

  static TextStyle style15Medium({
    Color? color,
    double? height,
    double? letterSpacing,
  }) {
    return _baseTextStyle.copyWith(
      fontSize: 15.0,
      fontWeight: FontWeight.w500,
      color: color,
      height: height,
      letterSpacing: letterSpacing,
    );
  }

  static TextStyle style15Bold({
    Color? color,
    double? height,
    double? letterSpacing,
  }) {
    return _baseTextStyle.copyWith(
      fontSize: 15.0,
      fontWeight: FontWeight.bold,
      color: color,
      height: height,
      letterSpacing: letterSpacing,
    );
  }

  static TextStyle style16Regular({
    Color? color,
    double? height,
    double? letterSpacing,
  }) {
    return _baseTextStyle.copyWith(
      fontSize: 16.0,
      fontWeight: FontWeight.normal,
      color: color,
      height: height,
      letterSpacing: letterSpacing,
    );
  }

  static TextStyle style16Medium({
    Color? color,
    double? height,
    double? letterSpacing,
  }) {
    return _baseTextStyle.copyWith(
      fontSize: 16.0,
      fontWeight: FontWeight.w500,
      color: color,
      height: height,
      letterSpacing: letterSpacing,
    );
  }

  static TextStyle style16Bold({
    Color? color,
    double? height,
    double? letterSpacing,
  }) {
    return _baseTextStyle.copyWith(
      fontSize: 16.0,
      fontWeight: FontWeight.bold,
      color: color,
      height: height,
      letterSpacing: letterSpacing,
    );
  }

  static TextStyle style18Regular({
    Color? color,
    double? height,
    double? letterSpacing,
  }) {
    return _baseTextStyle.copyWith(
      fontSize: 18.0,
      fontWeight: FontWeight.normal,
      color: color,
      height: height,
      letterSpacing: letterSpacing,
    );
  }

  static TextStyle style18Medium({
    Color? color,
    double? height,
    double? letterSpacing,
  }) {
    return _baseTextStyle.copyWith(
      fontSize: 18.0,
      fontWeight: FontWeight.w500,
      color: color,
      height: height,
      letterSpacing: letterSpacing,
    );
  }

  static TextStyle style18Bold({
    Color? color,
    double? height,
    double? letterSpacing,
  }) {
    return _baseTextStyle.copyWith(
      fontSize: 18.0,
      fontWeight: FontWeight.bold,
      color: color,
      height: height,
      letterSpacing: letterSpacing,
    );
  }

  static TextStyle style20Regular({
    Color? color,
    double? height,
    double? letterSpacing,
  }) {
    return _baseTextStyle.copyWith(
      fontSize: 20.0,
      fontWeight: FontWeight.normal,
      color: color,
      height: height,
      letterSpacing: letterSpacing,
    );
  }

  static TextStyle style20Medium({
    Color? color,
    double? height,
    double? letterSpacing,
  }) {
    return _baseTextStyle.copyWith(
      fontSize: 20.0,
      fontWeight: FontWeight.w500,
      color: color,
      height: height,
      letterSpacing: letterSpacing,
    );
  }

  static TextStyle style20Bold({
    Color? color,
    double? height,
    double? letterSpacing,
  }) {
    return _baseTextStyle.copyWith(
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
      color: color,
      height: height,
      letterSpacing: letterSpacing,
    );
  }
}
