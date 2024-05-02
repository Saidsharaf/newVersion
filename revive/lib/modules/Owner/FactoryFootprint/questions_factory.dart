import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:revive/layout/home_layout.dart';
import 'package:revive/modules/Owner/FactoryFootprint/cubit.dart';
import 'package:revive/modules/Owner/FactoryFootprint/state.dart';
import 'package:revive/shared/component/component.dart';
import 'package:revive/shared/network/local/shared_pref.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class QuestionModel {
  @required
  final IconData icon;
  @required
  final String text;
  @required
  final Widget con;

  QuestionModel(this.icon, this.text, this.con);
}

List<String> answer5 = [
  "Coal",
  "Natural Gas",
  "Wood",
  "Heating oil",
  "Electricity",
  "Peat",
  "Vegetable oil",
  "Charcoal",
  "No heating",
];
List<String> answer6 = [
  "Recycle food",
  "Recycle paper",
  "Recycle tin cans",
  "Recycle plastic",
  "Recycle glass",
];
List<String> answer7 = [
  "Always",
  "Sometimes",
  "I'm not considering this option",
];
List<String> answer8 = [
  "Always",
  "Sometimes",
  "I'm not considering this option",
];
List<String> answer9 = [
  "Plastic",
  "Glass",
  "Tin cans",
  "Food",
  "Paper",
];

var numPeopleController = TextEditingController();
var electricityConsController = TextEditingController();
var cleanEnergyController = TextEditingController();
var numCarsController = TextEditingController();
var factSizeController = TextEditingController();

//  "num_people"               : "20",     // int
//         "electricity_cons"         : "222",    // int
//         "Clean_energy"             : "222",    // int
//         "Num_cars"                 : "29",     // int
//         "Fact_size"                : "222",
var formKey = GlobalKey<FormState>();
var pageController = PageController();
bool isSelected = false;
//int currentIndex = 0;
int current2Index = 0;
int current3Index = 0;
int current4Index = 0;

// ignore: must_be_immutable
class QuestionsFactory extends StatelessWidget {
  QuestionsFactory({Key? key}) : super(key: key);

  // List<QuestionModel> model = [
  //   QuestionModel(
  //     Icons.travel_explore_sharp,
  //     "Where is your factory ?",
  //     buildDropDown(),
  //   ),
  //   QuestionModel(
  //     Icons.family_restroom_outlined,
  //     "what is the number of people in the factory ",
  //     textBuild(
  //       controller: numPeopleController,
  //       onSubmit: (value) {
  //         if (formKey.currentState!.validate()) {
  //           pageController.nextPage(
  //               duration: Duration(milliseconds: 500),
  //               curve: Curves.easeInOutQuint);
  //         }
  //       },
  //       validate: (value) {
  //         if (value!.isEmpty) {
  //           return "The input must not be empty";
  //         }
  //         return null;
  //       },
  //     ),
  //   ),
  //   QuestionModel(
  //     Icons.electric_bolt_rounded,
  //     "what is the factory electricity consumption (KWh/month)",
  //     textBuild(
  //       controller: electricityConsController,
  //       onSubmit: (value) {
  //         if (formKey.currentState!.validate()) {
  //           pageController.nextPage(
  //               duration: Duration(milliseconds: 500),
  //               curve: Curves.easeInOutQuint);
  //         }
  //       },
  //       validate: (value) {
  //         if (value!.isEmpty) {
  //           return "The input must not be empty";
  //         }
  //         return null;
  //       },
  //     ),
  //   ),
  //   QuestionModel(
  //     Icons.electrical_services_rounded,
  //     "what is the factory percentage electricity from a clean energy source (%)",
  //     textBuild(
  //       controller: cleanEnergyController,
  //       onSubmit: (value) {
  //         if (formKey.currentState!.validate()) {
  //           pageController.nextPage(
  //               duration: Duration(milliseconds: 500),
  //               curve: Curves.easeInOutQuint);
  //         }
  //       },
  //       validate: (value) {
  //         if (value!.isEmpty) {
  //           return "The input must not be empty";
  //         }
  //         return null;
  //       },
  //     ),
  //   ),
  //   QuestionModel(
  //     Icons.car_repair,
  //     "How many numbers of cars",
  //     textBuild(
  //       controller: numCarsController,
  //       onSubmit: (value) {
  //         if (formKey.currentState!.validate()) {
  //           pageController.nextPage(
  //               duration: Duration(milliseconds: 500),
  //               curve: Curves.easeInOutQuint);
  //         }
  //       },
  //       validate: (value) {
  //         if (value!.isEmpty) {
  //           return "The input must not be empty";
  //         }
  //         return null;
  //       },
  //     ),
  //   ),
  //   QuestionModel(
  //     Icons.mode_of_travel_sharp,
  //     "What is the size of factory ?",
  //     textBuild(
  //       controller: factSizeController,
  //       onSubmit: (value) {
  //         if (formKey.currentState!.validate()) {
  //           pageController.nextPage(
  //               duration: Duration(milliseconds: 500),
  //               curve: Curves.easeInOutQuint);
  //         }
  //       },
  //       validate: (value) {
  //         if (value!.isEmpty) {
  //           return "The input must not be empty";
  //         }
  //         return null;
  //       },
  //     ),
  //   ),
  //   QuestionModel(
  //     Icons.shopping_cart_sharp,
  //     "Does the factory use local products ?",
  //     Expanded(
  //       child: ListView.builder(
  //         physics: BouncingScrollPhysics(),
  //         shrinkWrap: true,
  //         itemBuilder: (context, index) => btnkQuestions(
  //           txt: answer7[index],
  //           Selected: isSelected,
  //           onSelected: (value) {
  //             isSelected = value;
  //           },
  //         ),
  //         itemCount: answer7.length,
  //       ),
  //     ),
  //   ),
  //   QuestionModel(
  //     Icons.energy_savings_leaf_rounded,
  //     "Does the factory buy environmentally products ? ",
  //     Expanded(
  //       child: ListView.builder(
  //         physics: BouncingScrollPhysics(),
  //         shrinkWrap: true,
  //         itemBuilder: (context, index) => btnQuestions(txt: answer7[index]),
  //         itemCount: answer7.length,
  //       ),
  //     ),
  //   ),
  //   QuestionModel(
  //     Icons.warning_outlined,
  //     "How do you handle waste ?",
  //     Expanded(
  //       child: ListView.builder(
  //         physics: BouncingScrollPhysics(),
  //         shrinkWrap: true,
  //         itemBuilder: (context, index) => btnQuestions(txt: answer7[index]),
  //         itemCount: answer7.length,
  //       ),
  //     ),
  //   ),
  //   QuestionModel(
  //     Icons.fireplace,
  //     "what is heating energy source",
  //     Expanded(
  //       child: ListView.builder(
  //         physics: BouncingScrollPhysics(),
  //         shrinkWrap: true,
  //         itemBuilder: (context, index) => btnQuestions(txt: answer5[index]),
  //         itemCount: answer5.length,
  //       ),
  //     ),
  //   ),
  // ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CarbonFactoryCubit(),
      child: BlocConsumer<CarbonFactoryCubit, CarbonFactoryStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = CarbonFactoryCubit.get(context);
          List<QuestionModel> model = [
            QuestionModel(
              Icons.travel_explore_sharp,
              "Where is your factory ?",
              buildDropDown(),
            ),
            QuestionModel(
              Icons.family_restroom_outlined,
              "what is the number of people in the factory ",
              textBuild(
                controller: numPeopleController,
                onChange: (value) {
                  if (formKey.currentState!.validate()) {
                    sharedPref.saveData(
                        key: "numPeople",
                        value: int.parse(numPeopleController.text));
                    //print(numPeopleController.text);
                    print(sharedPref.getData(key: "numPeople").toString());
                    // cubit.carbonFactory(numPeople: sharedPref.getData(key: "numPeople"));
                    // pageController.nextPage(
                    //     duration: Duration(milliseconds: 500),
                    //     curve: Curves.easeInOutQuint);
                  }
                },
                validate: (value) {
                  if (value!.isEmpty) {
                    return "The input must not be empty";
                  }
                  return null;
                },
              ),
            ),
            QuestionModel(
              Icons.electric_bolt_rounded,
              "what is the factory electricity consumption (KWh/month)",
              textBuild(
                controller: electricityConsController,
                onChange: (value) {
                  if (formKey.currentState!.validate()) {
                    sharedPref.saveData(
                        key: "electricityCons",
                        value: int.parse(electricityConsController.text));
                    // cubit.carbonFactory(electricityCons: sharedPref.getData(key: "electricityCons"));
                    // pageController.nextPage(
                    //     duration: Duration(milliseconds: 500),
                    //     curve: Curves.easeInOutQuint);
                  }
                },
                validate: (value) {
                  if (value!.isEmpty) {
                    return "The input must not be empty";
                  }
                  return null;
                },
              ),
            ),
            QuestionModel(
              Icons.electrical_services_rounded,
              "what is the factory percentage electricity from a clean energy source (%)",
              textBuild(
                controller: cleanEnergyController,
                onChange: (value) {
                  if (formKey.currentState!.validate()) {
                    sharedPref.saveData(
                        key: "cleanEnergy",
                        value: int.parse(cleanEnergyController.text));
                    // cubit.carbonFactory(cleanEnergy: sharedPref.getData(key: "cleanEnergy"));
                    // pageController.nextPage(
                    //     duration: Duration(milliseconds: 500),
                    //     curve: Curves.easeInOutQuint);
                  }
                },
                validate: (value) {
                  if (value!.isEmpty) {
                    return "The input must not be empty";
                  }
                  return null;
                },
              ),
            ),
            QuestionModel(
              Icons.car_repair,
              "How many numbers of cars",
              textBuild(
                controller: numCarsController,
                onChange: (value) {
                  if (formKey.currentState!.validate()) {
                    sharedPref.saveData(
                        key: "numCars",
                        value: int.parse(numCarsController.text));
                    // cubit.carbonFactory(numCars: sharedPref.getData(key: "numCars"));
                    // pageController.nextPage(
                    //     duration: Duration(milliseconds: 500),
                    //     curve: Curves.easeInOutQuint);
                  }
                },
                validate: (value) {
                  if (value!.isEmpty) {
                    return "The input must not be empty";
                  }
                  return null;
                },
              ),
            ),
            QuestionModel(
              Icons.mode_of_travel_sharp,
              "What is the size of factory ?",
              textBuild(
                controller: factSizeController,
                onChange: (value) {
                  if (formKey.currentState!.validate()) {
                    sharedPref.saveData(
                        key: "factSize",
                        value: int.parse(factSizeController.text));
                    // cubit.carbonFactory(
                    //   factSize: sharedPref.getData(key: "factSize"),
                    //   numPeople: sharedPref.getData(key: "numPeople"),
                    //   electricityCons:
                    //       sharedPref.getData(key: "electricityCons"),
                    //   cleanEnergy: sharedPref.getData(key: "cleanEnergy"),
                    //   numCars: sharedPref.getData(key: "numCars"),
                    // );
                    // pageController.nextPage(
                    //     duration: Duration(milliseconds: 500),
                    //     curve: Curves.easeInOutQuint);
                  }
                },
                validate: (value) {
                  if (value!.isEmpty) {
                    return "The input must not be empty";
                  }
                  return null;
                },
              ),
            ),
            QuestionModel(
              Icons.shopping_cart_sharp,
              "Does the factory use local products ?",
              Expanded(
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) => btnkQuestions(
                    txt: answer7[index],
                    Selected: cubit.currentIndex == index,
                    index: index,
                    onSelected: (value) {
                      // setState(() {
                      cubit.changeIndex1(value, index);
                      sharedPref.saveData(
                          key: "localProducts",
                          value: answer7[cubit.currentIndex]);
                      print(answer7[cubit.currentIndex]);
                      //  });
                    },
                  ),
                  itemCount: answer7.length,
                ),
              ),
            ),
            QuestionModel(
              Icons.energy_savings_leaf_rounded,
              "Does the factory buy environmentally products ? ",
              Expanded(
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) => btnkQuestions(
                    txt: answer7[index],
                    Selected: cubit.current2Index == index,
                    onSelected: (value) {
                      // setState(() {
                      //   current2Index = value ? index : 0;
                      //   print(answer7[current2Index]);
                      // });

                      cubit.changeIndex2(value, index);
                      sharedPref.saveData(
                          key: "buyEnv", value: answer8[cubit.current2Index]);
                      print(answer8[cubit.current2Index]);
                    },
                  ),
                  itemCount: answer7.length,
                ),
              ),
            ),
            QuestionModel(
              Icons.warning_outlined,
              "How do you handle waste ?",
              Expanded(
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) => btnkQuestions(
                    txt: answer9[index],
                    Selected: cubit.current3Index == index,
                    onSelected: (value) {
                      // setState(() {
                      //   current3Index = value ? index : 0;
                      cubit.changeIndex3(value, index);
                      sharedPref.saveData(
                          key: "handleWaste",
                          value: answer9[cubit.current3Index]);
                      print(answer9[cubit.current3Index]);
                      // });
                    },
                  ),
                  itemCount: answer7.length,
                ),
              ),
            ),
            QuestionModel(
              Icons.fireplace,
              "what is heating energy source",
              Expanded(
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) => btnkQuestions(
                    txt: answer5[index],
                    Selected: cubit.current4Index == index,
                    onSelected: (value) {
                      // setState(() {
                      //   current4Index = value ? index : 0;
                      //   print(answer5[current4Index]);
                      // });

                      cubit.changeIndex4(value, index);
                      sharedPref.saveData(
                          key: "heating", value: answer5[cubit.current4Index]);
                      print(answer5[cubit.current4Index]);
                    },
                  ),
                  itemCount: answer5.length,
                ),
              ),
            ),
          ];

          return Scaffold(
            backgroundColor: Colors.grey[100],
            appBar: AppBar(),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    Expanded(
                      child: PageView.builder(
                        scrollDirection: Axis.vertical,
                        controller: pageController,
                        onPageChanged: (value) {
                          if (value == model.length - 1) {
                            cubit.isLast = true;
                          } else {
                            cubit.isLast = false;
                          }
                        },
                        itemBuilder: (context, index) =>
                            questionBuild(model[index]),
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: model.length,
                      ),
                    ),
                    Row(
                      children: [
                        SmoothPageIndicator(
                          controller: pageController,
                          count: model.length,
                          effect: ExpandingDotsEffect(
                            dotColor: Colors.grey,
                            activeDotColor: Colors.green,
                            dotHeight: 10,
                            dotWidth: 10,
                            expansionFactor: 4,
                          ),
                        ),
                        Spacer(),
                        FloatingActionButton(
                          onPressed: () {
                            if (cubit.isLast) {
                              if (formKey.currentState!.validate()) {
                                // cubit.carbonFactory(
                                //   factSize: sharedPref.getData(key: "factSize"),
                                //   numPeople:
                                //       sharedPref.getData(key: "numPeople"),
                                //   electricityCons: sharedPref.getData(
                                //       key: "electricityCons"),
                                //   cleanEnergy:
                                //       sharedPref.getData(key: "cleanEnergy"),
                                //   numCars: sharedPref.getData(key: "numCars"),
                                //   localProduct:
                                //       sharedPref.getData(key: "localProducts"),
                                //   buyEnvComp: sharedPref.getData(key: "buyEnv"),
                                //   handleWaste:
                                //       sharedPref.getData(key: "handleWaste"),
                                //   heating: sharedPref.getData(key: "heating"),
                                // );
                                navigateAndFinish(
                                    context,
                                    HomeLayout(
                                      index: 0,
                                    ));
                              }
                            } else {
                              if (formKey.currentState!.validate()) {
                                pageController.nextPage(
                                    duration: Duration(milliseconds: 500),
                                    curve: Curves.easeInOutQuint);
                              }
                            }
                          },
                          child: Icon(
                            Icons.keyboard_arrow_down,
                            color: Colors.white,
                            size: 40,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget questionBuild(QuestionModel model) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(right: 10, left: 10, top: 20),
        child: Column(
          children: [
            Icon(
              model.icon,
              color: Colors.green,
              size: 90,
            ),
            SizedBox(
              height: 25,
            ),
            Text(
              "${model.text}",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15.4,
                fontFamily: "Body",
              ),
            ),
            SizedBox(
              height: 50,
            ),
            model.con,
          ],
        ),
      ),
    );
  }
}
