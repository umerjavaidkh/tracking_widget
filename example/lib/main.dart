import 'package:flutter/material.dart';
import 'package:steps_widget/models/track.dart';
import 'package:steps_widget/tracking_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(children: [
            TrackingWidget(
              direction: Axis.horizontal,
              itemGap: 35,
              color: Colors.grey,
              trackList: [  Track(isActive: true, labelText: "Created"),
                Track(isActive: true, labelText: "Out of Delivery"),
                Track(isActive: false, labelText: "Fulfilled"),
              ],
            ),
            const SizedBox(height: 60,),
            TrackingWidget(
              direction: Axis.vertical,
              itemGap: 35,
              color: Colors.grey,
              trackList: [  Track(isActive: true, labelText: "Created",date: '9 Aug 2022'),
                Track(isActive: true, labelText: "Out of Delivery",date: '10 Aug 2022'),
                Track(isActive: false, labelText: "Fulfilled"),
              ],
            )
          ],),
        ));
  }
}
