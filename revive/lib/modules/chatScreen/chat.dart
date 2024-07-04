import 'package:flutter/material.dart';

class Chat extends StatefulWidget {
  const Chat({super.key});

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  var textController = TextEditingController();
  List messages = [];
  void userMessage(String message) {
    setState(() {
      messages.insert(0, {'sender': 'user', 'message': message});
    });
    print(messages);
    reviveMessage(message);
    textController.clear();
  }

  void reviveMessage(String message) {
    //المسدج اللي واخدها فوق دي المفرض اديها ل api
    setState(() {
      messages.insert(0, {
        'sender': 'revive',
        'message': message
      }); //بدل المسدج المفروض response
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "chat Revive",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.grey.withOpacity(0.3),
              child: ListView.builder(
                itemCount: messages.length,
                reverse: true,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: messages[index]['sender'] == 'user'
                        ? CrossAxisAlignment.end
                        : CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(5),
                        child: Container(
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              color: messages[index]['sender'] == 'user'
                                  ? Colors.green
                                  : Colors.grey.withOpacity(.5),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(5),
                                bottomLeft: Radius.circular(5),
                                topRight: Radius.circular(5),
                              )),
                          child: Text(
                            messages[index]['message'],
                            style: TextStyle(
                                color: messages[index]['sender'] == 'user'
                                    ? Colors.white
                                    : Colors.black,
                                fontSize: 17),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            height: 60,
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: textController,
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                    decoration: const InputDecoration.collapsed(
                      hintText: "Input your message",
                      hintStyle: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    userMessage(textController.text);
                  },
                  icon: const Icon(Icons.send),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
