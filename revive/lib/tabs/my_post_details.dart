import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:revive/layout/home_layout.dart';
import 'package:revive/models/dropdownMenu/menuDelete.dart';
import 'package:revive/models/dropdownMenu/menu_itemDelete.dart';
import 'package:revive/modules/LoginAndReg/component.dart';
import 'package:revive/modules/betweenOwner_Customer/post_screen/comment.dart';
import 'package:revive/modules/betweenOwner_Customer/post_screen/cubitShowAllPosts/cubit.dart';
import 'package:revive/modules/betweenOwner_Customer/post_screen/cubitShowAllPosts/state.dart';
import 'package:revive/modules/betweenOwner_Customer/prof_screen/prof.dart';
import 'package:revive/shared/component/component.dart';
import 'package:revive/shared/network/end_point.dart';
import 'package:revive/shared/network/local/shared_pref.dart';

class MyPostDetails extends StatefulWidget {
  const MyPostDetails({super.key});

  @override
  State<MyPostDetails> createState() => _MyPostDetailsState();
}


class _MyPostDetailsState extends State<MyPostDetails> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShowAllPostsCubit()
        ..showOnePost(id: sharedPref.getData(key: "numIDD")),
      child: BlocConsumer<ShowAllPostsCubit, ShowAllPostsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = ShowAllPostsCubit.get(context);
          Future<bool> onSelect(
              BuildContext context, MenuDeleteItem item) async {
            switch (item) {
              case MenuDeleteItems.itemDelete:
                // ignore: unused_local_variable
                bool? show = await showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text("Delete"),
                    content: Text("Do you want to report this post ?"),
                    actions: [
                      TextButton(
                          onPressed: () {
                            cubit.DeletePost(
                                id: sharedPref.getData(key: "numIDD"));
                            Navigator.of(context).pop();
                            showToast(msg: "Deleted", state: toastStates.ERROR);
                            navigateAndFinish(context, HomeLayout(index: 0));
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
              child: SingleChildScrollView(
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
                                  backgroundImage: NetworkImage(server +
                                      sharedPref.getData(key: "profilePic")),
                                  //  profileImages[index]
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              navigate(context, Prof());
                            },
                            child: Text(sharedPref.getData(key: "username")),
                          ),
                          Spacer(),
                          PopupMenuButton<MenuDeleteItem>(
                            onSelected: (value) => onSelect(context, value),
                            itemBuilder: (context) => [
                              ...MenuDeleteItems.items.map(buildItem).toList(),
                            ],
                          ),
                        ],
                      ),

                      /////////// image postshow
                      BlocBuilder<ShowAllPostsCubit, ShowAllPostsStates>(
                        builder: (context, state) {
                          if (state is showOnePostSuccessState) {
                            return Image.network(
                                server + cubit.showOnePostModel!.post!.path!);
                          } else
                            return Container();
                        },
                      ),
                      Row(
                        children: [
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
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  TextSpan(text: "and"),
                                  TextSpan(
                                    text: "others",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            BlocBuilder<ShowAllPostsCubit, ShowAllPostsStates>(
                              builder: (context, state) {
                                if (state is showOnePostSuccessState) {
                                  return RichText(
                                    text: TextSpan(
                                      style: TextStyle(color: Colors.black),
                                      children: [
                                        TextSpan(
                                          text: sharedPref.getData(
                                              key: "username"),
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        TextSpan(
                                          text: cubit.showOnePostModel!.post!
                                              .description,
                                        ),
                                      ],
                                    ),
                                  );
                                } else
                                  return Container();
                              },
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
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  PopupMenuItem<MenuDeleteItem> buildItem(MenuDeleteItem item) => PopupMenuItem(
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
            Text(item.txt),
          ],
        ),
      );
}
