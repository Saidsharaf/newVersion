// ignore_for_file: prefer_typing_uninitialized_variables
import 'package:flutter/material.dart';
import 'package:revive/modules/Owner/Report/data_model.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ReportScreen extends StatefulWidget {
  const ReportScreen({super.key});

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  num containerId = 0;
  late ZoomPanBehavior _zoomPanBehavior;
  List<SalesData> lineOne = [
    SalesData(1, 8),
    SalesData(2, 12),
    SalesData(3, 13),
    SalesData(4, 0),
    SalesData(5, 5),
    SalesData(6, 10),
    SalesData(7, 14),
    SalesData(8, 15),
    SalesData(9, 0),
    SalesData(10, 15),
    // SalesData(12, 43),
    // SalesData(13, 16),
    // SalesData(14, 18),
    // SalesData(15, 83),
    // SalesData(16, 12.5),
    // SalesData(17, 14),
    // SalesData(18, 13),
    // SalesData(19, 0),
    // SalesData(20, 28),
    // SalesData(21, 40),
    // SalesData(22, 20),
    // SalesData(23, 15),
    // SalesData(24, 12.5),
    // SalesData(25, 14),
    // SalesData(26, 13),
    // SalesData(27, 0),
    // SalesData(28, 10),
    // SalesData(29, 28),
    // SalesData(30, 40),
    // SalesData(31, 20),
  ];
  List<SalesData> lineTwo = [
    SalesData(1, 5),
    SalesData(2, 6),
    SalesData(3, 13),
    SalesData(4, 6),
    SalesData(5, 9),
    SalesData(6, 10),
    SalesData(7, 0),
    SalesData(8, 1),
    SalesData(9, 4),
    SalesData(10, 10),
    // SalesData(12, 28),
    // SalesData(13, 40),
    // SalesData(14, 20),
    // SalesData(15, 15),
    // SalesData(16, 12.5),
    // SalesData(17, 14),
    // SalesData(18, 13),
    // SalesData(19, 0),
    // SalesData(20, 28),
    // SalesData(21, 40),
    // SalesData(22, 20),
    // SalesData(23, 15),
    // SalesData(24, 12.5),
    // SalesData(25, 14),
    // SalesData(26, 13),
    // SalesData(27, 0),
    // SalesData(28, 10),
    // SalesData(29, 28),
    // SalesData(30, 40),
    // SalesData(31, 20),
  ];
  List<SalesData> lineThree = [
    SalesData(1, 1),
    SalesData(2, 12),
    SalesData(3, 11),
    SalesData(4, 10),
    SalesData(5, 9),
    SalesData(6, 10),
    SalesData(7, 11),
    SalesData(8, 8),
    SalesData(9, 14),
    SalesData(10, 7),
  ];
  List<SalesData> lineFour = [
    SalesData(1, 14),
    SalesData(2, 16),
    SalesData(3, 10),
    SalesData(4, 4),
    SalesData(5, 15),
    SalesData(6, 14),
    SalesData(7, 15),
    SalesData(8, 14),
    SalesData(9, 4),
    SalesData(10, 10),
    // SalesData(12, 28),
    // SalesData(13, 47),
    // SalesData(14, 24),
    // SalesData(15, 58),
    // SalesData(16, 12.5),
    // SalesData(17, 14),
    // SalesData(18, 13),
    // SalesData(19, 0),
    // SalesData(20, 8),
    // SalesData(21, 10),
    // SalesData(22, 23),
    // SalesData(23, 14),
    // SalesData(24, 23),
    // SalesData(25, 14),
    // SalesData(26, 15),
    // SalesData(27, 5),
    // SalesData(28, 15),
    // SalesData(29, 72),
    // SalesData(30, 20),
    // SalesData(31, 15),
  ];

  List<SalesData> lineFive = [
    SalesData(1, 6),
    SalesData(2, 8),
    SalesData(3, 18),
    SalesData(4, 10),
    SalesData(5, 6),
    SalesData(6, 14),
    SalesData(7, 15),
    SalesData(8, 15),
    SalesData(9, 15),
    SalesData(10, 1),
    // SalesData(12, 14),
    // SalesData(13, 56),
    // SalesData(14, 24),
    // SalesData(15, 58),
    // SalesData(16, 12.5),
    // SalesData(17, 14),
    // SalesData(18, 13),
    // SalesData(19, 0),
    // SalesData(20, 8),
    // SalesData(21, 10),
    // SalesData(22, 23),
    // SalesData(23, 14),
    // SalesData(24, 23),
    // SalesData(25, 14),
    // SalesData(26, 15),
    // SalesData(27, 5),
    // SalesData(28, 15),
    // SalesData(29, 72),
    // SalesData(30, 20),
    // SalesData(31, 15),
  ];
  @override
  void initState() {
    _zoomPanBehavior = ZoomPanBehavior(
      enableSelectionZooming: true,
      enablePanning: true,
      enablePinching: true,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(167, 193, 226, 199),
      // appBar: AppBar(
      //   backgroundColor: const Color.fromARGB(167, 20, 38, 156),
      // ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(
              right: 12,
              left: 12,
              top: 50,
              bottom: 6,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Summary Report',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                  ),
                ),
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    radius: 29,
                    backgroundImage: AssetImage("assets/images/prof1.jpeg"),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              right: 12,
              left: 12,
              top: 6,
              bottom: 6,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      containerId = 1;
                    });
                  },
                  child: MonthsContainerWidget(
                    isCheck: containerId,
                    containerName: '1 month',
                    containerId: 1,
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      containerId = 2;
                    });
                  },
                  child: MonthsContainerWidget(
                    isCheck: containerId,
                    containerName: '3 month',
                    containerId: 2,
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      containerId = 3;
                    });
                  },
                  child: MonthsContainerWidget(
                    isCheck: containerId,
                    containerName: '6 month',
                    containerId: 3,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: SizedBox(
              child: SfCartesianChart(
                zoomPanBehavior: _zoomPanBehavior,
                plotAreaBorderWidth: 0,
                tooltipBehavior: TooltipBehavior(
                  enable: true,
                  header: 'Weither Item',
                ),
                primaryXAxis: NumericAxis(
                  majorGridLines: MajorGridLines(width: 0, color: Colors.grey),
                  edgeLabelPlacement: EdgeLabelPlacement.shift,
                  autoScrollingMode: AutoScrollingMode.start,
                  majorTickLines: MajorTickLines(color: Colors.transparent),
                  axisLine: AxisLine(width: 1),
                  autoScrollingDelta: 15,
                  minimum: 0,
                  maximum: 100,
                ),
                primaryYAxis: NumericAxis(
                  majorTickLines: MajorTickLines(color: Colors.transparent),
                  majorGridLines: MajorGridLines(color: Colors.black),
                  axisLine: AxisLine(width: 0),
                  autoScrollingDelta: 15,
                  autoScrollingMode: AutoScrollingMode.start,
                  edgeLabelPlacement: EdgeLabelPlacement.hide,
                  minimum: 0,
                  maximum: 200,
                ),
                series: <LineSeries<SalesData, num>>[
                  LineSeries<SalesData, num>(
                    dataSource: lineOne,
                    enableTooltip: true,
                    xValueMapper: (SalesData sales, _) => sales.year,
                    yValueMapper: (SalesData sales, _) => sales.sales,
                    dataLabelSettings: const DataLabelSettings(isVisible: true),
                    color: Colors.red,
                  ),
                  LineSeries<SalesData, num>(
                    dataSource: lineTwo,
                    // enableTooltip: true,
                    xValueMapper: (SalesData sales, _) => sales.year,
                    yValueMapper: (SalesData sales, _) => sales.sales,
                    dataLabelSettings: const DataLabelSettings(isVisible: true),
                    color: Colors.green,
                  ),
                  LineSeries<SalesData, num>(
                    dataSource: lineThree,
                    xValueMapper: (SalesData sale, _) => sale.year,
                    yValueMapper: (SalesData sale, _) => sale.sales,
                    // animationDuration: 200,
                    // animationDelay: 300,
                    color: Color.fromARGB(220, 230, 83, 181),
                    width: 2,
                    dataLabelSettings: const DataLabelSettings(
                      textStyle: TextStyle(fontSize: 30, color: Colors.orange),
                    ),
                    // xAxisName: 'X',
                    // yAxisName: 'Y',
                  ),
                  LineSeries<SalesData, num>(
                    dataSource: lineFour,
                    xValueMapper: (SalesData sale, _) => sale.year,
                    yValueMapper: (SalesData sale, _) => sale.sales,
                    // animationDuration: 200,
                    // animationDelay: 300,
                    color: Colors.amberAccent,
                    width: 2,
                    dataLabelSettings: const DataLabelSettings(
                      textStyle: TextStyle(fontSize: 30, color: Colors.orange),
                    ),
                    // xAxisName: 'X',
                    // yAxisName: 'Y',
                  ),
                  LineSeries<SalesData, num>(
                    dataSource: lineFive,
                    xValueMapper: (SalesData sale, _) => sale.year,
                    yValueMapper: (SalesData sale, _) => sale.sales,
                    // animationDuration: 200,
                    // animationDelay: 300,
                    color: Colors.teal,
                    width: 2,
                    dataLabelSettings: const DataLabelSettings(
                      textStyle: TextStyle(fontSize: 30, color: Colors.orange),
                    ),
                    // xAxisName: 'X',
                    // yAxisName: 'Y',
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          const SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                WietherItemsContainerWidget(
                  itemColor: Colors.red,
                  itemName: 'Co',
                  itemDetails: '20',
                ),
                WietherItemsContainerWidget(
                  itemColor: Colors.green,
                  itemName: 'CO₂',
                  itemDetails: '20',
                ),
                WietherItemsContainerWidget(
                  itemColor: Color.fromARGB(220, 230, 83, 181),
                  itemName: 'O₂',
                  itemDetails: '20',
                ),
                WietherItemsContainerWidget(
                  itemColor: Colors.amberAccent,
                  itemName: 'Temperature',
                  itemDetails: '20',
                ),
                WietherItemsContainerWidget(
                  itemColor: Colors.teal,
                  itemName: 'Humidity',
                  itemDetails: '20',
                ),
                SizedBox(
                  width: 10,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}

class MonthsContainerWidget extends StatelessWidget {
  final num isCheck;
  final String containerName;
  final num containerId;
  const MonthsContainerWidget({
    super.key,
    required this.isCheck,
    required this.containerName,
    required this.containerId,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: containerId == isCheck
            ? Color.fromARGB(248, 128, 187, 60)
            : const Color.fromARGB(0, 141, 134, 134),
      ),
      child: Center(
        child: Text(
          containerName,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class WietherItemsContainerWidget extends StatelessWidget {
  final String itemName;
  final String itemDetails;
  final Color itemColor;
  const WietherItemsContainerWidget({
    super.key,
    required this.itemName,
    required this.itemColor,
    required this.itemDetails,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 110,
      margin: const EdgeInsets.only(
        left: 8,
      ),
      decoration: BoxDecoration(
        color: itemColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            itemName,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
          const SizedBox(
            height: 6,
          ),
          Text(
            itemDetails,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          )
        ],
      ),
    );
  }
}
