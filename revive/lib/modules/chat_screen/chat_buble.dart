
import 'package:flutter/material.dart';

class ChatBuble extends StatelessWidget {
  const ChatBuble({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align (
      alignment: Alignment.centerLeft,
      child: Container(
      
        margin: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
      
        padding: EdgeInsets.only(left: 16,top: 16,bottom: 16,right: 16,),
      
        decoration: BoxDecoration(
        
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(32),
                topRight: Radius.circular(32),
                bottomRight: Radius.circular(32),
              ),
        color: const Color.fromARGB(255, 255, 255, 255),
        ),
        child:Text('i am a new user',
        style: TextStyle(
        color: Colors.black,
        fontSize: 16,
        ),) ,
      ),
    );
  }
}