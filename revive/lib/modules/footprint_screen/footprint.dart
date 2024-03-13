import 'package:flutter/material.dart';
import 'package:revive/modules/footprint_screen/questions.dart';
import 'package:revive/shared/component/appLocale.dart';
import 'package:revive/shared/component/component.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class Footprint extends StatefulWidget {
  const Footprint({super.key});

  @override
  State<Footprint> createState() => _FootprintState();
}

class _FootprintState extends State<Footprint> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.only(
          top: 17,
          right: 12,
          left: 12,
          bottom: 17,
        ),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(38, 41, 37, 0.29),
                    blurRadius: 15,
                    offset: Offset(0, 1),
                  ),
                ],
              ),
              padding: EdgeInsets.only(
                top: 20,
                right: 10,
                left: 10,
                bottom: 5,
              ),
              child: SfRadialGauge(
                axes: <RadialAxis>[
                  RadialAxis(
                    minimum: -1500,
                    maximum: 1500,
                    interval: 500,
                    annotations: [
                      GaugeAnnotation(
                        widget: Text(
                          "500",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            color: 500 > 0 ? Colors.green : Colors.red,
                          ),
                        ),
                        positionFactor: .5,
                        angle: 90,
                      ),
                    ],
                    pointers: const <GaugePointer>[
                      NeedlePointer(
                        value: 500,
                        enableAnimation: true,
                      ),
                    ],
                    ranges: [
                      GaugeRange(
                        startValue: 0,
                        endValue: 1500,
                        color: Colors.green,
                      ),
                      GaugeRange(
                        startValue: 0,
                        endValue: -500,
                        color: Colors.orange,
                      ),
                      GaugeRange(
                        startValue: -500,
                        endValue: -1500,
                        color: Colors.red,
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Container(
              height: 50,
              width: 300,
              decoration: BoxDecoration(
                color: Color.fromRGBO(106, 192, 66, 1),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(38, 41, 37, 0.29),
                    blurRadius: 15,
                    offset: Offset(0, 1),
                  ),
                ],
              ),
              child: MaterialButton(
                onPressed: () {
                  navigate(
                    context,Questions()
                  );
                },
                child: Text(
                  // "${getLang(context, "calculate")}",
                  "Calculate",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                  ),
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 180,
                    child: Image.asset(
                      "assets/images/happyEarth.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromRGBO(38, 41, 37, 0.29),
                          blurRadius: 1,
                          offset: Offset(0, 1),
                        ),
                      ],
                    ),
                    padding: EdgeInsets.only(
                        top: 18, left: 10, right: 10, bottom: 10),
                    child: Text(
                      "Well done ! You are offsetting 500 kgCO2",
                      style: TextStyle(
                        fontFamily: "Body",
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
