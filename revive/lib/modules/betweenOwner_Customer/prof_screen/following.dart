import 'package:flutter/material.dart';
import 'package:revive/layout/home_layout.dart';
import 'package:revive/modules/LoginAndReg/login.dart';
import 'package:revive/shared/component/component.dart';

class Following extends StatefulWidget {
  const Following({super.key});

  @override
  State<Following> createState() => _FollowersState();
}

class _FollowersState extends State<Following> {
  List<String> followers =
      List.generate(10, (index) => "hodasalama${index + 1}");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Following"),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            navigateAndFinish(context, HomeLayout(index: 3,));
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: ListView.builder(
        itemCount: followers.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              onTap: () {},
              leading: CircleAvatar(
                radius: 28,
                backgroundImage: const AssetImage("assets/images/prof_2.jpeg"),
              ),
              title: Text(followers[index]),
              subtitle: const Text("Hoda Salama"),
              trailing: _removeBtn(context, index),
            ),
          );
        },
      ),
    );
  }

  Widget _removeBtn(BuildContext context, int index) {
    return SizedBox(
      child: MaterialButton(
        elevation: 2.0,
        highlightElevation: 0.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        color: Colors.green,
        onPressed: () {
          setState(() {
            followers.removeAt(index);
          });
        },
        child: const Text(
          "Follow",
          style: TextStyle(
            fontSize: 10.0,
            color: Colors.white,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
