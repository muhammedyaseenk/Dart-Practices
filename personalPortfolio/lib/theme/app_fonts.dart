import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppFonts {
  static const _baseFont = 'Roboto'; // change this if you use Google Fonts or custom

  static const name = TextStyle(
    fontFamily: _baseFont,
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryText,
  );

  static const role = TextStyle(
    fontFamily: _baseFont,
    fontSize: 14,
    color: AppColors.secondaryText,
  );

  static const body = TextStyle(
    fontFamily: _baseFont,
    fontSize: 14,
    color: AppColors.mutedText,
  );

  static const heading = TextStyle(
    fontFamily: _baseFont,
    fontSize: 22,
    fontWeight: FontWeight.w800,
    color: AppColors.primaryText,
  );

  static final  button = TextStyle(
    fontFamily: _baseFont,
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.buttonText,
  );

  static const timelineTitle = TextStyle(
    fontFamily: _baseFont,
    fontWeight: FontWeight.w700,
    color: AppColors.primaryText,
  );

  static const timelineSubtitle = TextStyle(
    fontFamily: _baseFont,
    color: AppColors.secondaryText,
  );
}
