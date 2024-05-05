import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

class OrderMachine extends StatelessWidget {
  const OrderMachine({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 25,),
          Container(
            height: 260,
            width: double.infinity,
            child: SvgPicture.asset(
              "assets/icons/think.svg",
            ),
          ),
          SizedBox(
            height: 20,
          ),
          TextButton(
            onPressed: () async {
              await launchUrl(
                Uri.parse("https://forms.gle/Ff7So2epLcENJ7NMA"),
              );
            },
            child: Text("Click here to order your machine",style: TextStyle(color: Colors.green, fontSize: 17),),
          ),
          Container(
              alignment: Alignment.topRight,
              height: 250,
              width: 251,
              child: Image.asset(
                "assets/images/point.png",
              )),
        ],
      ),
    );
  }
}
