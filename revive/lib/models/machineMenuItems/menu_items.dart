import 'package:flutter/material.dart';
import 'package:revive/modules/Owner/machine_screen/add_barter.dart';
import 'package:revive/shared/component/component.dart';

class MachineMenuItem extends StatelessWidget {
  const MachineMenuItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            navigate(context, AddBarter());
          },
          child: Container(
            height: 50,
            color: Colors.green[300],
            child: Center(
                child: Text(
              "Add Barter",
              style: TextStyle(
                  fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
            )),
          ),
        ),
        Container(
          height: 50,
          color: Colors.green[200],
          child: Center(
              child: Text(
            "Show My Barter",
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
          )),
        ),
        Container(
          height: 50,
          color: Colors.green[100],
          child: Center(
              child: Text(
            "Destroy Barter",
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
          )),
        ),
      ],
    );
  }
}
