import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:revive/layout/cubit/cubit.dart';
import 'package:revive/layout/cubit/states.dart';
import 'package:revive/models/slider/listofslider.dart';

// ignore: must_be_immutable
class HomeLayout extends StatelessWidget {
  HomeLayout({super.key, required this.index});
  int index, count = 0;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCubit(),
      child: BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = NewsCubit.get(context);
          if (index != 0 && count == 0) {
            cubit.currentIndex = index;
            count++;
          }
          return ConditionalBuilder(
            condition: true,
            builder: (context) => Scaffold(
              extendBody: true,
              backgroundColor: Colors.grey[100],
              appBar: AppBar(
                actions: const [
                  CircleAvatar(
                    radius: 23,
                    backgroundColor: Color.fromARGB(255, 68, 124, 70),
                    child: CircleAvatar(
                      radius: 21.3,
                      backgroundImage: AssetImage("assets/images/prof1.jpeg"),
                    ),
                  ),
                  SizedBox(
                    width: 6,
                  ),
                ],
                title: Text(
                  cubit.title[cubit.currentIndex],
                  style: TextStyle(
                    fontFamily: "Title",
                    color: Color.fromARGB(255, 68, 124, 70),
                  ),
                ),
                titleTextStyle: TextStyle(
                  fontSize: 33,
                ),
                centerTitle: true,
                // leading: Padding(
                //   padding: const EdgeInsets.only(top: 6),
                //   child: IconButton(
                //     onPressed: () {
                //       navigate(context, chat());
                //     },
                //     icon: Icon(
                //       Icons.chat,
                //       size: 32,
                //       color: Color.fromARGB(255, 68, 124, 70),
                //     ),
                //   ),
                // ),
              ),
              body: cubit.screens[cubit.currentIndex],
              bottomNavigationBar: CurvedNavigationBar(
                color: Color.fromRGBO(106, 192, 66, 1),
                height: 50,
                animationCurve: Easing.linear,
                backgroundColor: Colors.transparent,
                animationDuration: Duration(milliseconds: 500),
                items: cubit.itemIcons,
                index: cubit.currentIndex,
                onTap: (value) {
                  cubit.changeNav(value);
                },
              ),
              drawer: Drawer(
                backgroundColor: Color.fromARGB(255, 14, 100, 57),
                child: headofslider(
                  userName: "Said Sharaf",
                  email: "saidsharaf209@gmail.com",
                  backgroundImage: "assets/images/soft.jpg",
                  imageOfprof: "assets/images/prof1.jpeg",
                ),
              ),
            ),
            fallback: (context) => Center(child: CircularProgressIndicator()),
          );
        },
      ),
    );
  }
}
