
import 'package:flutter/material.dart';
import 'package:revive/modules/chat_screen/chat_buble.dart';


class chat extends StatelessWidget {
  chat({super.key});

  static String id = 'ChatPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          backgroundColor:Color.fromRGBO(165, 214, 167,1),
        appBar: AppBar(
          backgroundColor:  Color.fromRGBO(165, 214, 167,1),
          title: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 40),
                child: Image.asset(
                  "assets/images/splashhh.png",
                  height: 80,
                ),
              ),
              Text(
                'Chat',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return ChatBuble();
                },
                itemCount: 2,
                physics: BouncingScrollPhysics(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: TextField(
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  decoration: InputDecoration(
                    hintText: 'Send Message',
                    suffixIcon: Icon(
                      Icons.send,
                      color: Colors.grey,
                    ),
                    prefixIcon: Icon(
                      Icons.list,
                      color: Colors.grey,),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide:
                            BorderSide(color: Color.fromARGB(255, 50, 50, 48))),
                  ),),
            ),
          ],
        ));
  }
}
