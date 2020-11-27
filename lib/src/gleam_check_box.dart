/* 
* created by 1129502088@qq.com
* Date 2020/11/25 11:24
*/
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GleamCheckBox extends StatefulWidget {
  ///未选中图标
  final Widget icon;

  ///选中图标
  final Widget activeIcon;

  ///选择项
  final List<CheckBean> items;

  ///排布方向 默认水平
  final Axis direction;

  ///水平间距 默认0
  final double spacing;

  ///垂直间距 默认0
  final double runSpacing;

  ///图标跟文字之间间距 默认6
  final double iconTextSpacing;

  ///图标大小 默认20
  final double iconSize;

  ///文字样式
  final TextStyle textStyle;

  ///操作后回调
  final void Function(List<CheckBean> checkBeans) onChanged;

  ///整体是否选择 默认可以
  final bool enable;

  ///最大可选数量
  final int maxCheckCount;

  ///排布方向 默认左边图标右边文字
  final TextDirection textDirection;

  ///文字点击是否禁用 默认false 不禁用
  final bool labelDisabled;

  GleamCheckBox(
    this.items, {
    this.icon,
    this.activeIcon,
    this.direction = Axis.horizontal,
    this.runSpacing = 0,
    this.spacing = 0,
    this.iconTextSpacing = 6,
    this.iconSize = 20,
    this.textStyle,
    this.onChanged,
    this.enable = true,
    this.maxCheckCount,
    this.textDirection = TextDirection.ltr,
    this.labelDisabled = false,
  });

  @override
  _GleamCheckBoxState createState() => _GleamCheckBoxState();
}

class _GleamCheckBoxState extends State<GleamCheckBox> {
  @override
  Widget build(BuildContext context) {
    if ((widget.items?.length ?? 0) == 0) {
      print("请检查传入选项值");
      return Container();
    }
    if (widget.direction == Axis.vertical)
      return Column(
        children: [
          for (CheckBean item in widget.items)
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  textDirection: widget.textDirection,
                  children: [
                    _buildCheckIcon(item),
                    GestureDetector(
                      child: SizedBox(width: widget.iconTextSpacing),
                      behavior: HitTestBehavior.opaque,
                      onTap: () => widget.labelDisabled ? null : _itemTap(item),
                    ),
                    Expanded(
                      child: GestureDetector(
                        child: Text("${item.label ?? ""}", style: widget.textStyle),
                        behavior: HitTestBehavior.opaque,
                        onTap: () => widget.labelDisabled ? null : _itemTap(item),
                      ),
                    )
                  ],
                ),
                if (widget.items.last != item) SizedBox(height: widget.spacing)
              ],
            ),
        ],
      );
    return Wrap(
      direction: widget.direction,
      spacing: widget.spacing,
      runSpacing: widget.runSpacing,
      children: [
        for (CheckBean item in widget.items)
          Row(
            mainAxisSize: MainAxisSize.min,
            textDirection: widget.textDirection,
            children: [
              _buildCheckIcon(item),
              GestureDetector(
                child: SizedBox(width: widget.iconTextSpacing),
                behavior: HitTestBehavior.opaque,
                onTap: () => widget.labelDisabled ? null : _itemTap(item),
              ),
              GestureDetector(
                child: Text("${item.label ?? ""}", style: widget.textStyle),
                behavior: HitTestBehavior.opaque,
                onTap: () => widget.labelDisabled ? null : _itemTap(item),
              )
            ],
          ),
      ],
    );
  }

  _buildCheckIcon(CheckBean item) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => _itemTap(item),
      child: Container(
        width: widget.iconSize,
        height: widget.iconSize,
        child: item.checked == true
            ? widget.activeIcon ?? Icon(Icons.check_circle)
            : widget.icon ?? Icon(Icons.check_circle_outline),
      ),
    );
  }

  _itemTap(CheckBean item) {
    if (widget.enable && item.enable) {
      if (widget.maxCheckCount != null && !item.checked) {
        int checked = widget.items.where((element) => element.checked).length;
        if (checked >= widget.maxCheckCount) {
          print("超出预设最大可选择数量");
          return;
        }
      }
      setState(() {
        item.checked = !item.checked;
        if (widget.onChanged != null) {
          widget.onChanged(widget.items);
        }
      });
    }
  }
}

class CheckBean {
  ///当前是否选中
  bool checked;

  ///当前是否可编辑
  bool enable;

  ///文本显示
  String label;

  ///唯一id 备用
  String uniqueId;

  CheckBean(
    this.label, {
    this.checked = false,
    this.enable = true,
    this.uniqueId,
  });

  @override
  String toString() {
    return 'CheckBean{checked: $checked,enable: $enable, label: $label, uniqueId: $uniqueId}';
  }
}
