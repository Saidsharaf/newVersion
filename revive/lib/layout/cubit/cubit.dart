import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:revive/layout/cubit/states.dart';
import 'package:revive/modules/Customer/footprint_Page/footprint_customer.dart';
import 'package:revive/modules/Owner/machine_screen/machine.dart';
import 'package:revive/modules/betweenOwner_Customer/posts_Screen/posts.dart';
import 'package:revive/modules/betweenOwner_Customer/prof_screen/prof.dart';
import 'package:revive/modules/betweenOwner_Customer/settings_screen/settings.dart';
import 'package:revive/modules/footprint_screen/footprint.dart';
import 'package:revive/shared/network/local/shared_pref.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitialState());
  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  List<BottomNavigationBarItem> bottomItems = [
    BottomNavigationBarItem(
      icon: Icon(Icons.bar_chart_rounded),
      label: "Footprint",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.factory_outlined),
      label: "Machine",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person),
      label: "Profile",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.settings),
      label: "Settings",
    ),
  ];

  List<Widget> screens = [
    sharedPref.getData(key: "role")==3? FootprintCustomer(): Footprint(),
    Machine(),
    Posts(),
    Prof(),
    Settings(),
  ];
  void changeNav(int value) {
    currentIndex = value;
    emit(NewsChangeBottomNavState());
  }

  List<String> title = [
    "Footprint",
    "Machine",
    "Post",
    "Profile",
    "Setting",
  ];

  List<Icon> itemIcons = [
    Icon(
      Icons.bar_chart_rounded,
      color: Colors.white,
    ),
    Icon(
      Icons.precision_manufacturing_sharp,
      color: Colors.white,
    ),
    Icon(
      Icons.post_add_rounded,
      color: Colors.white,
    ),
    Icon(
      Icons.person,
      color: Colors.white,
    ),
    Icon(
      Icons.settings,
      color: Colors.white,
    ),
  ];
}

//  bottomNavigationBar: CurvedNavigationBar(
//         backgroundColor: Colors.transparent,
//         animationDuration: Duration(milliseconds: 400),
//           index: currentIndex,
//           onTap: (value) {
//             setState(() {
//               currentIndex = value;
//               print(value);
//             });
//           },
//           items: [
//             Icon(Icons.home),
//             Icon(Icons.grass),
//             Icon(Icons.add_circle_outline_sharp),
//             Icon(Icons.person),
//             Icon(Icons.chat),
//           ]),

