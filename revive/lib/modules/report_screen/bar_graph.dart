import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:revive/modules/report_screen/bar_data.dart';


class MyBarGraph extends StatelessWidget {
  const MyBarGraph({super.key, required this.weeklySummary});
  final List weeklySummary;

  @override
  Widget build(BuildContext context) {
    BarData myBarData = BarData(
      sunAmount: weeklySummary[0],
      monAmount: weeklySummary[1],
      tueAmount: weeklySummary[2],
      wedAmount: weeklySummary[3],
      thurAmount: weeklySummary[4],
      friAmount: weeklySummary[5],
      satAmount: weeklySummary[6],
    );
    myBarData.initializedBarData();
    return BarChart(
      BarChartData(
        maxY: 100,
        minY: 0,
        gridData: FlGridData(show: false),
        borderData: FlBorderData(show: false),
        titlesData: FlTitlesData(
          show: true,
          topTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: false,
            ),
          ),
          leftTitles:  AxisTitles(
            sideTitles: SideTitles(
              showTitles: false,
            ),
          ),
          rightTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: false,
            ),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: getBottomTitles,
            ),
          ),
        ),

        barGroups: myBarData.barData
            .map(
              (data) => BarChartGroupData(
                x: data.x,
                barRods: [
                  BarChartRodData(
                      toY: data.y,
                      color:Color.fromARGB(255, 50, 51, 50),
                      width: 25,
                      borderRadius: BorderRadius.circular(4),
                      backDrawRodData: BackgroundBarChartRodData(
                        show: true,
                        color: Color.fromARGB(121, 149, 150, 149),
                        toY: 100,
                      )),
                ],
              ),
            )
            .toList(),
      ),
    );
  }
}

Widget getBottomTitles(double value, TitleMeta meta) {
  const style = TextStyle(
    color: Colors.black,
    fontSize: 11,
    fontWeight: FontWeight.bold,
  );
  Widget text;
  switch (value.toInt()) {
    case 0:
      text = const Text(
        "S",
        style: style,
      );
      break;
    case 1:
      text = const Text(
        "M",
        style: style,
      );
      break;
    case 2:
      text = const Text(
        "T",
        style: style,
      );
      break;
    case 3:
      text = const Text(
        "W",
        style: style,
      );
      break;
    case 4:
      text = const Text(
        "T",
        style: style,
      );
      break;
    case 5:
      text = const Text(
        'F',
        style: style,
      );
      break;
    case 6:
      text = const Text(
        "S",
        style: style,
      );
      break;

    default:
      text = const Text(
        "",
        style: style,
      );
      break;
  }
  return SideTitleWidget(child: text, axisSide: meta.axisSide);
}
