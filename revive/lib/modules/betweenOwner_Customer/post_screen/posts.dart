import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:revive/models/dropdownMenu/menu.dart';
import 'package:revive/models/dropdownMenu/menu_item.dart';
import 'package:revive/modules/LoginAndReg/component.dart';
import 'package:revive/modules/betweenOwner_Customer/post_screen/add_post.dart';
import 'package:revive/modules/betweenOwner_Customer/post_screen/comment.dart';
import 'package:revive/modules/betweenOwner_Customer/post_screen/cubitShowAllPosts/cubit.dart';
import 'package:revive/modules/betweenOwner_Customer/post_screen/cubitShowAllPosts/state.dart';
import 'package:revive/modules/betweenOwner_Customer/post_screen/likes.dart';
import 'package:revive/modules/betweenOwner_Customer/prof_screen/prof.dart';
import 'package:revive/modules/search/addFollowToOther/secProfile.dart';
import 'package:revive/shared/component/component.dart';
import 'package:revive/shared/network/end_point.dart';
import 'package:revive/shared/network/local/shared_pref.dart';

class Posts extends StatefulWidget {
  const Posts({Key? key});

  @override
  State<Posts> createState() => _PostsState();
}

class _PostsState extends State<Posts> {
  Future<void> onRefresh() async {
    await Future.delayed(
      Duration(seconds: 2),
    );
  }

  late bool _isLoading;
  void initState() {
    _isLoading = true;
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShowAllPostsCubit()..showAllPosts(),
      child: BlocConsumer<ShowAllPostsCubit, ShowAllPostsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = ShowAllPostsCubit.get(context);
          Future<bool> onSelect(
              BuildContext context, MenuItem item, index) async {
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
                            print(index);
                            cubit.addReportPost(id: index + 1);
                            Navigator.of(context).pop();
                            showToast(msg: "done", state: toastStates.SUCCESS);
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

          return _isLoading
              ? Padding(
                  padding: const EdgeInsets.only(top: 60),
                  child: ListView.separated(
                    itemCount: 5,
                    itemBuilder: (context, index) => const NewsCardSkelton(),
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 5),
                  ),
                )
              : Scaffold(
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
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                                child: ListTile(
                                  onTap: () {
                                    navigate(context, AddPost());
                                  },
                                  //tileColor: Colors.white,
                                  leading: CircleAvatar(
                                    backgroundImage: NetworkImage(server +
                                        sharedPref.getData(key: "profilePic")),
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
                                itemCount: context
                                    .read<ShowAllPostsCubit>()
                                    .users
                                    .length,
                                itemBuilder: (context, index) {
                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      ////headerpost
                                      Row(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.all(10),
                                            child: GestureDetector(
                                              onTap: () {
                                                navigate(context, secProfile());
                                              },
                                              child: CircleAvatar(
                                                radius: 22,
                                                backgroundColor:
                                                    Colors.green[400],
                                                child: CircleAvatar(
                                                  radius: 21,
                                                  backgroundImage: NetworkImage(
                                                      server +
                                                          context
                                                                      .read<
                                                                          ShowAllPostsCubit>()
                                                                      .users[
                                                                  index]["user"]
                                                              [
                                                              "profile_photo"]),
                                                  //  profileImages[index]
                                                ),
                                              ),
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              navigate(context, secProfile());
                                            },
                                            child: Text(context
                                                    .read<ShowAllPostsCubit>()
                                                    .users[index]["user"]
                                                ["username"]),
                                          ),
                                          Spacer(),
                                          PopupMenuButton<MenuItem>(
                                            onSelected: (value) =>
                                                onSelect(context, value, index),
                                            itemBuilder: (context) => [
                                              ...MenuItems.items
                                                  .map(buildItem)
                                                  .toList(),
                                            ],
                                          ),
                                        ],
                                      ),

                                      /////////// image post
                                      Image.network(server +
                                          context
                                              .read<ShowAllPostsCubit>()
                                              .users[index]["path"]),

                                      ///footer post
                                      Row(
                                        children: [
                                          IconButton(
                                            onPressed: () {
                                              setState(() {
                                                // context
                                                //         .read<ShowAllPostsCubit>()
                                                //         .users[index]["saved"] =
                                                // !context
                                                //     .read<
                                                //         ShowAllPostsCubit>()
                                                //     .users[index]["saved"];
                                                context
                                                    .read<ShowAllPostsCubit>()
                                                    .addFav(
                                                        id: cubit.users[index]
                                                            ["id"]);
                                              });
                                            },
                                            icon: Icon(
                                              cubit.isFav
                                                  ? Icons.favorite
                                                  : Icons.favorite_border,
                                              color: cubit.isFav
                                                  ? Colors.green[400]
                                                  : Colors.green[400],
                                            ),
                                          ),
                                          IconButton(
                                            onPressed: () {
                                              sharedPref.saveData(
                                                  key: "numId", value: index);
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      CommentPage(),
                                                ),
                                              );
                                            },
                                            icon:
                                                Icon(Icons.chat_bubble_outline),
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
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            GestureDetector(
                                              onTap: () {

                                                navigate(context,Likes());
                                              },
                                              child: RichText(
                                                text: TextSpan(
                                                  style: TextStyle(
                                                      color: Colors.black),
                                                  children: [
                                                    TextSpan(text: "Liked by"),
                                                    TextSpan(
                                                      text: "Ziad Shalaby",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    TextSpan(text: "and"),
                                                    TextSpan(
                                                      text: "others",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            RichText(
                                              text: TextSpan(
                                                style: TextStyle(
                                                    color: Colors.black),
                                                children: [
                                                  TextSpan(
                                                    text: context
                                                            .read<
                                                                ShowAllPostsCubit>()
                                                            .users[index]
                                                        ["user"]["username"],
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  TextSpan(
                                                    text: " " +
                                                        context
                                                                .read<
                                                                    ShowAllPostsCubit>()
                                                                .users[index]
                                                            ["description"],
                                                  ),
                                                ],
                                              ),
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                navigate(
                                                    context, CommentPage());
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

class NewsCardSkelton extends StatelessWidget {
  const NewsCardSkelton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Skeleton(height: 50, width: 50),
              SizedBox(
                width: 5,
              ),
              const Skeleton(height: 20, width: 200),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          const Skeleton(height: 350, width: 350),
        ],
      ),
    );
  }
}

class Skeleton extends StatelessWidget {
  const Skeleton({Key? key, this.height, this.width}) : super(key: key);

  final double? height, width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: const EdgeInsets.all(20 / 2),
      decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.04),
          borderRadius: const BorderRadius.all(Radius.circular(20))),
    );
  }
}

class CircleSkeleton extends StatelessWidget {
  const CircleSkeleton({Key? key, this.size = 24}) : super(key: key);

  final double? size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor.withOpacity(0.04),
        shape: BoxShape.circle,
      ),
    );
  }
}
