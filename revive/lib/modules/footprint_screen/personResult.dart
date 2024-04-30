import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:revive/layout/home_layout.dart';
import 'package:revive/modules/footprint_screen/cubit.dart';
import 'package:revive/modules/footprint_screen/state.dart';
import 'package:revive/shared/component/component.dart';
import 'package:revive/shared/network/local/shared_pref.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class FootprintPerson extends StatelessWidget {
  const FootprintPerson({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CarbonPersonCubit()
        ..carbonPerson(
          numPeople: sharedPref.getData(key: "numPeoplePerson"),
          SizeHouse: sharedPref.getData(key: "sizeHouse"),
          typeHouse: sharedPref.getData(key: "typeHouse"),
          electricityCons: sharedPref.getData(key: "elec"),
          cleanEnergy: sharedPref.getData(key: "cleanEn"),
          heatEnergy: sharedPref.getData(key: "HeatingEn"),
          intercityTrain: sharedPref.getData(key: "Train"),
          subway: sharedPref.getData(key: "Subway"),
          intercityBus: sharedPref.getData(key: "Bus"),
          cityBus: sharedPref.getData(key: "cityBus"),
          tram: sharedPref.getData(key: "Tram"),
          bike: sharedPref.getData(key: "Bike"),
          planeV: sharedPref.getData(key: "planeV"),
          planeL: sharedPref.getData(key: "planeL"),
          planeM: sharedPref.getData(key: "planeM"),
          planeS: sharedPref.getData(key: "planeS"),
          perDiet: sharedPref.getData(key: "perDiet"),
          localProduct: sharedPref.getData(key: "localProduct"),
          buyEnvComp: sharedPref.getData(key: "BuyEn"),
          eatOut: sharedPref.getData(key: "eatOut"),
        ),
      child: BlocConsumer<CarbonPersonCubit, CarbonPersonStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return state is carbonPersonSuccessState
              ? Scaffold(
                  appBar: AppBar(
                    leading: IconButton(
                      onPressed: () {
                        navigateAndFinish(
                          context,
                          HomeLayout(
                            index: 0,
                          ),
                        );
                      },
                      icon: Icon(Icons.arrow_back),
                    ),
                    title: Text(
                      "My Footprint",
                      style: TextStyle(fontFamily: "Title"),
                    ),
                    centerTitle: true,
                  ),
                  body: SingleChildScrollView(
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
                                        state.carbonPersonModel.pythonOutput
                                            .toString(),
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                          color: double.tryParse(state
                                                  .carbonPersonModel
                                                  .pythonOutput!)! > 2000
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
                                      value: double.tryParse(state
                                                  .carbonPersonModel
                                                  .pythonOutput!)! !=
                                              null
                                          ? double.tryParse(state
                                              .carbonPersonModel.pythonOutput!)!
                                          : 0,
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
                        ],
                      ),
                    ),
                  ),
                )
              : Center(
                  child: CircularProgressIndicator(
                  color: Colors.green,
                ));
        },
      ),
    );
  }
}
