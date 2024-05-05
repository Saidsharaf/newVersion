import 'package:flutter/material.dart';
import 'package:revive/models/dropdownMenu/menu.dart';
import 'package:revive/models/dropdownMenu/menu_item.dart';
import 'package:revive/modules/betweenOwner_Customer/post_screen/comment.dart';
import 'package:revive/modules/betweenOwner_Customer/post_screen/posts.dart';
import 'package:revive/modules/betweenOwner_Customer/prof_screen/prof.dart';
import 'package:revive/shared/component/component.dart';

class MyPostDetails extends StatefulWidget {
  const MyPostDetails({super.key});

  @override
  State<MyPostDetails> createState() => _MyPostDetailsState();
}

class _MyPostDetailsState extends State<MyPostDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.grey[100],
        title: Text(
          'My Post',
          style: TextStyle(
            fontFamily: "Title",
            fontSize: 25,
            color: Color.fromARGB(255, 68, 124, 70),
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ////headerpost
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    child: GestureDetector(
                      onTap: () {
                        navigate(context, Prof());
                      },
                      child: CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.green[400],
                        child: CircleAvatar(
                          radius: 18,
                          backgroundImage:
                              AssetImage('assets/images/prof1.jpeg'),
                          //  profileImages[index]
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      navigate(context, Prof());
                    },
                    child: Text('Said Sharaf'),
                  ),
                  Spacer(),
                  PopupMenuButton<MenuItem>(
                    onSelected: (value) => onSelect(context, value),
                    itemBuilder: (context) => [
                      ...MenuItems.items.map(buildItem).toList(),
                    ],
                  ),
                ],
              ),

              /////////// image post
              Image.asset("assets/images/post_1.jpeg"),

              ///footer post
              Row(
                children: [
                  // IconButton(
                  //   onPressed: () {
                  //     setState(() {
                  //       listOfItems[index].isLiked = !listOfItems[index].isLiked;
                  //     });
                  //   },
                  //   icon: Icon(
                  //     listOfItems[index].isLiked
                  //         ? Icons.favorite
                  //         : Icons.favorite_border,
                  //     color: listOfItems[index].isLiked
                  //         ? Colors.green[400]
                  //         : Colors.green[400],
                  //   ),
                  // ),
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CommentPage(),
                        ),
                      );
                    },
                    icon: Icon(Icons.chat_bubble_outline),
                    color: Colors.green[400],
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CommentPage(),
                        ),
                      );
                    },
                    icon: Icon(Icons.label_outline),
                    color: Colors.green[400],
                  ),
                  Spacer(),
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Prof(),
                        ),
                      );
                    },
                    icon: Icon(Icons.bookmark_border),
                    color: Colors.green[400],
                  ),
                ],
              ),

              /////post text
              Container(
                padding: EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        style: TextStyle(color: Colors.black),
                        children: [
                          TextSpan(text: "Liked by"),
                          TextSpan(
                            text: "Ziad Shalaby",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(text: "and"),
                          TextSpan(
                            text: "others",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        style: TextStyle(color: Colors.black),
                        children: [
                          TextSpan(
                            text: "Said Sharaf",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text: "i want to do thank u for this machine ",
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        navigate(context, CommentPage());
                      },
                      child: Text(
                        "View all 10 comments",
                        style: TextStyle(
                          color: Colors.black38,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<bool> onSelect(BuildContext context, MenuItem item) async {
    switch (item) {
      case MenuItems.itemReport:
        // ignore: unused_local_variable
        bool? show = await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text("Report"),
            content: Text("Do you want to report this post ?"),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("Yes")),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("No")),
            ],
          ),
        );
        break;
    }
    return false;
  }
}
