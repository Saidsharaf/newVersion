import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:revive/layout/cubit/cubit.dart';
import 'package:revive/layout/cubit/states.dart';
import 'package:revive/modules/LoginAndReg/login.dart';
import 'package:revive/modules/Owner/FactoryFootprint/questions_factory.dart';
import 'package:revive/modules/Owner/Report/report.dart';
import 'package:revive/modules/betweenOwner_Customer/trash_Screen/trash_post.dart';
import 'package:revive/modules/chat_screen/chat.dart';
import 'package:revive/shared/component/component.dart';
import 'package:revive/shared/network/local/shared_pref.dart';
import 'package:flutter_svg/flutter_svg.dart';


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
        leading: Container(
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 63, 129, 67),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Icon(
            icon,
            color: Colors.white,
            size: 25,
          ),
        ),
        title: Text(
          txt,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class headofslider extends StatefulWidget {
  const headofslider({
    super.key,
    required this.email,
    required this.userName,
    required this.backgroundImage,
    required this.imageOfprof,
  });

  final String email, userName, backgroundImage, imageOfprof;

  @override
  State<headofslider> createState() => _headofsliderState();
}

class _headofsliderState extends State<headofslider> {
  bool isCheck = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<NewsCubit>(
      create: (context) => NewsCubit(),
      child: BlocConsumer<NewsCubit, NewsStates>(
          listener: (context, state) {},
          builder: (context, state) {
            //var cubit = NewsCubit.get(context);
            return ListView(
              children: [
                UserAccountsDrawerHeader(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      opacity: 1.0,
                      image: AssetImage(
                        "assets/images/forest.jpg",
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  accountName: Text(
                    widget.userName,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16.2),
                  ),
                  accountEmail: Text(widget.email),
                  currentAccountPicture: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      image: DecorationImage(
                        image: NetworkImage(
                          widget.imageOfprof,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),

              sharedPref.getData(key: "role")==3? Container():SvglistOfslider(
                  txt: "Factory Footprint",
                  icon: "assets/icons/factory-svgrepo-com.svg",
                  press: () {
                    navigate(context, QuestionsFactory());
                  },
                ),

                sharedPref.getData(key: "role")==3? Container():SvglistOfslider(
                  txt: "Weekly Report",
                  icon: "assets/icons/report-svgrepo-com.svg",
                  press: () {
                    navigate(context, ReportScreen());
                  },
                ),
                // listOfslider(
                //   txt: "My Posts",
                //   icon: Icons.paste_outlined,
                //   press: () {},
                // ),
                // listOfslider(
                //   txt: "Saved posts",
                //   icon: Icons.save_rounded,
                //   press: () {},
                // ),

                // Row(
                //   children: [
                //     Padding(
                //       padding: const EdgeInsets.only(left: 15),
                //       child: Container(
                //         child: ClipOval(
                //           child: Image.asset(
                //             "assets/images/factory.jpeg", // Replace with your image path
                //             width: 40,
                //             height: 35,
                //             fit: BoxFit.cover,
                //           ),
                //         ),
                //       ),
                //     ),
                //     SizedBox(
                //       width: 15,
                //     ),
                //     Text(
                //       'Factory Footprint',
                //       style: TextStyle(
                //         color: Colors.white,
                //         fontWeight: FontWeight.bold,
                //       ),
                //     ),
                //   ],
                // ),

                // SizedBox(
                //   height: 20,
                // ),
                // Row(
                //   children: [
                //     Padding(
                //       padding: const EdgeInsets.only(left: 15),
                //       child: Container(
                //         child: ClipOval(
                //           child: Image.asset(
                //             "assets/images/report.jpeg", // Replace with your image path
                //             width: 40,
                //             height: 40,
                //             fit: BoxFit.cover,
                //           ),
                //         ),
                //       ),
                //     ),
                //     SizedBox(
                //       width: 15,
                //     ),
                //     Text(
                //       'Weekly report',
                //       style: TextStyle(
                //         color: Colors.white,
                //         fontWeight: FontWeight.bold,
                //       ),
                //     ),
                //   ],
                // ),

                SvglistOfslider(
                  txt: "Trash post",
                  icon: "assets/icons/garbage-bin-svgrepo-com.svg",
                  press: () {
                    navigate(context, TrashPost());
                  },
                ),

                SvglistOfslider(
                  txt: "light mode",
                  icon: "assets/icons/light_mode.svg",
                  trailingWidget: Switch(
                    onChanged: (value) {
                      setState(() {
                        isCheck = !isCheck;
                      });
                    },
                    value: isCheck,
                  ),
                  press: () {
                    navigate(context, TrashPost());
                  },
                ),

                SvglistOfslider(
                  txt: "Chat ",
                  icon: "assets/icons/chat-chat-svgrepo-com.svg",
                  press: () {
                    navigate(context, chat());
                  },
                ),
                SizedBox(
                  height: 1,
                ),
                SvglistOfslider(
                  txt: "LogOut",
                  icon: "assets/icons/logout-svgrepo-com.svg",
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

class SvglistOfslider extends StatelessWidget {
  const SvglistOfslider({
    super.key,
    required this.txt,
    required this.icon,
    required this.press,
    this.color,
    this.trailingWidget,
  });
  final String txt;
  final String icon;
  final Color? color;
  final void Function()? press;
  final Widget? trailingWidget;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 6, left: 10),
      child: ListTile(
        onTap: press,
        leading: Container(
          child: SvgPicture.asset(
            icon,
            width: 40,
            height: 40,
            // colorFilter: ColorFilter.mode(Colors.red, BlendMode.srcIn),
          ),
        ),
        title: Text(
          txt,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        trailing: trailingWidget,
      ),
    );
  }
}
