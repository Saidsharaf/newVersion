import 'package:flutter/material.dart';
import 'package:revive/shared/component/component.dart';

// ignore: must_be_immutable
class Machine extends StatelessWidget {
  Machine({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: buildCard1(context),
            ),
            itemCount: 5,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 46,left: 10,right: 10,),
          child: Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(38, 41, 37, 0.29),
                  blurRadius: 1,
                  offset: Offset(0, 1),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Text(
                "You can order a new machine or check your old machine and see the temperature or carbon dioxide percentage on today’s date or the previous days. ",
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: "Body",
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 65),
          child: FloatingActionButton(
            onPressed: () {
              bottomSheet(context);
            },
            child: Icon(
              Icons.add,
              color: Colors.white,
              size: 29,
            ),
          ),
        ),
      ],
    );
  }
}
