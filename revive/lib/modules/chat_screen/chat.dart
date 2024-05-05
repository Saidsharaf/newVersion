import 'package:flutter/material.dart';
import 'package:revive/modules/chat_screen/chat_buble.dart';

class chat extends StatelessWidget {
  chat({super.key});

  static String id = 'ChatPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(158, 223, 128, 1),
        appBar: AppBar(
          backgroundColor:Color.fromRGBO(158, 223, 128, 1),
          title: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 90, top: 20),
                child: Image.asset(
                  "assets/images/splashhh.png",
                  height: 90,
                ),
              ),
              // Text(
              //   'Chat',
              //   style: TextStyle(
              //     fontWeight: FontWeight.bold,
              //     fontSize: 20,
              //     color: Colors.white,
              //   ),
              // ),
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
                itemCount: 1,
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
                    color: Colors.white,
                  ),
                  prefixIcon: Icon(
                    Icons.list,
                    color: Colors.white,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 50, 50, 48))),
                ),
              ),
            ),
          ],
        ));
  }
}
