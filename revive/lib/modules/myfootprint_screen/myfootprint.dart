import 'package:flutter/material.dart';
import 'package:revive/modules/betweenOwner_Customer/profile_screen/profile_screen/tlived.dart';
import 'package:revive/modules/betweenOwner_Customer/profile_screen/profile_screen/tree.dart';
//import 'package:revive/modules/profile_screen/tree.dart';
import 'package:revive/shared/component/component.dart';

class Myfootprint extends StatelessWidget {
  Myfootprint({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Stack(
          //   children: [
          //     Container(
          //       height: 220,
          //       decoration: BoxDecoration(
          //         color: const Color.fromARGB(255, 90, 206, 94),
          //         borderRadius: BorderRadius.only(
          //           bottomLeft: Radius.circular(0),
          //           bottomRight: Radius.circular(0),
          //         ),
          //       ),
          //     ),
          //     Center(
          //       child: Padding(
          //         padding: const EdgeInsets.only(top: 110, right: 15, left: 15),
          //         child: Container(
          //           decoration: BoxDecoration(
          //             color: Color.fromARGB(255, 252, 248, 248),
          //             borderRadius: BorderRadius.only(
          //                 topLeft: Radius.circular(0),
          //                 topRight: Radius.circular(0)),
          //             boxShadow: [
          //               BoxShadow(
          //                 color: Color.fromRGBO(38, 41, 37, 0.29),
          //                 blurRadius: 20,
          //                 offset: Offset(0, 1),
          //               ),
          //             ],
          //           ),
          //           child: Padding(
          //             padding: EdgeInsets.all(30),
          //             child: SingleChildScrollView(
          //               physics: BouncingScrollPhysics(),
          //               child: Column(
          //                 children: [
          //                   SizedBox(
          //                     height: 35,
          //                   ),
          //                   Padding(
          //                     padding: const EdgeInsets.all(0),
          //                     child: Text(
          //                       "said sharaf",
          //                       style: TextStyle(
          //                           fontFamily: "Body",
          //                           fontSize: 18,
          //                           fontWeight: FontWeight.w700),
          //                     ),
          //                   ),
          //                   SizedBox(
          //                     height: 40,
          //                   ),
          //                   Container(
          //                     height: 90,
          //                     // width: 350,
          //                     decoration: BoxDecoration(
          //                         color: Color.fromARGB(255, 252, 248, 248),
          //                         borderRadius: BorderRadius.circular(10),
          //                         boxShadow: [
          //                           // BoxShadow(
          //                           // color:
          //                           //   Color.fromRGBO(178, 245, 158, 0.294),
          //                           //blurRadius: 20,
          //                           // offset: Offset(0, 10),
          //                           // ),
          //                         ]),

          //                     child: Row(
          //                       children: [
          //                         Column(
          //                           children: [
          //                             Text(
          //                               "30",
          //                               style: TextStyle(
          //                                 color: Colors.black12,
          //                                 fontFamily: "Body",
          //                                 fontSize: 16,
          //                                 fontWeight: FontWeight.bold,
          //                               ),
          //                             ),
          //                             SizedBox(
          //                               height: 10,
          //                             ),
          //                             Text(
          //                               "Followers",
          //                               style: TextStyle(
          //                                 color: Colors.black54,
          //                                 //fontFamily: "Name",
          //                                 fontSize: 16,
          //                                 //  fontWeight: FontWeight.bold,
          //                               ),
          //                             ),
          //                           ],
          //                         ),
          //                         SizedBox(
          //                           width: 32,
          //                         ),
          //                         Column(
          //                           children: [
          //                             Text(
          //                               "10",
          //                               style: TextStyle(
          //                                 color: Colors.black12,
          //                                 fontFamily: "Body",
          //                                 fontSize: 16,
          //                                 fontWeight: FontWeight.bold,
          //                               ),
          //                             ),
          //                             SizedBox(
          //                               height: 10,
          //                             ),
          //                             Text(
          //                               "Following",
          //                               style: TextStyle(
          //                                 color: Colors.black54,
          //                                 // fontFamily: "Name",
          //                                 fontSize: 16,
          //                                 //fontWeight: FontWeight.bold,
          //                               ),
          //                             ),
          //                           ],
          //                         ),
          //                         SizedBox(
          //                           width: 32,
          //                         ),
          //                         Column(
          //                           children: [
          //                             Text(
          //                               "20",
          //                               style: TextStyle(
          //                                 color: Colors.black12,
          //                                 fontFamily: "Body",
          //                                 fontSize: 16,
          //                                 fontWeight: FontWeight.bold,
          //                               ),
          //                             ),
          //                             SizedBox(
          //                               height: 10,
          //                             ),
          //                             Text(
          //                               "Likes",
          //                               style: TextStyle(
          //                                 color: Colors.black54,
          //                                 // fontFamily: "Name",
          //                                 fontSize: 16,
          //                                 //fontWeight: FontWeight.bold,
          //                               ),
          //                             ),
          //                           ],
          //                         ),
          //                         SizedBox(
          //                           width: 32,
          //                         ),
          //                       ],
          //                     ),

          //                     /////cdcd
          //                   ),
          //                 ],
          //               ),
          //             ),
          //           ),
          //         ),
          //       ),
          //     ),
          //     //////////////////////////////////////
          //     Container(
          //       padding: EdgeInsets.only(left: 135, top: 60),
          //       child: CircleAvatar(
          //         radius: 50,
          //         // backgroundColor: Colors.black,
          //         child: CircleAvatar(
          //           //  backgroundColor: Color.fromARGB(255, 37, 196, 129),
          //           backgroundImage: AssetImage("assets/images/prof1.jpeg"),
          //           radius: 50,
          //         ),
          //       ),
          //     ),
          //   ],
          // ),
          SizedBox(
            height: 0,
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "My Footprint",
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: "Body",
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: 4,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Your carbon footprint in kg if you lived like today every day of the year",
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: "Name",
                      fontWeight: FontWeight.w800,
                      color: Colors.black54,
                    ),
                  ),
                ),
                SizedBox(
                  height: 13,
                ),
                Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 400,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: Color.fromARGB(255, 255, 255, 255),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromRGBO(38, 41, 37, 0.29),
                              blurRadius: 8,
                              offset: Offset(0, 1),
                            ),
                          ],
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.all(40.0),
                        child: CircleAvatar(
                          backgroundImage:
                              AssetImage("assets/images/earth.png"),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 90,
                              ),
                              Text(
                                "500",
                                style: TextStyle(
                                  fontSize: 64,
                                  fontFamily: "Body",
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: 2.5,
                                ),
                              ),
                              Text(
                                "kg of CO2 per year",
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Revive",
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    /////home icon
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Tree()),
                        );
                      },
                      child: buildIcon(
                        shadowColor: Color.fromRGBO(154, 241, 165, 0.278),
                        icon: Icons.home,
                        padd: EdgeInsets.all(40.0),
                        color: Colors.green[400],
                      ),
                    ),

                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => TreeLived()),
                        );
                      },
                      child: buildIcon(
                        shadowColor: Color.fromRGBO(154, 241, 165, 0.278),
                        icon: Icons.fastfood,
                        padd: EdgeInsets.only(
                          top: 330,
                          left: 280,
                        ),
                        color: Colors.green[400],
                      ),
                    ),

                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => TreeLived()),
                        );
                      },
                      child: buildIcon(
                        padd: EdgeInsets.only(left: 37, top: 330),
                        shadowColor: Color.fromRGBO(154, 241, 165, 0.278),
                        icon: Icons.access_time,
                        color: Colors.green[400],
                      ),
                    ),

                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Tree()),
                        );
                      },
                      child: buildIcon(
                        padd: EdgeInsets.only(top: 40, left: 280),
                        shadowColor: Color.fromRGBO(154, 241, 165, 0.278),
                        icon: Icons.bus_alert,
                        color: Colors.green[400],
                      ),
                    ),
                  ],
                ),
                // SizedBox(
                //   height: 20,
                // ),
                // Center(
                //   child: GestureDetector(
                //     onTap: () {
                //       navigate(context, Tree());
                //     },
                //     child: Container(
                //       height: 50,
                //       width: 230,
                //       decoration: BoxDecoration(
                //         color: Colors.red[400],
                //         borderRadius: BorderRadius.circular(17),
                //         boxShadow: [
                //           BoxShadow(
                //             color: Color.fromRGBO(38, 41, 37, 0.29),
                //             blurRadius: 1,
                //             offset: Offset(0, 1),
                //           ),
                //         ],
                //       ),
                //       child: Center(
                //         child: Text(
                //           "just click it !",
                //           style: TextStyle(
                //             color: Colors.white,
                //             fontSize: 20,
                //             fontFamily: "Revive",
                //             fontWeight: FontWeight.bold,
                //           ),
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
                // SizedBox(
                //   height: 40,
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
