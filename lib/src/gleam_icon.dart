/*
 * @Author: gaoyong06@qq.com
 * @Date: 2020-11-05 17:30:23 
 * @Last Modified by: gaoyong06@qq.com
 * @Last Modified time: 2020-11-05 17:30:23
 */
import 'package:flutter/material.dart';
import 'package:badges/badges.dart';
import 'package:gleam/style/style.dart';

/// GleamIcon 图标
class GleamIcon extends StatelessWidget {
  final IconData icon;
  final double size;
  final Color color;
  final bool dot;
  final String badge;
  final TextStyle badgeStyle;

  const GleamIcon(this.icon,
      {Key key,
      this.size,
      this.color,
      this.dot = false,
      this.badge,
      this.badgeStyle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool _showBadge = true;
    _showBadge = badge != null ? true : false;
    _showBadge = dot != null && dot ? true : _showBadge;

    return Badge(
      badgeContent: Text(
        badge ?? "",
        style: badgeStyle ?? Style.ts_FFFFFF_12,
      ),
      showBadge: _showBadge,
      toAnimate: false,
      shape: dot != null && dot ? BadgeShape.circle : BadgeShape.square,
      borderRadius: BorderRadius.all(Radius.circular(16.0)),
      position: BadgePosition.bottomStart(bottom: 20, start: 20),
      padding: EdgeInsets.symmetric(horizontal: 3.0),
      child: Icon(
        icon,
        size: size,
        color: color,
      ),
    );
  }
}
