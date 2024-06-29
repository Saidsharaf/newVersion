import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:revive/modules/LoginAndReg/component.dart';
import 'package:revive/modules/myfootprint_screen/myfootprint.dart';
import 'package:revive/modules/search/cubit/cubit.dart';
import 'package:revive/modules/search/cubit/state.dart';
import 'package:revive/shared/component/component.dart';
import 'package:revive/shared/network/end_point.dart';
import 'package:revive/shared/network/local/shared_pref.dart';

class secProfile extends StatefulWidget {
  const secProfile({super.key});

  @override
  State<secProfile> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<secProfile> {
  final List<Widget> tabs = [
    Tab(
      icon: Icon(
        Icons.home,
        color: Colors.green[400],
      ),
    ),
    // Tab(
    //   icon: Icon(
    //     Icons.video_collection,
    //     color: Colors.green[400],
    //   ),
    // ),
  ];

  // pages
  final List<Widget> tabBarViews = [
    Myfootprint(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit()
        ..showSearch(query: sharedPref.getData(key: "searchController")),
      child: BlocConsumer<SearchCubit, SearchStates>(
        listener: (context, state) {},
        builder: (context, state) {
          bool isPressed = false;
          var cubit = SearchCubit.get(context);
          print(sharedPref.getData(key: "searchId"));
          return state is searchSuccessState
              ? DefaultTabController(
                  length: 2,
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
                                  image: AssetImage(
                                      "assets/images/trees-3822149_1280.jpg"),
                                  fit: BoxFit.cover,
                                  opacity: 0.8,
                                ),
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(0),
                                  bottomRight: Radius.circular(0),
                                ),
                              ),
                            ),

                            Center(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 100, right: 15, left: 15),
                                child: Container(
                                  height: 270,
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 252, 248, 248),
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        topRight: Radius.circular(10),
                                        bottomLeft: Radius.circular(10),
                                        bottomRight: Radius.circular(10)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color.fromRGBO(
                                            161, 238, 136, 0.773),
                                        blurRadius: 2,
                                        offset: Offset(0, 1),
                                      ),
                                    ],
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(0),
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              right: 10, top: 40),
                                          child: Text(
                                            cubit.users[sharedPref.getData(
                                                key: "searchId")]['username'],
                                            style: TextStyle(
                                                fontFamily: "Body",
                                                fontSize: 18,
                                                fontWeight: FontWeight.w700),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 40,
                                        ),
                                        Container(
                                          height: 90,
                                          // width: 350,
                                          decoration: BoxDecoration(
                                              color: Color.fromARGB(
                                                  255, 252, 248, 248),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              boxShadow: [
                                                // BoxShadow(
                                                // color:
                                                //   Color.fromRGBO(178, 245, 158, 0.294),
                                                //blurRadius: 20,
                                                // offset: Offset(0, 10),
                                                // ),
                                              ]),

                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 30.0),
                                            child: Row(
                                              children: [
                                                Column(
                                                  children: [
                                                    GestureDetector(
                                                      onTap: () {
                                                        // navigate(context, Followers());
                                                      },
                                                      child: Text(
                                                        "Followers",
                                                        style: TextStyle(
                                                          color: Color.fromARGB(
                                                              178, 58, 116, 40),
                                                          //fontFamily: "Name",
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
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
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  width: 29,
                                                ),
                                                Column(
                                                  children: [
                                                    GestureDetector(
                                                      onTap: () {
                                                        // navigate(context, Following());
                                                      },
                                                      child: Text(
                                                        "Following",
                                                        style: TextStyle(
                                                          color: Color.fromARGB(
                                                              178, 58, 116, 40),
                                                          // fontFamily: "Name",
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
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
                                                        fontWeight:
                                                            FontWeight.bold,
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
                                                      "Post",
                                                      style: TextStyle(
                                                        color: Color.fromARGB(
                                                            178, 58, 116, 40),
                                                        // fontFamily: "Name",
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.normal,
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
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  width: 32,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 1,
                                        ),
                                        BlocBuilder<SearchCubit, SearchStates>(
                                          builder: (context, state) {
                                            if (state
                                                is addFollowSuccessState) {
                                              return ElevatedButton(
                                                onPressed: () {
                                                  cubit.addFollow(
                                                      followingID: cubit.users[
                                                              sharedPref.getData(
                                                                  key:
                                                                      "searchId")]
                                                          ['id']);
                                                  sharedPref.saveData(
                                                      key: "Follow",
                                                      value: "hue");
                                                  showToast(
                                                      msg: state
                                                          .addFollowModel.msg,
                                                      state:
                                                          toastStates.SUCCESS);
                                                  navigate(
                                                      context, secProfile());
                                                },
                                                style: ElevatedButton.styleFrom(
                                                  // ignore: dead_code
                                                  backgroundColor:
                                                      sharedPref.getData(
                                                                  key:
                                                                      "Follow") !=
                                                              null
                                                          // ignore: dead_code
                                                          ? Colors.grey
                                                          : Colors.green[400],
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                  padding: EdgeInsets.symmetric(
                                                    horizontal: 90,
                                                    vertical: 5,
                                                  ),
                                                ),
                                                child: Text(
                                                  // ignore: dead_code
                                                  sharedPref.getData(
                                                              key: "Follow") !=
                                                          null
                                                      ? "follow"
                                                      : "follwed",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontFamily: "Body",
                                                    fontSize: 20,
                                                  ),
                                                ),
                                              );
                                            } else {
                                              return ElevatedButton(
                                                onPressed: () {
                                                  isPressed = true;
                                                  cubit.addFollow(
                                                      followingID: cubit.users[
                                                              sharedPref.getData(
                                                                  key:
                                                                      "searchId")]
                                                          ['id']);
                                                          showToast(
                                                      msg: "u already followed him",
                                                      state:
                                                          toastStates.WARNING);
                                                  navigate(
                                                      context, secProfile());
                                                },
                                                style: ElevatedButton.styleFrom(
                                                  // ignore: dead_code
                                                  backgroundColor:
                                                      sharedPref.getData(
                                                                  key:
                                                                      "Follow") !=
                                                              null
                                                          ? Colors.grey
                                                          : Colors.green,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                  padding: EdgeInsets.symmetric(
                                                    horizontal: 90,
                                                    vertical: 5,
                                                  ),
                                                ),
                                                child: Text(
                                                  sharedPref.getData(
                                                              key: "Follow") !=
                                                          null
                                                      ? "follwed"
                                                      : "follow",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontFamily: "Body",
                                                    fontSize: 20,
                                                  ),
                                                ),
                                              );
                                            }
                                          },
                                        ),
                                      ],
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
                                backgroundColor:
                                    Color.fromARGB(255, 64, 218, 12),
                                child: CircleAvatar(
                                  //  backgroundColor: Color.fromARGB(255, 37, 196, 129),
                                  backgroundImage: NetworkImage(server +
                                      cubit.users[sharedPref.getData(
                                          key: "searchId")]['profile_photo']),
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
                        Myfootprint(),
                      ],
                    ),
                  ),
                )
              : Center(
                  child: CircularProgressIndicator(
                    color: Colors.green,
                  ),
                );
        },
      ),
    );
  }
}
