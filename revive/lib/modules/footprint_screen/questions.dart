import 'package:flutter/material.dart';
import 'package:revive/layout/home_layout.dart';
import 'package:revive/shared/component/component.dart';
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

// ignore: must_be_immutable
class Questions extends StatefulWidget {
  Questions({super.key});

  @override
  State<Questions> createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> {
  List<QuestionModel> model = [


    QuestionModel(
      Icons.family_restroom_outlined,
      "what is the number of people in the household ",
      textBuild(),
    ),
    QuestionModel(
      Icons.travel_explore_sharp,
      "Where is your country ?",
      buildDropDown(),
    ),
    QuestionModel(
      Icons.mode_of_travel_sharp,
      "what is the size of housing (m2) ",
      textBuild(),
    ),
    QuestionModel(
      Icons.house,
      "what is type of your house ",
      Expanded(
        child: ListView.builder(
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) => btnQuestions(txt: answer4[index]),
          itemCount: answer4.length,
        ),
      ),
    ),

    QuestionModel(
      Icons.electric_bolt_rounded,
      "what is your electricity consumption (KWh/month)",
      textBuild(),
    ),
    QuestionModel(
      Icons.electrical_services_rounded,
      "what is your percentage electricity from a clean energy source (%)",
      textBuild(),
    ),
    QuestionModel(
      Icons.fireplace,
      "what is heating energy source",
      Expanded(
        child: ListView.builder(
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) => btnQuestions(txt: answer5[index]),
          itemCount: answer5.length,
        ),
      ),
    ),
    QuestionModel(
      Icons.emoji_transportation,
      "Average hours per week traveled by all household members using :",
      Expanded(
        child: ListView(
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
          children: [
            textBuild2(text: "Intercity Train"),
            SizedBox(height: 10),
            textBuild2(text: "Subway"),
            SizedBox(height: 10),
            textBuild2(text: "Intercity Bus"),
            SizedBox(height: 10),
            textBuild2(text: "City Bus"),
            SizedBox(height: 10),
            textBuild2(text: "Tram"),
            SizedBox(height: 10),
            textBuild2(text: "Bike/walk"),
          ],
        ),
      ),
    ),
    QuestionModel(
      Icons.flight_takeoff_outlined,
      "private flights per year for all household member :",
      Expanded(
        child: ListView(
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
          children: [
            textBuild2(text: "Very long range"),
            SizedBox(height: 10),
            textBuild2(text: "Long range"),
            SizedBox(height: 10),
            textBuild2(text: "Medium range"),
            SizedBox(height: 10),
            textBuild2(text: "Short range"),
          ],
        ),
      ),
    ),
    QuestionModel(
      Icons.dining,
      "what is your household preferred diet",
      Expanded(
        child: ListView.builder(
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) => btnQuestions(txt: answer6[index]),
          itemCount: answer6.length,
        ),
      ),
    ),
    QuestionModel(
      Icons.shopping_cart_rounded,
      "Do you buy mostly local products ?",
      Expanded(
        child: ListView.builder(
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) => btnQuestions(txt: answer7[index]),
          itemCount: answer7.length,
        ),
      ),
    ),
    QuestionModel(
      Icons.business_outlined,
      "Do you buy from environmentally responsible companies ?",
      Expanded(
        child: ListView.builder(
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) => btnQuestions(txt: answer7[index]),
          itemCount: answer7.length,
        ),
      ),
    ),
  ];

  var pageController = PageController();

  bool isLast = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: pageController,
                onPageChanged: (value) {
                  if (value == model.length - 1) {
                    setState(() {
                      isLast = true;
                    });
                  } else {
                    setState(() {
                      isLast = false;
                    });
                  }
                },
                itemBuilder: (context, index) => questionBuild(model[index]),
                physics: BouncingScrollPhysics(),
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
                    if (isLast) {
                      navigateAndFinish(
                          context,
                          HomeLayout(
                            index: 0,
                          ));
                    } else {
                      pageController.nextPage(
                          duration: Duration(milliseconds: 500),
                          curve: Curves.easeInOutQuint);
                    }
                  },
                  child: Icon(
                    Icons.arrow_forward_ios_sharp,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
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
