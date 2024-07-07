import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:revive/modules/Owner/machine_screen/machine_info_model.dart';
import 'package:revive/modules/Owner/machine_screen/single_machine.dart';
import 'package:revive/modules/Owner/tourism_screen/cubit/cubit.dart';
import 'package:revive/modules/Owner/tourism_screen/cubit/state.dart';
import 'package:revive/shared/component/component.dart';

// ignore: must_be_immutable
class Tourism extends StatefulWidget {
  Tourism({super.key});

  @override
  State<Tourism> createState() => _MachineState();
}

class _MachineState extends State<Tourism> {
  List<MachineInformation> items1 = [
    MachineInformation(
        machineImage: "assets/images/tourism_1.jpeg",
        machineName: 'Tourism',
        machinePlace: 'Giza'),
    MachineInformation(
        machineImage: "assets/images/tourism_1.jpeg",
        machineName: 'Tourism',
        machinePlace: 'Alexandria'),
    MachineInformation(
        machineImage: "assets/images/tourism_1.jpeg",
        machineName: 'Tourism',
        machinePlace: 'Luxor'),
  ];
  List<MachineInformation> items2 = [
    MachineInformation(
        machineImage: "assets/images/weather_1.jpeg",
        machineName: 'coastal',
        machinePlace: 'Giza'),
    MachineInformation(
        machineImage: "assets/images/weather_1.jpeg",
        machineName: 'coastal',
        machinePlace: 'Alexandria'),
    MachineInformation(
        machineImage: "assets/images/weather_1.jpeg",
        machineName: 'coastal',
        machinePlace: 'Luxor'),
  ];

  List<MachineInformation> items3 = [
    MachineInformation(
        machineImage: "assets/images/fci_1.jpeg",
        machineName: 'FCI',
        machinePlace: 'Menoufia'),
    MachineInformation(
        machineImage: "assets/images/fci_1.jpeg",
        machineName: 'FCI',
        machinePlace: 'Tanta'),
    MachineInformation(
        machineImage: "assets/images/fci_1.jpeg",
        machineName: 'FCI',
        machinePlace: 'Paris'),
  ];
  ////////////////

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TourismCubit()..showTourism(),
      child: BlocConsumer<TourismCubit, TourismStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return state is tourismSuccessState
              ? Scaffold(
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
                                      height: 150,
                                      decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                            255, 75, 189, 78),
                                        borderRadius: BorderRadius.only(
                                          bottomRight: Radius.circular(30),
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color:
                                                Color.fromARGB(70, 95, 248, 44),
                                            blurRadius: 50,
                                            //offset: Offset(0, 0),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 32),
                                      child: Container(
                                        height: 85,
                                        width: 290,
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
                                            padding:
                                                const EdgeInsets.only(left: 30),
                                            child: Text(
                                              'Tourism Area',
                                              style: TextStyle(
                                                color: Colors.green,
                                                fontSize: 25,
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
                            padding: const EdgeInsets.only(
                              left: 20,
                              top:
                                  0, // Adjust this value to make the space smaller
                            ),
                            child: Text(
                              'Tourism:',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 34, 33, 33),
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600),
                            ),
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
                        /////
                        ///
                        ///

                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 20,
                              top: 16,
                            ),
                            child: Text(
                              'Coastal:',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 34, 33, 33),
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600),
                            ),
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

                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 20,
                              top: 16,
                            ),
                            child: Text(
                              'Fci:',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 34, 33, 33),
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600),
                            ),
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
                          height: 60,
                        ),
                      ],
                    ),
                  ),
                )
              : Center(
                  child: CircularProgressIndicator(
                    color: Colors.green,
                  ),
                );
        },
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
