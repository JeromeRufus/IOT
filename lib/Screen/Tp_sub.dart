import 'dart:convert';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';
import 'package:demo/util/Storagezkeys.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../util/data.dart';
import 'package:http/http.dart' as http;

// ignore: must_be_immutable
class TpSub extends StatefulWidget {
  //const TpSub({super.key, required this.title});
  TpSub(
    this.humid,
    this.temp, {
    super.key,
  });
  //final String title;
  String temp;
  String humid;

  @override
  State<TpSub> createState() => _TpSubState();
}

class _TpSubState extends State<TpSub> {
  late List<TpData> _tpData;
  late TooltipBehavior _tooltipBehavior;
  // String? temp;
  // String? humid;

  Future<void> _getDht() async {
    while (true) {
      await Future.delayed(Duration(seconds: 5));
      var url = Uri.parse(
          "https://api.thingspeak.com/channels/2388247/feeds.json?api_key=OWELSEN5P6UA68M8&results=2");
      while (true) {
        var result = await http.get(url);
        Map<String, dynamic> feeds = jsonDecode(result.body);
        Map<String, dynamic> fields = feeds["feeds"][0];
        setState(() {
          widget.temp = fields["field1"];
          widget.humid = fields["field2"];
          _tpData = getChartData();
        });
        print(widget.temp);
        print(widget.humid);
        //sleep(Duration(seconds: 5));
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _tpData = getChartData();
    _tooltipBehavior = TooltipBehavior(enable: true);
    _getDht();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 30.0, vertical: 20),
        child: SfCircularChart(
          legend: Legend(
            isVisible: true,
            alignment: ChartAlignment.near,
            overflowMode: LegendItemOverflowMode.scroll,
          ),
          series: <CircularSeries>[
            RadialBarSeries<TpData, String>(
              cornerStyle: CornerStyle.bothCurve,
              //radius: '45%',
              dataSource: _tpData,
              xValueMapper: (TpData df, _) => df.label,
              yValueMapper: (TpData df, _) => df.cdata,
              dataLabelSettings: DataLabelSettings(isVisible: true),
              enableTooltip: true,
              animationDuration: 10,
              //radius: '50%',
            ),
          ],
        ),
      ),
    );
  }

  List<TpData> getChartData() {
    final List<TpData> chartData = [
      TpData("Temperature", double.tryParse(widget.temp) ?? 0.0),
      TpData("humidity", double.tryParse(widget.humid) ?? 0.0),
    ];
    return chartData;
  }
}

class TpData {
  TpData(this.label, this.cdata);
  final String label;
  final double cdata;
}
