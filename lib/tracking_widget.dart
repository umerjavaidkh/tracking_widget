import 'package:flutter/material.dart';
import 'package:steps_widget/widgets/horizontal_step.dart';
import 'package:steps_widget/widgets/vertical_step.dart';
import 'utils/app_colors.dart';
import 'models/track.dart';

class TrackingWidget extends StatefulWidget {
  @override
  final Key? key;
  final List<Track> trackList;
  final double itemGap;
  final Axis direction;
  final Color activeColor;
  final Color color;
  final TextStyle? labelStyle;
  final TextStyle? dateStyle;

  const TrackingWidget(
      {this.key,
      required this.trackList,
      this.direction = Axis.horizontal,
      this.itemGap = 40.0,
      this.activeColor = const Color(0xff1ab506),
      this.color = const Color(0xffd8d8d8),
      this.labelStyle,
      this.dateStyle
      })
      : super(key: key);

  @override
  TrackingWidgetState createState() => TrackingWidgetState();
}

class TrackingWidgetState extends State<TrackingWidget> {
  @override
  Widget build(BuildContext context) {
    return widget.direction == Axis.horizontal
        ? SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Container(
              height: 60,
              width: MediaQuery.of(context).size.width,
              color: ColorManager.white,
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Center(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    if (widget.trackList != null)
                      for (int index = 0;
                          index < widget.trackList.length;
                          index++)
                        HorizontalStep(
                            key: Key("$index"),
                            itemGap: widget.itemGap,
                            isActive: widget.trackList[index].isActive,
                            isNextActive: isNextActive(index),
                            display: widget.trackList[index].labelText,
                            isFirst: index == 0,
                            isLast: index == widget.trackList.length - 1,
                            activeColor: widget.activeColor,
                            color: widget.color,
                            labelStyle: widget.labelStyle,
                            dateStyle: widget.dateStyle,
                        ),
                  ],
                ),
              ),
            ),
          )
        : SingleChildScrollView(
            child: Container(
              width: MediaQuery.of(context).size.width,
              //color: ColorManager.white,
              padding: EdgeInsets.only(left: 15, right: 15, top: 25),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    if (widget.trackList != null)
                      for (int index = 0;
                          index < widget.trackList.length;
                          index++)
                        VerticalStep(
                            key: Key("$index"),
                            itemGap: widget.itemGap,
                            isActive: widget.trackList[index].isActive,
                            isNextActive: isNextActive(index),
                            display: widget.trackList[index].labelText,
                            date: widget.trackList[index].date,
                            isFirst: index == 0,
                            isLast: index == widget.trackList.length - 1,
                            activeColor: widget.activeColor,
                            color: widget.color,
                            labelStyle: widget.labelStyle,
                            dateStyle: widget.dateStyle,),
                  ],
                ),
              ),
            ),
          );
  }

  bool isNextActive(int index) {
    if (index + 1 <= widget.trackList.length - 1) {
      return widget.trackList[index + 1].isActive;
    }
    return false;
  }
}






