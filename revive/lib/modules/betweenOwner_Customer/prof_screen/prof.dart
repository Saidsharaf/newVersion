import 'package:flutter/material.dart';
import 'package:revive/modules/myfootprint_screen/myfootprint.dart';
import 'package:revive/shared/network/end_point.dart';
import 'package:revive/shared/network/local/shared_pref.dart';
//import 'package:revive/modules/footprint_screen/footprint.dart';
import 'package:revive/tabs/saved_post.dart';

class Prof extends StatefulWidget {
  const Prof({super.key});

  @override
  State<Prof> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Prof> {
  final List<Widget> tabs = [
    Tab(
      icon: Icon(
        Icons.home,
        color: Colors.green[400],
      ),
    ),
    Tab(
      icon: Icon(
        Icons.video_collection,
        color: Colors.green[400],
      ),
    ),
    Tab(
      icon: Icon(
        Icons.bookmark,
        color: Colors.green[400],
      ),
    ),
  ];

  //pages
  final List<Widget> tabBarViews = [
    //posts
    Myfootprint(),

    // footprint
    SavedPost(),

    //savedpost
    SavedPost(),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
            body: ListView(
          children: [
            SizedBox(
              height: 15,
            ),
            //profile details

            Stack(
              children: [
                Container(
                  height: 190,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/trees-3822149_1280.jpg"),
                      fit: BoxFit.cover,
                      opacity: 0.8,
                    ),
                    // borderRadius: BorderRadius.only(
                    //   bottomLeft: Radius.circular(0),
                    //   bottomRight: Radius.circular(0),
                    // ),
                  ),
                ),

                Center(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 100, right: 15, left: 15),
                    child: Container(
                      height: 215,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 252, 248, 248),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10)),
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromRGBO(161, 238, 136, 0.773),
                            blurRadius: 2,
                            offset: Offset(0, 1),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(30),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          physics: NeverScrollableScrollPhysics(),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 35,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Text(
                                  sharedPref.getData(key: "username"),
                                  style: TextStyle(
                                      fontFamily: "Body",
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                height: 80,
                                // width: 350,
                                decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 252, 248, 248),
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      // BoxShadow(
                                      // color:
                                      //   Color.fromRGBO(178, 245, 158, 0.294),
                                      //blurRadius: 20,
                                      // offset: Offset(0, 10),
                                      // ),
                                    ]),
                                child: Row(
                                  children: [
                                    Column(
                                      children: [
                                        Text(
                                          "Followers",
                                          style: TextStyle(
                                            color: Color.fromARGB(
                                                178, 58, 116, 40),
                                            //fontFamily: "Name",
                                            fontSize: 16,
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          "300",
                                          style: TextStyle(
                                            color: Color.fromARGB(
                                                178, 58, 116, 40),
                                            fontFamily: "Body",
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: 29,
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          "Following",
                                          style: TextStyle(
                                            color: Color.fromARGB(
                                                178, 58, 116, 40),
                                            // fontFamily: "Name",
                                            fontSize: 16,
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          "10K",
                                          style: TextStyle(
                                            color: Color.fromARGB(
                                                178, 58, 116, 40),
                                            fontFamily: "Body",
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: 35,
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          "Likes",
                                          style: TextStyle(
                                            color: Color.fromARGB(
                                                178, 58, 116, 40),
                                            // fontFamily: "Name",
                                            fontSize: 16,
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          "20",
                                          style: TextStyle(
                                            color: Color.fromARGB(
                                                178, 58, 116, 40),
                                            fontFamily: "Body",
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: 32,
                                    ),
                                  ],
                                ),

                                /////cdcd
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                //////////////////////////////////////
                Container(
                  padding: EdgeInsets.only(left: 138, top: 56),
                  child: CircleAvatar(
                    radius: 47,
                    backgroundColor: Color.fromARGB(255, 64, 218, 12),
                    child: CircleAvatar(
                      //  backgroundColor: Color.fromARGB(255, 37, 196, 129),
                      backgroundImage:NetworkImage(server+sharedPref.getData(key: "profilePic")),
                      radius: 51,
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(
              height: 10,
            ),
            /////////////////////////////////////////////////tab bar
            TabBar(
              tabs: tabs,
            ),

            SizedBox(height: 4000, child: TabBarView(children: tabBarViews)),
          ],
        )));
  }
}
