

import 'package:flutter/material.dart';
import 'package:revive/modules/post_screen/posts.dart';

class CommentPage extends StatelessWidget {
  const CommentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              color: Colors.grey[100],
              child: Column(
                children: [
                  postwid(
                    name: "Ziad shalaby",
                    contentPost: "he is a good man",
                    photo: "assets/images/prof1.jpeg",
                  ),
                  ListTile(
                    //tileColor: Colors.white,
                    leading: CircleAvatar(
                      backgroundImage: AssetImage("assets/images/prof1.jpeg"),
                    ),
                    title: Container(
                      margin: EdgeInsets.only(top: 8),
                      child: Text(
                        "said sharaf",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontFamily: "Body",
                          fontSize: 15,
                        ),
                      ),
                    ),
                    isThreeLine: true,
                    subtitle: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("Thank you my brother"),
                    ),
                  ),
                  Divider( color: Colors.white,height: 1,),
                ],
              ),
            ),
            Align(
              alignment: Alignment(0, 1),
              child: Container(
                height: 60,
                child: TextField(
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  decoration: InputDecoration(
                    hintText: 'Comment',
                    suffixIcon: Icon(
                      Icons.send,
                      color: Colors.grey,
                    ),
                    prefixIcon: Icon(
                      Icons.comment_rounded,
                      color: Colors.grey,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 50, 50, 48),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
