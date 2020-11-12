/*
 * @Author: gaoyong06@qq.com 
 * @Date: 2020-02-13 16:28:18 
 * @Last Modified by: gaoyong06@qq.com
 * @Last Modified time: 2020-04-26 19:28:27
 */
import 'package:flutter/material.dart';
import 'package:gleam/style/dimens.dart';
import 'package:gleam/style/app_colors.dart';

//一些公共的样式
//在这里定义一些公共的样式，后续涉及到浅色模式和深色模式处理时，使用copyWith来修改颜色
//类似下面来处理：
// style: (style == null)
//          ? TextStyle(color: Colors.white)
//          : style.copyWith(color: Colors.white)

class Style {
  //公共样式
  //文字按钮样式
  static TextStyle btnTextStyle = TextStyle(
    fontSize: Dimens.fontPt10,
    color: AppColors.clF23030,
    letterSpacing: Dimens.spaceDp_026,
  );

  static TextStyle ts_333333_24_bold = TextStyle(
    fontSize: Dimens.fontPt24,
    color: AppColors.cl333333,
    fontWeight: FontWeight.w600,
  );

  static TextStyle ts_333333_18 = TextStyle(
    fontSize: Dimens.fontPt18,
    color: AppColors.cl333333,
  );

  static TextStyle ts_333333_18_bold = TextStyle(
    fontSize: Dimens.fontPt18,
    color: AppColors.cl333333,
    fontWeight: FontWeight.w600,
  );

  static TextStyle ts_333333_15 = TextStyle(
    fontSize: Dimens.fontPt15,
    color: AppColors.cl333333,
  );

  static TextStyle ts_333333_15_bold = TextStyle(
    fontSize: Dimens.fontPt15,
    color: AppColors.cl333333,
    fontWeight: FontWeight.w600,
  );

  static TextStyle ts_333333_16 = TextStyle(
    fontSize: Dimens.fontPt16,
    color: AppColors.cl333333,
  );

  static TextStyle ts_333333_13 = TextStyle(
    fontSize: Dimens.fontPt13,
    color: AppColors.cl333333,
  );

  static TextStyle ts_333333_13_bold = TextStyle(
    fontSize: Dimens.fontPt13,
    color: AppColors.cl333333,
    fontWeight: FontWeight.w600,
  );

  static TextStyle ts_333333_14 = TextStyle(
    fontSize: Dimens.fontPt14,
    color: AppColors.cl333333,
  );

  static TextStyle ts_333333_14_bold = TextStyle(
    fontSize: Dimens.fontPt14,
    color: AppColors.cl333333,
    fontWeight: FontWeight.w600,
  );

  static TextStyle ts_333333_12 = TextStyle(
    fontSize: Dimens.fontPt12,
    color: AppColors.cl333333,
  );

  static TextStyle ts_333333_11 = TextStyle(
    fontSize: Dimens.fontPt11,
    color: AppColors.cl333333,
  );

  static TextStyle ts_666666_11 = TextStyle(
    fontSize: Dimens.fontPt11,
    color: AppColors.cl666666,
  );

  static TextStyle ts_D8D8D8_15 = TextStyle(
    fontSize: Dimens.fontPt15,
    color: AppColors.clD8D8D8,
  );
  static TextStyle ts_D8D8D8_12 = TextStyle(
    fontSize: Dimens.fontPt12,
    color: AppColors.clD8D8D8,
  );

  static TextStyle ts_D8D8D8_11 = TextStyle(
    fontSize: Dimens.fontPt11,
    color: AppColors.clD8D8D8,
  );

  static TextStyle ts_999999_18 = TextStyle(
    fontSize: Dimens.fontPt18,
    color: AppColors.cl999999,
  );

  static TextStyle ts_999999_15 = TextStyle(
    fontSize: Dimens.fontPt15,
    color: AppColors.cl999999,
  );

  static TextStyle ts_999999_15_bold = TextStyle(
      fontSize: Dimens.fontPt15,
      color: AppColors.cl999999,
      fontWeight: FontWeight.w600);

  static TextStyle ts_999999_14 = TextStyle(
    fontSize: Dimens.fontPt14,
    color: AppColors.cl999999,
  );

  static TextStyle ts_999999_13 = TextStyle(
    fontSize: Dimens.fontPt13,
    color: AppColors.cl999999,
  );

  static TextStyle ts_999999_12 = TextStyle(
    fontSize: Dimens.fontPt12,
    color: AppColors.cl999999,
  );

  static TextStyle ts_999999_11 = TextStyle(
    fontSize: Dimens.fontPt11,
    color: AppColors.cl999999,
  );

  static TextStyle ts_999999_10 = TextStyle(
    fontSize: Dimens.fontPt10,
    color: AppColors.cl999999,
  );

  static TextStyle ts_FFFFFF_24_bold = TextStyle(
    fontSize: Dimens.fontPt24,
    color: AppColors.clFFFFFF,
    fontWeight: FontWeight.w600,
  );

  static TextStyle ts_FFFFFF_18_bold = TextStyle(
    fontSize: Dimens.fontPt18,
    color: AppColors.clFFFFFF,
    fontWeight: FontWeight.w600,
  );

  static TextStyle ts_FFFFFF_10 = TextStyle(
    fontSize: Dimens.fontPt10,
    color: AppColors.clFFFFFF,
  );

  static TextStyle ts_FFFFFF_13 = TextStyle(
    fontSize: Dimens.fontPt13,
    color: AppColors.clFFFFFF,
  );

  static TextStyle ts_000000_11 = TextStyle(
    fontSize: Dimens.fontPt11,
    color: AppColors.cl000000,
  );

  static TextStyle ts_5791F3_16 = TextStyle(
    fontSize: Dimens.fontPt16,
    color: AppColors.cl5791F3,
  );

  static TextStyle ts_5791F3_15 = TextStyle(
    fontSize: Dimens.fontPt15,
    color: AppColors.cl5791F3,
  );

  static TextStyle ts_5791F3_15_bold = TextStyle(
    fontSize: Dimens.fontPt15,
    color: AppColors.cl5791F3,
    fontWeight: FontWeight.w500,
  );

  static TextStyle ts_5791F3_13 = TextStyle(
    fontSize: Dimens.fontPt13,
    color: AppColors.cl5791F3,
  );

  static TextStyle ts_5791F3_12_bold = TextStyle(
    fontSize: Dimens.fontPt12,
    color: AppColors.cl5791F3,
    fontWeight: FontWeight.w500,
  );

  static TextStyle ts_5791F3_11 = TextStyle(
    fontSize: Dimens.fontPt11,
    color: AppColors.cl5791F3,
  );

  static TextStyle ts_666666_15 = TextStyle(
    fontSize: Dimens.fontPt15,
    color: AppColors.cl666666,
  );

  static TextStyle ts_666666_13 = TextStyle(
    fontSize: Dimens.fontPt13,
    color: AppColors.cl666666,
  );

  static TextStyle ts_FF0000_15 = TextStyle(
    fontSize: Dimens.fontPt15,
    color: AppColors.clFF0000,
  );
}
