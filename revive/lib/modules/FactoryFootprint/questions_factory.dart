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

// ignore: must_be_immutable
class QuestionsFactory extends StatefulWidget {
  QuestionsFactory({super.key});

  @override
  State<QuestionsFactory> createState() => _QuestionsState();
}

class _QuestionsState extends State<QuestionsFactory> {
  List<QuestionModel> model = [
    QuestionModel(
      Icons.travel_explore_sharp,
      "Where is your factory ?",
      buildDropDown(),
    ),
    QuestionModel(
      Icons.family_restroom_outlined,
      "what is the number of people in the factory ",
      textBuild(),
    ),
    QuestionModel(
      Icons.electric_bolt_rounded,
      "what is the factory electricity consumption (KWh/month)",
      textBuild(),
    ),
    QuestionModel(
      Icons.electrical_services_rounded,
      "what is the factory percentage electricity from a clean energy source (%)",
      textBuild(),
    ),
   
    QuestionModel(
      Icons.car_repair,
      "How many numbers of cars",
      textBuild(),
    ),
    QuestionModel(
      Icons.mode_of_travel_sharp,
      "What is the size of factory ?",
      textBuild(),
    ), 
    QuestionModel(
      Icons.shopping_cart_sharp,
      "Does the factory use local products ?",
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
      Icons.energy_savings_leaf_rounded,
      "Does the factory buy environmentally products ? ",
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
      Icons.warning_outlined,
      "How do you handle waste ?",
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
