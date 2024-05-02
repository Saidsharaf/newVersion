import 'package:flutter/material.dart';
import 'package:revive/modules/Owner/machine_screen/machine_info_model.dart';
import 'package:revive/modules/Owner/machine_screen/single_machine.dart';
import 'package:revive/shared/component/component.dart';

// ignore: must_be_immutable
class Machine extends StatefulWidget {
  Machine({super.key});

  @override
  State<Machine> createState() => _MachineState();
}

class _MachineState extends State<Machine> {
  List<MachineInformation> items1 = [
    MachineInformation(
        machineImage: "assets/images/fci_1.jpeg",
        machineName: 'FCI',
        machinePlace: 'Menoufia'),
    MachineInformation(
        machineImage: "assets/images/fci_2.jpeg",
        machineName: 'FCI',
        machinePlace: 'Tanta'),
    MachineInformation(
        machineImage: "assets/images/fci_3.jpeg",
        machineName: 'FCI',
        machinePlace: 'Paris'),
  ];
  ////////////////
  List<MachineInformation> items2 = [
    MachineInformation(
        machineImage: "assets/images/factory_1.jpeg",
        machineName: 'Industry',
        machinePlace: 'Menoufia'),
    MachineInformation(
        machineImage: "assets/images/factory_2.jpeg",
        machineName: 'Industry',
        machinePlace: 'Tanta'),
    MachineInformation(
        machineImage: "assets/images/factory_3.jpeg",
        machineName: 'Industry',
        machinePlace: 'Paris'),
  ];

  List<MachineInformation> items3 = [
    MachineInformation(
        machineImage: "assets/images/greenhouse_1.jpeg",
        machineName: 'green house',
        machinePlace: 'Menoufia'),
    MachineInformation(
        machineImage: "assets/images/greenhouse_2.jpeg",
        machineName: 'green house',
        machinePlace: 'Tanta'),
    MachineInformation(
        machineImage: "assets/images/greenhouse_3.jpeg",
        machineName: 'green house',
        machinePlace: 'Paris'),
  ];
  List<MachineInformation> items4 = [
    MachineInformation(
        machineImage: "assets/images/tourism_1.jpeg",
        machineName: 'Tourism',
        machinePlace: 'Giza'),
    MachineInformation(
        machineImage: "assets/images/tourism_2.jpeg",
        machineName: 'Tourism',
        machinePlace: 'Alexandria'),
    MachineInformation(
        machineImage: "assets/images/tourism_3.jpeg",
        machineName: 'Tourism',
        machinePlace: 'Luxor'),
  ];

  List<MachineInformation> items5 = [
    MachineInformation(
        machineImage: "assets/images/weather_1.jpeg",
        machineName: 'Weather',
        machinePlace: 'Giza'),
    MachineInformation(
        machineImage: "assets/images/weather_2.jpeg",
        machineName: 'Weather',
        machinePlace: 'Alexandria'),
    MachineInformation(
        machineImage: "assets/images/weather_3.jpeg",
        machineName: 'Weather',
        machinePlace: 'Luxor'),
  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: 320,
            width: double.infinity,
            child: ClipRRect(
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    'assets/images/machine_background_1.jpg',
                    fit: BoxFit.fill,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 80),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      // child: Text(
                      //   'Hello in Revive ..',
                      //   style: TextStyle(fontSize: 25, color: Colors.black),
                      // ),
                    ),
                  ),
                ],
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(0),
                bottomRight: Radius.circular(0),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 20,
              bottom: 8,
              left: 8,
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    'Your Machines .',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 250,
            child: Row(
              children: [
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: BuildCardOne(
                        machineImage: items1[index].machineImage,
                        machineName: items1[index].machineName,
                        machinePlace: items1[index].machinePlace,
                      ),
                    ),
                    itemCount: items1.length,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 250,
            child: Row(
              children: [
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: BuildCardOne(
                        machineImage: items2[index].machineImage,
                        machineName: items2[index].machineName,
                        machinePlace: items2[index].machinePlace,
                      ),
                    ),
                    itemCount: items2.length,
                  ),
                ),
              ],
            ),
          ),
          /////
          SizedBox(
            height: 250,
            child: Row(
              children: [
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: BuildCardOne(
                        machineImage: items3[index].machineImage,
                        machineName: items3[index].machineName,
                        machinePlace: items3[index].machinePlace,
                      ),
                    ),
                    itemCount: items3.length,
                  ),
                ),
              ],
            ),
          ),

          SizedBox(
            height: 250,
            child: Row(
              children: [
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: BuildCardOne(
                        machineImage: items4[index].machineImage,
                        machineName: items4[index].machineName,
                        machinePlace: items4[index].machinePlace,
                      ),
                    ),
                    itemCount: items4.length,
                  ),
                ),
              ],
            ),
          ),

          SizedBox(
            height: 250,
            child: Row(
              children: [
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: BuildCardOne(
                        machineImage: items5[index].machineImage,
                        machineName: items5[index].machineName,
                        machinePlace: items5[index].machinePlace,
                      ),
                    ),
                    itemCount: items5.length,
                  ),
                ),
              ],
            ),
          ),

          // Padding(
          //   padding: const EdgeInsets.only(
          //     bottom: 46,
          //     left: 10,
          //     right: 10,
          //   ),
          //   child: Container(
          //     height: 200,
          //     width: double.infinity,
          //     decoration: BoxDecoration(
          //       color: Colors.white,
          //       borderRadius: BorderRadius.circular(20),
          //       boxShadow: [
          //         BoxShadow(
          //           color: Color.fromRGBO(38, 41, 37, 0.29),
          //           blurRadius: 1,
          //           offset: Offset(0, 1),
          //         ),
          //       ],
          //     ),
          //     child: Padding(
          //       padding: const EdgeInsets.all(30.0),
          //       child: Text(
          //         "You can order a new machine or check your old machine and see the temperature or carbon dioxide percentage on today’s date or the previous days. ",
          //         style: TextStyle(
          //           fontSize: 16,
          //           fontFamily: "Body",
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
          // Padding(
          //   padding: const EdgeInsets.only(bottom: 65),
          //   child: FloatingActionButton(
          //     onPressed: () {
          //       bottomSheet(context);
          //     },
          //     child: Icon(
          //       Icons.add,
          //       color: Colors.white,
          //       size: 29,
          //     ),
          //   ),
          // ),
          SizedBox(
            height: 60,
          ),
        ],
      ),
    );
  }
}

class BuildCardOne extends StatelessWidget {
  final String machineImage;
  final String machineName;
  final String machinePlace;
  const BuildCardOne({
    super.key,
    required this.machineImage,
    required this.machineName,
    required this.machinePlace,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        navigate(context, SingleMachine());
      },
      child: Card(
        elevation: 7.5,
        child: Container(
          height: 200,
          width: 155,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(machineImage), fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(12.5),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          machineName,
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.location_on,
                              color: Colors.white,
                            ),
                            SizedBox(width: 4),
                            Text(
                              machinePlace,
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
