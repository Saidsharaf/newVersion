import 'package:flutter/material.dart';
import 'package:revive/models/dropdownMenu/menu.dart';
import 'package:revive/models/dropdownMenu/menu_item.dart';
import 'package:revive/modules/betweenOwner_Customer/post_screen/add_post.dart';
import 'package:revive/shared/component/component.dart';

class post extends StatelessWidget {
  post({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(physics: BouncingScrollPhysics(), children: [
      // SizedBox(
      //   height: 5,
      // ),
      buildAddPost(context),
      postwid(
        name: "Ziad shalaby",
        contentPost: "he is a good man",
        photo: "assets/images/prof1.jpeg",
      ),
      postwid(
          name: "Osama mohamed",
          contentPost: "i want to do thank u for fdjfsfhf"),
      postwid(
          name: "Ali hamed", contentPost: "i want to do thank u for fdjfsfhf"),
      postwid(
          name: "Mostafa amin",
          contentPost: "i want to do thank u for fdjfsfhf"),
    ]);
  }
}

class postwid extends StatelessWidget {
  final name;
  final contentPost;
  final photo;

  const postwid(
      {super.key, required this.name, required this.contentPost, this.photo});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(38, 41, 37, 0.29),
            blurRadius: 25,
            //offset: Offset(0, 0),
          ),
        ],
      ),
      child: Card(
        child: Column(
          children: [
            ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.person),
              ),
              title: Container(
                margin: EdgeInsets.only(top: 8),
                child: Text(
                  name,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontFamily: "Body",
                    fontSize: 15,
                  ),
                ),
              ),
              trailing: PopupMenuButton<MenuItem>(
                onSelected: (value) => onSelect(context, value),
                itemBuilder: (context) => [
                  ...MenuItems.items.map(buildItem).toList(),
                ],
              ),
              isThreeLine: true,
              subtitle: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      contentPost,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontFamily: "Inter",
                      ),
                    ),
                    photo == null ? SizedBox() : Image.asset(photo),
                  ],
                ),
              ),
            ),
            Divider(
              color: Colors.grey.withOpacity(.5),
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border(
                        right: BorderSide(
                          color: Colors.grey.withOpacity(.5),
                        ),
                      ),
                    ),
                    padding: EdgeInsets.only(top: 0, bottom: 1, left: 25),
                    child: Row(
                      children: [
                        // Icon(Icons.thumb_up, color: Colors.grey),
                        like(),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Like",
                          style: TextStyle(color: Colors.grey),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () => Navigator.of(context).push(createRoute()),
                    child: Padding(
                      padding: EdgeInsets.only(top: 0, bottom: 0, left: 27),
                      child: Row(
                        children: [
                          Icon(
                            Icons.comment_rounded,
                            color: Colors.grey,
                            size: 25,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Comment",
                            style: TextStyle(color: Colors.grey),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(padding: EdgeInsets.only(top: 2)),
          ],
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

Widget buildAddPost(context) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.grey[100],
      boxShadow: [
        BoxShadow(
          color: Color.fromRGBO(38, 41, 37, 0.29),
          blurRadius: 25,
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
  );
}
