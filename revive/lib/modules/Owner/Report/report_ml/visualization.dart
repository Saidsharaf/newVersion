import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:revive/modules/Owner/Report/cubitReport/cubit.dart';
import 'package:revive/modules/Owner/Report/cubitReport/state.dart';
import 'package:revive/shared/network/end_point.dart';

class Visualization extends StatefulWidget {
  Visualization({super.key});

  @override
  _VisualizationState createState() => _VisualizationState();
}

class _VisualizationState extends State<Visualization> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ReportFactoryCubit()..reportFactory(date: "a1"),
      child: BlocConsumer<ReportFactoryCubit,ReportFactoryStates>(
        listener: (context, state) {
          
        },
        builder: (context, state) {
          var cubit = ReportFactoryCubit.get(context);
          return state is reportFactorySuccessState
              ?  Scaffold(
          appBar: AppBar(),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 200,
                  width: double.infinity,
                  child: ClipRRect(
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Stack(
                          children: [
                            Container(
                              height: 200,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image:
                                      AssetImage('assets/images/visualization.jpg'),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(30),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color.fromARGB(70, 95, 248, 44),
                                    blurRadius: 50,
                                    // offset: Offset(0, 0),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 67),
                              child: Container(
                                height: 60,
                                width: 200,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(50),
                                    bottomRight: Radius.circular(50),
                                  ),
                                ),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 15),
                                    child: Text(
                                      'Visualization',
                                      style: TextStyle(
                                        color: Color.fromARGB(255, 96, 26, 102),
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, top: 16),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/images/icons8-python-375.png',
                          width: 45,
                          height: 40,
                        ),
                        SizedBox(width: 8),
                        Text(
                          'Icon Scatter plot Ml',
                          style: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Card(
                  elevation: 7.5,
                  child: Container(
                    height: 330,
                    width: 370,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(server+cubit.output[0]),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                // Align(
                //   alignment: Alignment.centerLeft,
                //   child: Padding(
                //     padding: const EdgeInsets.only(left: 20, top: 0),
                //     child: Row(
                //       children: [
                //         Image.asset(
                //           'assets/images/icons8-python-375.png',
                //           width: 45,
                //           height: 40,
                //         ),
                //         SizedBox(width: 8),
                //         Text(
                //           'Icon line plot Ml',
                //           style: TextStyle(
                //             color: Color.fromARGB(255, 0, 0, 0),
                //             fontSize: 18,
                //             fontWeight: FontWeight.w600,
                //           ),
                //         ),
                //       ],
                //     ),
                //   ),
                // ),
                // SizedBox(
                //   height: 15,
                // ),
                // Card(
                //   elevation: 7.5,
                //   child: Container(
                //     height: 330,
                //     width: 370,
                //     decoration: BoxDecoration(
                //       image: DecorationImage(
                //         image: AssetImage("assets/images/machine_background3.jpeg"),
                //         fit: BoxFit.cover,
                //       ),
                //       borderRadius: BorderRadius.circular(15),
                //       color: Colors.white,
                //     ),
                //   ),
                // ),
                // SizedBox(
                //   height: 60,
                // ),
              ],
            ),
          ),
        ) : Center(
                  child: CircularProgressIndicator(
                    color: Colors.green,
                  ),
                );
        },
        
      ),
    );
  }
}
