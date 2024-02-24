import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:revive/layout/cubit/cubit.dart';
import 'package:revive/layout/cubit/states.dart';
import 'package:revive/layout/home_layout.dart';
import 'package:revive/modules/FactoryFootprint/questions_factory.dart';
import 'package:revive/modules/LoginAndReg/login.dart';
import 'package:revive/modules/chat_screen/chat.dart';
import 'package:revive/modules/report_screen/homeReport.dart';
import 'package:revive/shared/component/component.dart';
import 'package:revive/shared/network/local/shared_pref.dart';

class listOfslider extends StatelessWidget {
  const listOfslider({
    super.key,
    required this.txt,
    required this.icon,
    required this.press,
  });
  final String txt;
  final IconData icon;
  final void Function()? press;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 6, left: 10),
      child: ListTile(
        onTap: press,
        leading: Icon(
          icon,
          color: Colors.white,
        ),
        title: Text(
          txt,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class headofslider extends StatelessWidget {
  const headofslider({
    super.key,
    required this.email,
    required this.userName,
    required this.backgroundImage,
    required this.imageOfprof,
  });

  final String email, userName, backgroundImage, imageOfprof;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<NewsCubit>(
      create: (context) => NewsCubit(),
      child: BlocConsumer<NewsCubit, NewsStates>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = NewsCubit.get(context);
            return ListView(
              children: [
                UserAccountsDrawerHeader(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      opacity: .3,
                      image: AssetImage(
                        backgroundImage,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  accountName: Text(
                    userName,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16.2),
                  ),
                  accountEmail: Text(email),
                  currentAccountPicture: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      image: DecorationImage(
                        image: AssetImage(
                          imageOfprof,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                listOfslider(
                  txt: "Factory Footprint",
                  icon: Icons.border_left_rounded,
                  press: () {
                    navigate(
                      context,
                      QuestionsFactory(),
                    );
                  },
                ),
                listOfslider(
                  txt: "weekly report",
                  icon: Icons.poll_rounded,
                  press: () {
                    navigate(context, Report());
                  },
                ),
                listOfslider(
                  txt: "My Posts",
                  icon: Icons.paste_outlined,
                  press: () {},
                ),
                listOfslider(
                  txt: "Saved posts",
                  icon: Icons.save_rounded,
                  press: () {},
                ),
                listOfslider(
                  txt: "Trash posts",
                  icon: Icons.restore_from_trash,
                  press: () {},
                ),
                listOfslider(
                  txt: "Chat Rev",
                  icon: Icons.chat_outlined,
                  press: () {
                    navigate(context, chat());
                  },
                ),
                SizedBox(
                  height: 110,
                ),
                listOfslider(
                  txt: "Logout",
                  icon: Icons.logout_outlined,
                  press: () {
                    sharedPref.removeData(key: "token").then((value) {
                      if (value) {
                        navigateAndFinish(context, loginScreen());
                      }
                    });
                  },
                ),
              ],
            );
          }),
    );
  }
}
