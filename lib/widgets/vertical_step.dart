import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

class VerticalStep extends StatelessWidget {
  @override
  final Key key;
  final double itemGap;
  final bool isActive;
  final bool isNextActive;
  final String? display;
  final String? date;
  final bool isFirst;
  final bool isLast;
  final Color activeColor;
  final Color color;
  final TextStyle? labelStyle;
  final TextStyle? dateStyle;

  const VerticalStep(
      {required this.key,
        required this.itemGap,
        required this.isActive,
        required this.isNextActive,
        this.display,
        this.date,
        required this.isFirst,
        required this.isLast,
        required this.activeColor ,
        required this.color ,
        this.labelStyle,
        this.dateStyle
      }):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //padding: EdgeInsets.only(left: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                (!isFirst)
                    ? Container(
                  margin: EdgeInsets.only(left: 6),
                  height: itemGap,
                  width: 1,
                  color: isActive
                      ? activeColor
                      : color,
                )
                    : Container(
                  height: itemGap,
                ),
                Container(
                  height: 13,
                  width: 13,
                  decoration: BoxDecoration(
                    color:
                    isActive ? activeColor : color,
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                  ),
                ),
                (!isLast)
                    ? Container(
                  margin: EdgeInsets.only(left: 6),
                  height: itemGap,
                  width: 1,
                  color: isNextActive == true
                      ? activeColor
                      : color,
                )
                    : Container(
                  height: itemGap,
                ),
              ],
            ),
            const SizedBox(
              width: 30,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 22,
                ),
                Text(
                  display ?? "",
                  style: labelStyle ?? TextStyle(
                      fontSize: 18,
                      color: isActive ? ColorManager.greenDark : Colors.grey,
                      fontFamily: "assets/fonts/Dubai-Medium.ttf",
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  date ?? "",
                  style: dateStyle ?? const TextStyle(
                      fontSize: 13,
                      color: Colors.grey,
                      fontWeight: FontWeight.w600),
                ),
              ],
            )
          ],
        ));
  }

  CrossAxisAlignment getCrossAxisAlignment() {
    if (isFirst) {
      return CrossAxisAlignment.start;
    } else if (isLast) {
      return CrossAxisAlignment.center;
    } else {
      return CrossAxisAlignment.center;
    }
  }
}