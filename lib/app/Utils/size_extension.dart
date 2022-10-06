import 'dart:math';
import 'package:flutter/material.dart';
import 'screen_util.dart';

extension SizeExtension on num {
  double get w => ScreenUtil().setWidth(this);

  double get h => ScreenUtil().setHeight(this);

  double get r => ScreenUtil().radius(this);

  double get sp => ScreenUtil().setSp(this);

  double get sm => min(toDouble(), sp);

  double get sw => ScreenUtil().screenWidth * this;

  double get sh => ScreenUtil().screenHeight * this;

  Widget get verticalSpace => ScreenUtil().setVerticalSpacing(this);

  Widget get verticalSpaceFromWidth =>
      ScreenUtil().setVerticalSpacingFromWidth(this);

  Widget get horizontalSpace => ScreenUtil().setHorizontalSpacing(this);

  Widget get horizontalSpaceRadius =>
      ScreenUtil().setHorizontalSpacingRadius(this);

  Widget get verticalSpacingRadius =>
      ScreenUtil().setVerticalSpacingRadius(this);
}

extension EdgeInsetsExtension on EdgeInsets {
  EdgeInsets get r => copyWith(
        top: top.r,
        bottom: bottom.r,
        right: right.r,
        left: left.r,
      );
}

extension BorderRaduisExtension on BorderRadius {
  BorderRadius get r => copyWith(
        bottomLeft: bottomLeft.r,
        bottomRight: bottomRight.r,
        topLeft: topLeft.r,
        topRight: topRight.r,
      );
}

extension RaduisExtension on Radius {
  Radius get r => Radius.elliptical(x.r, y.r);
}

extension BoxConstraintsExtension on BoxConstraints {
  BoxConstraints get r => this.copyWith(
        maxHeight: maxHeight.r,
        maxWidth: maxWidth.r,
        minHeight: minHeight.r,
        minWidth: minWidth.r,
      );

  BoxConstraints get hw => this.copyWith(
        maxHeight: maxHeight.h,
        maxWidth: maxWidth.w,
        minHeight: minHeight.h,
        minWidth: minWidth.w,
      );
}
