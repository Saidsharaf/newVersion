import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class TreeLived extends StatefulWidget {
  const TreeLived({Key? key}) : super(key: key);

  @override
  State<TreeLived> createState() => _TreeState();
}

class _TreeState extends State<TreeLived> {
  StateMachineController? controller;
  SMIInput<double>? inputValue;
  double valueSlider = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF4d4c61),
      appBar: AppBar(
        backgroundColor: const Color(0xFF4d4c61),
      ),
      body: Container(
        child: Stack(
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: Text(
                "That's a living example of how many trees that you helped to live or die",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: "Body",
                  fontSize: 17,
                ),
              ),
            ),
            Row(
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 5, top: 150),
                      child: Image(
                        image: AssetImage("assets/images/tree_lived.jpg"),
                        width: 110,
                        height: 250,
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 10, top: 0, bottom: 0),
                      child: Text(
                        "Tree Lived ",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Body",
                          fontSize: 17,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        "15 ",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Body",
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
            Row(
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 230, top: 230),
                      child: Image(
                        image: AssetImage("assets/images/tree_died.jpg"),
                        width: 50,
                        height: 150,
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 220, top: 22, bottom: 0),
                      child: Text(
                        "Tree Died",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Body",
                          fontSize: 17,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 225),
                      child: Text(
                        "10 ",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Body",
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
