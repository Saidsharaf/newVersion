import 'package:comment_box/comment/comment.dart';
import 'package:flutter/material.dart';

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

  Widget commentChild(data) {
    return ListView(
      children: [
        for (var i = 0; i < data.length; i++)
          Padding(
            padding: const EdgeInsets.fromLTRB(2.0, 8.0, 2.0, 0.0),
            child: ListTile(
              leading: GestureDetector(
                onTap: () async {
                  print("Comment Clicked");
                },
                child: Container(
                  height: 50.0,
                  width: 50.0,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.all(Radius.circular(50))),
                  child: CircleAvatar(
                      radius: 50, backgroundImage: AssetImage(data[i]['pic'])),
                ),
              ),
              title: Text(
                data[i]['name'],
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(data[i]['message']),
              trailing: Text(data[i]['date'], style: TextStyle(fontSize: 10)),
            ),
          )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Center(
            child: Text(
              "Comment Page",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
          backgroundColor: Colors.green[400]),
      body: Container(
        child: CommentBox(
          userImage: CommentBox.commentImageParser(
              imageURLorPath: "assets/images/prof1.jpeg"),
          child: commentChild(filedata),
          labelText: 'Write a comment...',
          errorText: 'Comment cannot be blank',
          withBorder: false,
          sendButtonMethod: () {
            if (formKey.currentState!.validate()) {
              print(commentController.text);
              setState(() {
                var value = {
                  'name': 'New User',
                  'pic': 'assets/images/prof1.jpeg',
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
          sendWidget: Icon(Icons.send_sharp, size: 30, color: Colors.white),
        ),
      ),
    );
  }
}




























































// import 'package:flutter/material.dart';
// import 'package:revive/modules/post_screen/posts.dart';

// class CommentPage extends StatelessWidget {
//   const CommentPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: Stack(
//           children: [
//             Container(
//               color: Colors.grey[100],
//               child: Column(
//                 children: [
//                   postwid(
//                     name: "Ziad shalaby",
//                     contentPost: "he is a good man",
//                     photo: "assets/images/prof1.jpeg",
//                   ),
//                   ListTile(
//                     //tileColor: Colors.white,
//                     leading: CircleAvatar(
//                       backgroundImage: AssetImage("assets/images/prof1.jpeg"),
//                     ),
//                     title: Container(
//                       margin: EdgeInsets.only(top: 8),
//                       child: Text(
//                         "said sharaf",
//                         style: TextStyle(
//                           fontWeight: FontWeight.w600,
//                           fontFamily: "Body",
//                           fontSize: 15,
//                         ),
//                       ),
//                     ),
//                     isThreeLine: true,
//                     subtitle: Padding(
//                       padding: EdgeInsets.all(8.0),
//                       child: Text("Thank you my brother"),
//                     ),
//                   ),
//                   Divider( color: Colors.white,height: 1,),
//                 ],
//               ),
//             ),
//             Align(
//               alignment: Alignment(0, 1),
//               child: Container(
//                 height: 60,
//                 child: TextField(
//                   style: TextStyle(
//                     color: Colors.black,
//                   ),
//                   decoration: InputDecoration(
//                     hintText: 'Comment',
//                     suffixIcon: Icon(
//                       Icons.send,
//                       color: Colors.grey,
//                     ),
//                     prefixIcon: Icon(
//                       Icons.comment_rounded,
//                       color: Colors.grey,
//                     ),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     enabledBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10),
//                       borderSide: BorderSide(
//                         color: Color.fromARGB(255, 50, 50, 48),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
