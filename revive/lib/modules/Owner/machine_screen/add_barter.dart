import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:revive/layout/home_layout.dart';
import 'package:revive/modules/LoginAndReg/component.dart';
import 'package:revive/shared/component/component.dart';

class AddBarter extends StatefulWidget {
  const AddBarter({super.key});

  @override
  State<AddBarter> createState() => _BarterState();
}

int currentStep = 0;
var nameController = TextEditingController();

class _BarterState extends State<AddBarter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        title: Text(
          "Tourism",
          style: const TextStyle(fontFamily: "Title"),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage("assets/images/login_background_1.jpg",),fit: BoxFit.cover),
                  // color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromRGBO(38, 41, 37, 0.29),
                      blurRadius: 3,
                      offset: Offset(0, 1),
                    ),
                  ],
                ),
                padding: const EdgeInsets.only(
                  top: 20,
                  right: 10,
                  left: 10,
                  bottom: 20,
                ),
                child: Column(
                  children: [
                    Text(
                      "My footprint",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Inter"),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    CircularPercentIndicator(
                      radius: 100,
                      lineWidth: 30,
                      percent: .4,
                      progressColor: Colors.green[400],
                      circularStrokeCap: CircularStrokeCap.round,
                      center: const Text(
                        "40 %",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                width: double.infinity,
                height: 480,
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage("assets/images/Mountains.jpeg",),fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromRGBO(38, 41, 37, 0.29),
                      blurRadius: 2,
                      offset: Offset(0, 1),
                    ),
                  ],
                ),
                child: Theme(
                  data: Theme.of(context).copyWith(
                    colorScheme: const ColorScheme.light(primary: Colors.green),
                  ),
                  child: Stepper(
                    steps: getSteps(),
                    physics: const BouncingScrollPhysics(),
                    type: StepperType.vertical,
                    currentStep: currentStep,
                    onStepContinue: () {
                      setState(() {
                        final isLastStep = currentStep == getSteps().length - 1;
                        if (isLastStep) {
                          showToast(
                              msg: "The barter is added",
                              state: toastStates.SUCCESS);
                          navigateAndFinish(context, HomeLayout(index: 1,));
                        } else {
                          currentStep++;
                        }
                      });
                    },
                    onStepCancel: currentStep == 0
                        ? null
                        : () => setState(() {
                              currentStep--;
                            }),
                    controlsBuilder: (context, ControlsDetails details) {
                      final isLastStep = currentStep == getSteps().length - 1;
                      return Container(
                        margin: const EdgeInsets.only(top: 20),
                        child: Row(
                          children: [
                            Expanded(
                                child: ElevatedButton(
                                    onPressed: details.onStepContinue,
                                    child:
                                        Text(isLastStep ? "Confirm" : "Next"))),
                            const SizedBox(
                              width: 5,
                            ),
                            if (currentStep != 0)
                              Expanded(
                                  child: ElevatedButton(
                                      onPressed: details.onStepCancel,
                                      child: Text("back"))),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Step> getSteps() => [
        Step(
          state: currentStep > 0 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 0,
          title: const Text("Name Machine Of Buyer"),
          content: Column(
            children: [
              const SizedBox(
                height: 5,
              ),
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                  label: const Text("Name"),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
        Step(
          state: currentStep > 1 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 1,
          title: const Text("Carbon Footprint"),
          content: Column(
            children: [
              const SizedBox(
                height: 5,
              ),
              TextFormField(
                decoration: InputDecoration(
                  label: Text("Footprint"),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
                // style: const TextStyle(
                //   color: Colors.black,
                //   fontSize: 23,
                // ),
                keyboardType: TextInputType.number,
                textAlign: TextAlign.start,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(2),
                  FilteringTextInputFormatter.digitsOnly
                ],
              ),
            ],
          ),
        ),
        Step(
          isActive: currentStep >= 2,
          title: const Text("Time of offer"),
          content: Column(
            children: [
              const SizedBox(
                height: 5,
              ),
              TextFormField(
                decoration: InputDecoration(
                  label: const Text("Month"),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
                // style: const TextStyle(
                //   color: Colors.black,
                //   fontSize: 23,
                // ),
                keyboardType: TextInputType.number,
                textAlign: TextAlign.start,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(2),
                  FilteringTextInputFormatter.digitsOnly
                ],
              ),
            ],
          ),
        ),
      ];
}