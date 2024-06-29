import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:revive/modules/Owner/FactoryFootprint/cubit.dart';
import 'package:revive/modules/Owner/FactoryFootprint/state.dart';
import 'package:revive/modules/footprint_screen/questions.dart';
import 'package:revive/shared/component/component.dart';
import 'package:revive/shared/network/local/shared_pref.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class Footprint extends StatelessWidget {
  const Footprint({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CarbonFactoryCubit()
        ..carbonFactory(
          factSize: sharedPref.getData(key: "factSize"),
          numPeople: sharedPref.getData(key: "numPeople"),
          electricityCons: sharedPref.getData(key: "electricityCons"),
          cleanEnergy: sharedPref.getData(key: "cleanEnergy"),
          numCars: sharedPref.getData(key: "numCars"),
          localProduct: sharedPref.getData(key: "localProducts"),
          buyEnvComp: sharedPref.getData(key: "buyEnv"),
          handleWaste: sharedPref.getData(key: "handleWaste"),
          heating: sharedPref.getData(key: "heating"),
        ),
      child: BlocConsumer<CarbonFactoryCubit, CarbonFactoryStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return ConditionalBuilder(
            condition: state is carbonFactorySuccessState,
            builder: (context) {
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
                              minimum: 0,
                              maximum: 80000,
                              interval: 10000,
                              annotations: [
                                GaugeAnnotation(
                                  widget: Text(
                                    context
                                        .read<CarbonFactoryCubit>()
                                        .carbon[2],
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      color: double.tryParse(context
                                                  .read<CarbonFactoryCubit>()
                                                  .carbon[2])! >
                                              4000
                                          ? Colors.red
                                          : Colors.green,
                                    ),
                                  ),
                                  positionFactor: .5,
                                  angle: 90,
                                ),
                              ],
                              pointers: <GaugePointer>[
                                NeedlePointer(
                                  value: double.tryParse(context
                                      .read<CarbonFactoryCubit>()
                                      .carbon[2])!,
                                  enableAnimation: true,
                                ),
                              ],
                              ranges: [
                                GaugeRange(
                                  startValue: 0,
                                  endValue: 1000,
                                  color: Colors.green,
                                ),
                                GaugeRange(
                                  startValue: 1000,
                                  endValue: 4000,
                                  color: Colors.orange,
                                ),
                                GaugeRange(
                                  startValue: 4000,
                                  endValue: 80000,
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
                            navigate(context, QuestionsPerson());
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
                    SizedBox(height: 25,),
                      Container(
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
                                context
                                                  .read<CarbonFactoryCubit>()
                                                  .carbon[1],
                                style: TextStyle(
                                  fontFamily: "Body",
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
                                "Well done ! You are offsetting ${double.tryParse( context
                                                  .read<CarbonFactoryCubit>()
                                                  .carbon[2])!.round()} kgCO2",
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
            },
            fallback: (context) => Center(
                child: CircularProgressIndicator(
              color: Colors.green,
            )),
          );
        },
      ),
    );
  }
}
