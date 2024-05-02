import 'package:flutter/material.dart';
import 'package:revive/modules/betweenOwner_Customer/post_screen/add_post.dart';
import 'package:revive/modules/betweenOwner_Customer/post_screen/comment.dart';
import 'package:revive/modules/betweenOwner_Customer/prof_screen/prof.dart';
import 'package:revive/shared/component/component.dart';
import 'package:revive/tabs/saved_post.dart';

class Posts extends StatefulWidget {
  const Posts({Key? key});

  @override
  State<Posts> createState() => _PostsState();
}

class _PostsState extends State<Posts> {
  //////////////favourite button
  bool isFavorited = false;

  void toggleFavorite() {
    setState(() {
      isFavorited = !isFavorited;
    });
  }

  List<String> profileImages = [
    "images/image1.jpg",
    "images/image2.jpg",
    "images/image3.jpg",
    "images/image4.jpg",
    "images/image5.jpg",
    "images/image6.jpg",
    "images/image7.jpg",
    "images/image8.jpg",
  ];

  List<String> posts = [
    "images/image1.jpg",
    "images/image2.jpg",
    "images/image3.jpg",
    "images/image4.jpg",
    "images/image5.jpg",
    "images/image6.jpg",
    "images/image7.jpg",
    "images/image8.jpg",
  ];

  Future<void> onRefresh() async {
    await Future.delayed(Duration(seconds: 2));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: onRefresh,
        child: SingleChildScrollView(
          child: Column(
            children: [
              ///////////adddd possst
              Container(
                height: 80,
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(98, 179, 72, 0.282),
                      blurRadius: 50,
                      //offset: Offset(0, 0),
                    ),
                  ],
                ),
                child: ListTile(
                  onTap: () {
                    navigate(context, AddPost());
                  },
                  //tileColor: Colors.white,
                  leading: CircleAvatar(
                    backgroundImage: AssetImage("assets/images/prof1.jpeg"),
                  ),
                  title: Container(
                    margin: EdgeInsets.only(top: 8),
                    child: Text(
                      "What is on your mind ?",
                      style: TextStyle(
                        // fontWeight: FontWeight.w600,
                        // fontFamily: "Body",
                        fontSize: 14,
                      ),
                    ),
                  ),
                  isThreeLine: true,
                  subtitle: Padding(
                    padding: EdgeInsets.all(8.0),
                  ),
                ),
              ),

              SizedBox(
                height: 5,
              ),
              // Row(
              //   children: [
              //     // Icon(Icons.thumb_up, color: Colors.grey),
              //     like(),
              //     SizedBox(
              //       width: 10,
              //     ),
              //     Text(
              //       "Like",
              //       style: TextStyle(color: Colors.grey),
              //       textAlign: TextAlign.center,
              //     ),
              //   ],
              // ),

              //////////////////////////////////////////////////
              ...List.generate(
                15,
                (index) => Column(
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
                                    AssetImage("assets/images/prof1.jpeg"),
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
                        IconButton(
                          icon: Icon(Icons.more_vert),
                          onPressed: () {},
                        )
                      ],
                    ),

                    /////////// image post
                    Image.asset("assets/images/trees-3822149_1280.jpg"),

                    ///footer post
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            // Toggle favorite state
                            toggleFavorite();
                          },
                          icon: Icon(
                            isFavorited
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: isFavorited
                                ? Colors.green[400]
                                : Colors.green[400],
                          ),
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
                          icon: Icon(Icons.chat_bubble_outline),
                          color: Colors.green[400],
                        ),
                        // IconButton(
                        //   onPressed: () {
                        //     Navigator.push(
                        //       context,
                        //       MaterialPageRoute(
                        //         builder: (context) => CommentPage(),
                        //       ),
                        //     );
                        //   },
                        //   icon: Icon(Icons.label_outline),
                        //   color: Colors.green[400],
                        // ),
                        Spacer(),
                        IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SavedPost(),
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
                                  text:
                                      "i want to do thank u for this machine ",
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
              SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
