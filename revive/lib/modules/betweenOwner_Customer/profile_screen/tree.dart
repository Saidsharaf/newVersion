import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class Tree extends StatefulWidget {
  const Tree({Key? key}) : super(key: key);

  @override
  State<Tree> createState() => _TreeState();
}

class _TreeState extends State<Tree> {
  StateMachineController? controller;
  SMIInput<double>? inputValue;
  double valueSlider = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF4d4c61),
      appBar: AppBar(
        backgroundColor:  const Color(0xFF4d4c61),
      ),
      body: Stack(
        children: [
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: Text("That's a living example of how you can control the environment, You can use the slider to build or tear down the Tree",
            style: TextStyle(
              color: Colors.white,
              fontFamily: "Body",
              fontSize: 17,
            ),),
          ),
          RiveAnimation.asset(
            "assets/images/tree-demo.riv",
            fit: BoxFit.fitWidth,
            onInit: (artboard) {
              controller = StateMachineController.fromArtboard(
                artboard,
                "State Machine 1",
              );

              if(controller != null) {
                artboard.addController(controller!);
                inputValue = controller?.findInput("input");
                inputValue?.change(1);
              }
            },
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 60,
                ),
                child: Slider(
                  activeColor: Colors.green,
                  inactiveColor: Colors.green.withOpacity(0.5),
                  value: valueSlider,
                  onChanged: (v) {
                    setState(() {
                      valueSlider = v;
                    });
                    inputValue?.change(v);
                  },
                  min: 0,
                  max: 100,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}