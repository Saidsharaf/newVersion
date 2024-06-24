import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:revive/models/dropdownMenu/menu.dart';
import 'package:revive/models/dropdownMenu/menu_item.dart';
import 'package:revive/modules/betweenOwner_Customer/post_screen/add_post.dart';
import 'package:revive/modules/betweenOwner_Customer/post_screen/comment.dart';
import 'package:revive/modules/betweenOwner_Customer/post_screen/cubitShowAllPosts/cubit.dart';
import 'package:revive/modules/betweenOwner_Customer/post_screen/cubitShowAllPosts/state.dart';
import 'package:revive/modules/betweenOwner_Customer/prof_screen/prof.dart';
import 'package:revive/shared/component/component.dart';
import 'package:revive/shared/network/end_point.dart';
import 'package:revive/shared/network/local/shared_pref.dart';

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
    return BlocProvider(
      create: (context) => ShowAllPostsCubit()..showAllPosts(),
      child: BlocConsumer<ShowAllPostsCubit,ShowAllPostsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          
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
                              backgroundImage:
                                  NetworkImage(server+sharedPref.getData(key: "profilePic")),
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

                      //////////////////////////////////////////////////
                      ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: context.read<ShowAllPostsCubit>().users.length,
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
                                            backgroundImage: NetworkImage(
                                                server+context.read<ShowAllPostsCubit>().users[index]["user"]["profile_photo"]),
                                            //  profileImages[index]
                                          ),
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        navigate(context, Prof());
                                      },
                                      child: Text(context.read<ShowAllPostsCubit>().users[index]["user"]["username"]),
                                    ),
                                    Spacer(),
                                    PopupMenuButton<MenuItem>(
                                      onSelected: (value) =>
                                          onSelect(context, value),
                                      itemBuilder: (context) => [
                                        ...MenuItems.items
                                            .map(buildItem)
                                            .toList(),
                                      ],
                                    ),
                                  ],
                                ),

                                /////////// image post
                                Image.network(server+context.read<ShowAllPostsCubit>().users[index]["path"]),

                                ///footer post
                                Row(
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        setState(() {
                                          context.read<ShowAllPostsCubit>().users[index]["saved"] =
                                              !context.read<ShowAllPostsCubit>().users[index]["saved"];
                                        });
                                      },
                                      icon: Icon(
                                        context.read<ShowAllPostsCubit>().users[index]["saved"] 
                                            ? Icons.favorite
                                            : Icons.favorite_border,
                                        color: context.read<ShowAllPostsCubit>().users[index]["saved"]
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                              text: context.read<ShowAllPostsCubit>().users[index]["user"]["username"],
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            TextSpan(
                                              text:
                                                " "+  context.read<ShowAllPostsCubit>().users[index]["description"],
                                            ),
                                          ],
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          navigate(context, CommentPage());
                                        },
                                        child: Text(
                                          "View all comments",
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
        },
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
