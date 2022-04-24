import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

class HorizontalStep extends StatelessWidget {
  @override
  final Key key;
  final double itemGap;
  final bool isActive;
  final bool isNextActive;
  final String? display;
  final bool isFirst;
  final bool isLast;

  final Color activeColor;
  final Color color;
  final TextStyle? labelStyle;
  final TextStyle? dateStyle;

  const HorizontalStep(
      {required this.key,
        required this.itemGap,
        required this.isActive,
        required this.isNextActive,
        this.display,
        this.isFirst = false,
        this.isLast = false,
        required this.activeColor ,
        required this.color ,
        this.labelStyle,
        this.dateStyle
      }):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50,
        //padding: EdgeInsets.only(left: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                (!isFirst)
                    ? Container(
                  height: 1,
                  width: itemGap,
                  color: isActive ? activeColor : color
                      /*? ColorManager.greenDark
                      : ColorManager.dim_gray,*/
                )
                    : Container(
                  width: itemGap,
                ),
                Container(
                  height: 12,
                  width: 12,
                  decoration: BoxDecoration(
                    color: isActive
                        ? activeColor
                        : color,
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                  ),
                ),
                (!isLast)
                    ? Container(
                  height: 1,
                  width: itemGap,
                  color: isNextActive == true
                      ? activeColor
                      : color,
                )
                    : Container(
                  width: itemGap,
                ),
              ],
            ),
            Text(
              display ?? "",
              style: labelStyle ?? TextStyle(
                  fontSize: 11,
                  color: isActive ? ColorManager.greenDark : Colors.grey,
                  fontFamily: "Dubai",
                  fontWeight: FontWeight.w600),
            ),
          ],
        ));
  }

  CrossAxisAlignment getCrossAxisAlignment() {
    if (isFirst) {
      return CrossAxisAlignment.start;
    } else if (isLast)
      return CrossAxisAlignment.center;
    else {
      return CrossAxisAlignment.center;
    }
  }
}