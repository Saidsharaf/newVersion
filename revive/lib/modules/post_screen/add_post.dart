import 'package:flutter/material.dart';

class AddPost extends StatelessWidget {
  const AddPost({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[100],
        title: Text(
          "create post",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        actions: [
          InkWell(
            onTap: () {},
            child: Text(
              "Next   ",
              style: TextStyle(
                fontSize: 15,
              ),
            ),
          ),
        ],
        centerTitle: true,
      ),
      backgroundColor: Colors.grey[100],
      body: ListTile(
        leading: CircleAvatar(
          radius: 30,
          backgroundImage: AssetImage("assets/images/prof1.jpeg"),
        ),
        isThreeLine: true,
        title: Container(
          margin: EdgeInsets.only(top: 18),
          child: Text(
            "said sharaf",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500,fontFamily: "Inter",fontSize: 15,),
          ),
        ),
        subtitle: TextFormField(
          maxLines: 12,
          style: TextStyle(
            color: Colors.black,

          ),
          decoration: InputDecoration(
            focusedBorder: InputBorder.none,
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide.none,
            ),
            hintText: "what is on your mind ?",
            hintStyle: TextStyle(
              color: Colors.black54,
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }
}
