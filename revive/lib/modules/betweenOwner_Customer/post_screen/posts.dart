import 'package:flutter/material.dart';
import 'package:revive/models/dropdownMenu/menu.dart';
import 'package:revive/models/dropdownMenu/menu_item.dart';
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
  List<OwnerPostModel> listOfItems = [
    OwnerPostModel(
      name: 'Said kkkkkk',
      ownerImage: 'assets/images/prof1.jpeg',
      postImage: 'assets/images/machine_background3.jpeg',
      isLiked: false,
    ),
    OwnerPostModel(
      name: 'Salma Magdy',
      ownerImage: "assets/images/prof_2.jpeg",
      postImage: 'assets/images/login_background_1.jpg',
      isLiked: false,
    ),
    OwnerPostModel(
      name: 'Ziad Shalaby',
      ownerImage: 'assets/images/prof1.jpeg',
      postImage: 'assets/images/fci_2.jpeg',
      isLiked: false,
    ),
    OwnerPostModel(
      name: 'Rowida Ehab',
      ownerImage: "assets/images/prof_3.jpeg",
      postImage: "assets/images/factory_3.jpeg",
      isLiked: false,
    ),
  ];

  Future<void> onRefresh() async {
    await Future.delayed(Duration(seconds: 2));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: onRefresh,
          child: SingleChildScrollView(
            child: Column(
              children: [
                ///////////adddd possst
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Container(
                    height: 80,
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromRGBO(86, 201, 48, 0.278),
                          blurRadius: 50,
                          //offset: Offset(0, 0),
                        ),
                      ],
                      borderRadius: BorderRadius.all(Radius.circular(10)),
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
                ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: listOfItems.length,
                    itemBuilder: (context, index) {
                      return Column(
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
                                    radius: 22,
                                    backgroundColor: Colors.green[400],
                                    child: CircleAvatar(
                                      radius: 21,
                                      backgroundImage: AssetImage(
                                          listOfItems[index].ownerImage),
                                      //  profileImages[index]
                                    ),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  navigate(context, Prof());
                                },
                                child: Text(listOfItems[index].name),
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
                          Image.asset(listOfItems[index].postImage),

                          ///footer post
                          Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    listOfItems[index].isLiked =
                                        !listOfItems[index].isLiked;
                                  });
                                },
                                icon: Icon(
                                  listOfItems[index].isLiked
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  color: listOfItems[index].isLiked
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
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      TextSpan(text: "and"),
                                      TextSpan(
                                        text: "others",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
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
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
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
                      );
                    }),

                SizedBox(
                  height: 50,
                ),
              ],
            ),
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

class OwnerPostModel {
  final String name;
  final String ownerImage;
  final String postImage;
  bool isLiked;

  OwnerPostModel({
    required this.name,
    required this.ownerImage,
    required this.postImage,
    required this.isLiked,
  });
}

PopupMenuItem<MenuItem> buildItem(MenuItem item) => PopupMenuItem(
      value: item,
      child: Row(
        children: [
          Icon(
            item.icon,
            size: 20,
          ),
          SizedBox(
            width: 10,
          ),
          Text(item.text),
        ],
      ),
    );
