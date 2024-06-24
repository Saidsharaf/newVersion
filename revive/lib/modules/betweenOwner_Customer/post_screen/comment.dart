import 'package:comment_box/comment/comment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:revive/modules/betweenOwner_Customer/post_screen/cubitComment/cubit.dart';
import 'package:revive/modules/betweenOwner_Customer/post_screen/cubitComment/state.dart';
import 'package:revive/shared/network/end_point.dart';
import 'package:revive/shared/network/local/shared_pref.dart';

class CommentPage extends StatefulWidget {
  @override
  _CommentPageState createState() => _CommentPageState();
}

class _CommentPageState extends State<CommentPage> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController commentController = TextEditingController();
  List filedata = [
    {
      'name': 'Said Sharaf',
      'pic': 'assets/images/prof1.jpeg',
      'message': 'thanks',
      'date': '2021-01-01 12:00:00'
    },
    {
      'name': 'Ziad Shalaby',
      'pic': 'assets/images/prof1.jpeg',
      'message': 'Very cool',
      'date': '2021-01-01 12:00:00'
    },
    {
      'name': 'Rowida ahmed',
      'pic': 'assets/images/prof1.jpeg',
      'message': 'Thank You',
      'date': '2021-01-01 12:00:00'
    },
    {
      'name': 'Hoda salama',
      'pic': 'assets/images/prof1.jpeg',
      'message': 'Very cool',
      'date': '2021-01-01 12:00:00'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShowCommentCubit()
        ..showComment(id: sharedPref.getData(key: "numId") + 1),
      child: BlocConsumer<ShowCommentCubit, ShowCommentStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = ShowCommentCubit.get(context);
          Widget commentChild(data) {
            return ListView.builder(
              itemCount: cubit.comments.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.fromLTRB(2.0, 8.0, 2.0, 0.0),
                  child: ListTile(
                    leading: Container(
                      height: 50.0,
                      width: 50.0,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.all(Radius.circular(50))),
                      child: CircleAvatar(
                        radius: 50,
                        backgroundImage: NetworkImage(
                          server +
                              cubit.comments[index]['user']['profile_photo'],
                        ),
                      ),
                    ),
                    title: Text(
                      cubit.comments[index]['user']['username'],
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(cubit.comments[index]['comment']),
                    // trailing: Text("2021-01-01 12:00:00",
                    //     style: TextStyle(fontSize: 10)),
                  ),
                );
              },
            );
          }

          return Scaffold(
            appBar: AppBar(
                title: Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Comment Page",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
                backgroundColor: Colors.green[400]),
            body: Container(
              child: CommentBox(
                userImage: CommentBox.commentImageParser(
                    imageURLorPath:
                        server + sharedPref.getData(key: "profilePic")),
                child: commentChild(cubit.comments),
                labelText: 'Write a comment...',
                errorText: 'Comment cannot be blank',
                withBorder: false,
                sendButtonMethod: () {
                  if (formKey.currentState!.validate()) {
                    print(commentController.text);
                    setState(() {
                      var value = {
                        'name': sharedPref.getData(key: "username"),
                        'pic': sharedPref.getData(key: "profilePic"),
                        'message': commentController.text,
                        'date': '2021-01-01 12:00:00'
                      };
                      filedata.insert(0, value);
                    });
                    commentController.clear();
                    FocusScope.of(context).unfocus();
                  } else {
                    print("Not validated");
                  }
                },
                formKey: formKey,
                commentController: commentController,
                backgroundColor: Colors.green[400],
                textColor: Colors.white,
                sendWidget:
                    Icon(Icons.send_sharp, size: 30, color: Colors.white),
              ),
            ),
          );
        },
      ),
    );
  }
}
