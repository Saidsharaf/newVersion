import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:revive/modules/footprint_screen/cubit.dart';
import 'package:revive/modules/footprint_screen/personResult.dart';
import 'package:revive/modules/footprint_screen/state.dart';
import 'package:revive/shared/component/component.dart';
import 'package:revive/shared/network/local/shared_pref.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class QuestionPersonModel {
  @required
  final IconData icon;
  @required
  final String text;
  @required
  final Widget con;

  QuestionPersonModel(this.icon, this.text, this.con);
}

List<String> answer1 = [
  "Vegan",
  "Vegeterian",
  "No special diet",
  "No red meat",
  "Big meat eater",
];
List<String> answer2 = [
  "yes",
  "no",
];
List<String> answer3 = [
  "Bike",
  "Car",
  "Bus",
  "Train / Underground",
  "Motorbike or Scooter",
  "On foot",
];
List<String> answer4 = [
  "Detached",
  "Semi detached",
  "Attached single family home",
  "Flat",
];
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
  "Meet in most meals",
  "Meat in some meals",
  "Meat very rarely/just fish",
  "Vegan",
  "Vegetarian",
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

var numPeopleController = TextEditingController();
var sizeHouseController = TextEditingController();
var electricityConsController = TextEditingController();
var cleanEnergyController = TextEditingController();
var intercityTrainController = TextEditingController();
var subwayController = TextEditingController();
var intercityBusController = TextEditingController();
var cityBusController = TextEditingController();
var tramController = TextEditingController();
var bikeController = TextEditingController();
var planeVeryLongController = TextEditingController();
var planeLongController = TextEditingController();
var planeMediumController = TextEditingController();
var planeShortController = TextEditingController();
var eatOutController = TextEditingController();

var pageController = PageController();
var formKey = GlobalKey<FormState>();

// ignore: must_be_immutable
class QuestionsPerson extends StatelessWidget {
  QuestionsPerson({super.key});


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CarbonPersonCubit(),
      child: BlocConsumer<CarbonPersonCubit, CarbonPersonStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = CarbonPersonCubit.get(context);
          List<QuestionPersonModel> model = [
            QuestionPersonModel(
              Icons.travel_explore_sharp,
              "Where is your country ?",
              buildDropDown(),
            ),
            QuestionPersonModel(
              Icons.family_restroom_outlined,
              "what is the number of people in the household ",
              textBuild(
                controller: numPeopleController,
                onChange: (value) {
                  if (formKey.currentState!.validate()) {
                    sharedPref.saveData(
                        key: "numPeoplePerson",
                        value: int.parse(numPeopleController.text));
                    print(sharedPref.getData(key: "numPeoplePerson").toString());
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
            QuestionPersonModel(
              Icons.mode_of_travel_sharp,
              "what is the size of housing (m2) ",
              textBuild(
                controller: sizeHouseController,
                onChange: (value) {
                  if (formKey.currentState!.validate()) {
                    sharedPref.saveData(
                        key: "sizeHouse",
                        value: int.parse(sizeHouseController.text));
                    print(sharedPref.getData(key: "sizeHouse").toString());
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
            QuestionPersonModel(
              Icons.house,
              "what is type of your house ",
              Expanded(
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) => btnkQuestions(
                    txt: answer4[index],
                    Selected: cubit.current5Index == index,
                    index: index,
                    onSelected: (value) {
                      // setState(() {
                      cubit.changePIndex5(value, index);
                      sharedPref.saveData(
                          key: "typeHouse",
                          value: answer4[cubit.current5Index]);
                      print(answer4[cubit.current5Index]);
                      //  });
                    },
                  ),
                  itemCount: answer4.length,
                ),
              ),
            ),
            QuestionPersonModel(
              Icons.electric_bolt_rounded,
              "what is your electricity consumption (KWh/month)",
              textBuild(
                controller: electricityConsController,
                onChange: (value) {
                  if (formKey.currentState!.validate()) {
                    sharedPref.saveData(
                        key: "elec",
                        value: int.parse(electricityConsController.text));
                    //print(sharedPref.getData(key: "numPeoplePerson").toString());
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
            QuestionPersonModel(
              Icons.electrical_services_rounded,
              "what is your percentage electricity from a clean energy source (%)",
              textBuild(
                controller: cleanEnergyController,
                onChange: (value) {
                  if (formKey.currentState!.validate()) {
                    sharedPref.saveData(
                        key: "cleanEn",
                        value: int.parse(cleanEnergyController.text));
                    //print(sharedPref.getData(key: "numPeoplePerson").toString());
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
            QuestionPersonModel(
              Icons.fireplace,
              "what is heating energy source",
              Expanded(
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) => btnkQuestions(
                    txt: answer5[index],
                    Selected: cubit.current4Index == index,
                    index: index,
                    onSelected: (value) {
                      // setState(() {
                      cubit.changePIndex4(value, index);
                      sharedPref.saveData(
                          key: "HeatingEn",
                          value: answer5[cubit.current4Index]);
                      print(answer5[cubit.current4Index]);
                      //  });
                    },
                  ),
                  itemCount: answer5.length,
                ),
              ),
            ),
            QuestionPersonModel(
              Icons.emoji_transportation,
              "Average hours per week traveled by all household members using :",
              Expanded(
                child: ListView(
                  physics: BouncingScrollPhysics(),
                  //shrinkWrap: true,
                  children: [
                    textBuild2(
                      text: "Intercity Train",
                      controller: intercityTrainController,
                      onChange: (value) {
                        // if (formKey.currentState!.validate()) {
                          sharedPref.saveData(
                              key: "Train",
                              value: int.parse(intercityTrainController.text));
                          print(sharedPref.getData(key: "Train"));
                        // }
                      },
                      // validate: (value) {
                      //   if (value!.isEmpty) {
                      //     return "The input must not be empty";
                      //   }
                      //   return null;
                      // },
                    ),
                    SizedBox(height: 10),
                    textBuild2(
                      text: "Subway",
                      controller: subwayController,
                      onChange: (value) {
                        // if (formKey.currentState!.validate()) {
                          sharedPref.saveData(
                              key: "Subway",
                              value: int.parse(subwayController.text));
                          print(sharedPref.getData(key: "Subway").toString());
                        // }
                      },
                      // validate: (value) {
                      //   if (value!.isEmpty) {
                      //     return "The input must not be empty";
                      //   }
                      //   return null;
                      // },
                    ),
                    SizedBox(height: 10),
                    textBuild2(
                      text: "Intercity Bus",
                      controller: intercityBusController,
                      onChange: (value) {
                        // if (formKey.currentState!.validate()) {
                          sharedPref.saveData(
                              key: "Bus",
                              value: int.parse(intercityBusController.text));
                          print(sharedPref.getData(key: "Bus").toString());
                        // }
                      },
                      // validate: (value) {
                      //   if (value!.isEmpty) {
                      //     return "The input must not be empty";
                      //   }
                      //   return null;
                      // },
                    ),
                    SizedBox(height: 10),
                    textBuild2(
                      text: "City Bus",
                      controller: cityBusController,
                      onChange: (value) {
                        // if (formKey.currentState!.validate()) {
                          sharedPref.saveData(
                              key: "cityBus",
                              value: int.parse(cityBusController.text));
                          print(sharedPref.getData(key: "cityBus").toString());
                        // }
                      },
                      // validate: (value) {
                      //   if (value!.isEmpty) {
                      //     return "The input must not be empty";
                      //   }
                      //   return null;
                      // },
                    ),
                    SizedBox(height: 10),
                    textBuild2(
                      text: "Tram",
                      controller: tramController,
                      onChange: (value) {
                        // if (formKey.currentState!.validate()) {
                          sharedPref.saveData(
                              key: "Tram",
                              value: int.parse(tramController.text));
                          //print(sharedPref.getData(key: "numPeoplePerson").toString());
                        // }
                      },
                      // validate: (value) {
                      //   if (value!.isEmpty) {
                      //     return "The input must not be empty";
                      //   }
                      //   return null;
                      // },
                    ),
                    SizedBox(height: 10),
                    textBuild2(
                      text: "Bike/walk",
                      controller: bikeController,
                      onChange: (value) {
                        // if (formKey.currentState!.validate()) {
                          sharedPref.saveData(
                              key: "Bike",
                              value: int.parse(bikeController.text));
                          print(sharedPref.getData(key: "Bike").toString());
                        // }
                      },
                      // validate: (value) {
                      //   if (value!.isEmpty) {
                      //     return "The input must not be empty";
                      //   }
                      //   return null;
                      // },
                    ),
                  ],
                ),
              ),
            ),
            QuestionPersonModel(
              Icons.flight_takeoff_outlined,
              "private flights per year for all household member :",
              Expanded(
                child: ListView(
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  children: [
                    textBuild2(
                      text: "Very long range",
                      controller: planeVeryLongController,
                      onChange: (value) {
                        // if (formKey.currentState!.validate()) {
                          sharedPref.saveData(
                              key: "planeV",
                              value: int.parse(planeVeryLongController.text));
                          //print(sharedPref.getData(key: "numPeoplePerson").toString());
                        // }
                      },
                      // validate: (value) {
                      //   if (value!.isEmpty) {
                      //     return "The input must not be empty";
                      //   }
                      //   return null;
                      // },
                    ),
                    SizedBox(height: 10),
                    textBuild2(
                      text: "Long range",
                      controller: planeLongController,
                      onChange: (value) {
                        // if (formKey.currentState!.validate()) {
                          sharedPref.saveData(
                              key: "planeL",
                              value: int.parse(planeLongController.text));
                          //print(sharedPref.getData(key: "numPeoplePerson").toString());
                        // }
                      },
                      // validate: (value) {
                      //   if (value!.isEmpty) {
                      //     return "The input must not be empty";
                      //   }
                      //   return null;
                      // },
                    ),
                    SizedBox(height: 10),
                    textBuild2(
                      text: "Medium range",
                      controller: planeMediumController,
                      onChange: (value) {
                        // if (formKey.currentState!.validate()) {
                          sharedPref.saveData(
                              key: "planeM",
                              value: int.parse(planeMediumController.text));
                          //print(sharedPref.getData(key: "numPeoplePerson").toString());
                        // }
                      },
                      // validate: (value) {
                      //   if (value!.isEmpty) {
                      //     return "The input must not be empty";
                      //   }
                      //   return null;
                      // },
                    ),
                    SizedBox(height: 10),
                    textBuild2(
                      text: "Short range",
                      controller: planeShortController,
                      onChange: (value) {
                        // if (formKey.currentState!.validate()) {
                          sharedPref.saveData(
                              key: "planeS",
                              value: int.parse(planeShortController.text));
                          //print(sharedPref.getData(key: "numPeoplePerson").toString());
                        // }
                      },
                      // validate: (value) {
                      //   if (value!.isEmpty) {
                      //     return "The input must not be empty";
                      //   }
                      //   return null;
                      // },
                    ),
                  ],
                ),
              ),
            ),
            QuestionPersonModel(
              Icons.dining,
              "what is your household preferred diet",
              Expanded(
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) => btnkQuestions(
                    txt: answer6[index],
                    Selected: cubit.current3Index == index,
                    index: index,
                    onSelected: (value) {
                      // setState(() {
                      cubit.changePIndex3(value, index);
                      sharedPref.saveData(
                          key: "perDiet", value: answer6[cubit.current3Index]);
                      print(answer6[cubit.current3Index]);
                      //  });
                    },
                  ),
                  itemCount: answer6.length,
                ),
              ),
            ),
            QuestionPersonModel(
              Icons.shopping_cart_rounded,
              "Do you buy mostly local products ?",
              Expanded(
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) => btnkQuestions(
                    txt: answer8[index],
                    Selected: cubit.current2Index == index,
                    index: index,
                    onSelected: (value) {
                      cubit.changePIndex2(value, index);
                      sharedPref.saveData(
                          key: "localProduct",
                          value: answer8[cubit.current2Index]);
                      print(answer8[cubit.current2Index]);
                      //  });
                    },
                  ),
                  itemCount: answer7.length,
                ),
              ),
            ),
            QuestionPersonModel(
              Icons.business_outlined,
              "Do you buy from environmentally responsible companies ?",
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
                      cubit.changePIndex1(value, index);
                      sharedPref.saveData(
                          key: "BuyEn", value: answer7[cubit.currentIndex]);
                      print(answer7[cubit.currentIndex]);
                      //  });
                    },
                  ),
                  itemCount: answer7.length,
                ),
              ),
            ),
            QuestionPersonModel(
              Icons.no_food_outlined,
              "How many times a week does your family eat out ?",
              textBuild(
                controller: eatOutController,
                onChange: (value) {
                  if (formKey.currentState!.validate()) {
                    sharedPref.saveData(
                        key: "eatOut", value: int.parse(eatOutController.text));
                    //print(sharedPref.getData(key: "numPeoplePerson").toString());
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
                              navigateAndFinish(context, FootprintPerson());}
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

  Widget questionBuild(QuestionPersonModel model) {
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
              height: 30,
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
              height: 60,
            ),
            model.con,
          ],
        ),
      ),
    );
  }
}
