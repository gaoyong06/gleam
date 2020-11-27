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

  static TextStyle bold24Color333333 = TextStyle(
    fontSize: Dimens.fontPt24,
    color: AppColors.cl333333,
    fontWeight: FontWeight.w600,
  );

  static TextStyle normal18Color333333 = TextStyle(
    fontSize: Dimens.fontPt18,
    color: AppColors.cl333333,
  );

  static TextStyle bold18Color333333 = TextStyle(
    fontSize: Dimens.fontPt18,
    color: AppColors.cl333333,
    fontWeight: FontWeight.w600,
  );

  static TextStyle normal15Color333333 = TextStyle(
    fontSize: Dimens.fontPt15,
    color: AppColors.cl333333,
  );

  static TextStyle bold15Color333333 = TextStyle(
    fontSize: Dimens.fontPt15,
    color: AppColors.cl333333,
    fontWeight: FontWeight.w600,
  );

  static TextStyle normal16Color333333 = TextStyle(
    fontSize: Dimens.fontPt16,
    color: AppColors.cl333333,
  );

  static TextStyle normal13Color333333 = TextStyle(
    fontSize: Dimens.fontPt13,
    color: AppColors.cl333333,
  );

  static TextStyle bold13Color333333 = TextStyle(
    fontSize: Dimens.fontPt13,
    color: AppColors.cl333333,
    fontWeight: FontWeight.w600,
  );

  static TextStyle normal14Color333333 = TextStyle(
    fontSize: Dimens.fontPt14,
    color: AppColors.cl333333,
  );

  static TextStyle bold14Color333333 = TextStyle(
    fontSize: Dimens.fontPt14,
    color: AppColors.cl333333,
    fontWeight: FontWeight.w600,
  );

  static TextStyle normal12Color333333 = TextStyle(
    fontSize: Dimens.fontPt12,
    color: AppColors.cl333333,
  );

  static TextStyle normal11Color333333 = TextStyle(
    fontSize: Dimens.fontPt11,
    color: AppColors.cl333333,
  );

  static TextStyle normal11Color666666 = TextStyle(
    fontSize: Dimens.fontPt11,
    color: AppColors.cl666666,
  );

  static TextStyle normal15ColorD8D8D8 = TextStyle(
    fontSize: Dimens.fontPt15,
    color: AppColors.clD8D8D8,
  );

  static TextStyle normal12ColorD8D8D8 = TextStyle(
    fontSize: Dimens.fontPt12,
    color: AppColors.clD8D8D8,
  );

  static TextStyle normal11ColorD8D8D8 = TextStyle(
    fontSize: Dimens.fontPt11,
    color: AppColors.clD8D8D8,
  );

  static TextStyle normal18Color999999 = TextStyle(
    fontSize: Dimens.fontPt18,
    color: AppColors.cl999999,
  );

  static TextStyle normal15Color999999 = TextStyle(
    fontSize: Dimens.fontPt15,
    color: AppColors.cl999999,
  );

  static TextStyle bold15Color999999 = TextStyle(
      fontSize: Dimens.fontPt15,
      color: AppColors.cl999999,
      fontWeight: FontWeight.w600);

  static TextStyle normal14Color999999 = TextStyle(
    fontSize: Dimens.fontPt14,
    color: AppColors.cl999999,
  );

  static TextStyle normal13Color999999 = TextStyle(
    fontSize: Dimens.fontPt13,
    color: AppColors.cl999999,
  );

  static TextStyle normal12Color999999 = TextStyle(
    fontSize: Dimens.fontPt12,
    color: AppColors.cl999999,
  );

  static TextStyle normal11Color999999 = TextStyle(
    fontSize: Dimens.fontPt11,
    color: AppColors.cl999999,
  );

  static TextStyle normal10Color999999 = TextStyle(
    fontSize: Dimens.fontPt10,
    color: AppColors.cl999999,
  );

  static TextStyle bold24ColorFFFFFF = TextStyle(
    fontSize: Dimens.fontPt24,
    color: AppColors.clFFFFFF,
    fontWeight: FontWeight.w600,
  );

  static TextStyle bold18ColorFFFFFF = TextStyle(
    fontSize: Dimens.fontPt18,
    color: AppColors.clFFFFFF,
    fontWeight: FontWeight.w600,
  );

  static TextStyle normal10ColorFFFFFF = TextStyle(
    fontSize: Dimens.fontPt10,
    color: AppColors.clFFFFFF,
  );

  static TextStyle normal12ColorFFFFFF = TextStyle(
    fontSize: Dimens.fontPt12,
    color: AppColors.clFFFFFF,
  );

  static TextStyle normal13ColorFFFFFF = TextStyle(
    fontSize: Dimens.fontPt13,
    color: AppColors.clFFFFFF,
  );

  static TextStyle normal11Color000000 = TextStyle(
    fontSize: Dimens.fontPt11,
    color: AppColors.cl000000,
  );

  static TextStyle normal16Color5791F3 = TextStyle(
    fontSize: Dimens.fontPt16,
    color: AppColors.cl5791F3,
  );

  static TextStyle normal15Color5791F3 = TextStyle(
    fontSize: Dimens.fontPt15,
    color: AppColors.cl5791F3,
  );

  static TextStyle bold15Color5791F3 = TextStyle(
    fontSize: Dimens.fontPt15,
    color: AppColors.cl5791F3,
    fontWeight: FontWeight.w500,
  );

  static TextStyle normal13Color5791F3 = TextStyle(
    fontSize: Dimens.fontPt13,
    color: AppColors.cl5791F3,
  );

  static TextStyle bold12Color5791F3 = TextStyle(
    fontSize: Dimens.fontPt12,
    color: AppColors.cl5791F3,
    fontWeight: FontWeight.w500,
  );

  static TextStyle normal11Color5791F3 = TextStyle(
    fontSize: Dimens.fontPt11,
    color: AppColors.cl5791F3,
  );

  static TextStyle normal15Color666666 = TextStyle(
    fontSize: Dimens.fontPt15,
    color: AppColors.cl666666,
  );

  static TextStyle normal13Color666666 = TextStyle(
    fontSize: Dimens.fontPt13,
    color: AppColors.cl666666,
  );

  static TextStyle normal15ColorFF0000 = TextStyle(
    fontSize: Dimens.fontPt15,
    color: AppColors.clFF0000,
  );

  static TextStyle normal12Color455A64 = TextStyle(
    fontSize: Dimens.fontPt12,
    color: AppColors.cl455A64,
  );

  static TextStyle normal14Color66455A64 = TextStyle(
    fontSize: Dimens.fontPt14,
    color: AppColors.cl66455A64,
  );

  static TextStyle normal14Color646566 = TextStyle(
    fontSize: Dimens.fontPt14,
    color: AppColors.cl646566,
  );

  static TextStyle normal14Color969799 = TextStyle(
    fontSize: Dimens.fontPt14,
    color: AppColors.cl969799,
  );

  static TextStyle normal14ColorC8C9CC =
      TextStyle(fontSize: Dimens.fontPt14, color: AppColors.clC8C9CC);

  static TextStyle normal14Color323233 = TextStyle(
    fontSize: Dimens.fontPt14,
    color: AppColors.cl323233,
  );

  static TextStyle normal12Color1989FA = TextStyle(
    fontSize: Dimens.fontPt12,
    color: AppColors.cl1989FA,
  );
}
