import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:revive/layout/home_layout.dart';
import 'package:revive/modules/betweenOwner_Customer/prof_screen/cubitFollow/cubit.dart';
import 'package:revive/modules/betweenOwner_Customer/prof_screen/cubitFollow/state.dart';
import 'package:revive/shared/component/component.dart';
import 'package:revive/shared/network/end_point.dart';

class Followers extends StatefulWidget {
  const Followers({super.key});

  @override
  State<Followers> createState() => _FollowersState();
}

class _FollowersState extends State<Followers> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FollowerCubit()..showFollow(),
      child: BlocConsumer<FollowerCubit, FollowerStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = FollowerCubit.get(context);
          Widget _removeBtn(BuildContext context, int index) {
            return SizedBox(
              child: MaterialButton(
                elevation: 2.0,
                highlightElevation: 0.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                color: Colors.green,
                onPressed: () {
                  setState(() {
                    cubit.deleteFollow(
                        id: cubit.users[index]["userfollowers"]["id"]);
                    // followers.removeAt(index);
                  });
                },
                child: const Text(
                  "Remove",
                  style: TextStyle(
                    fontSize: 10.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            );
          }

          return Scaffold(
            appBar: AppBar(
              title: const Text("Followers"),
              centerTitle: true,
              leading: IconButton(
                onPressed: () {
                  navigateAndFinish(
                      context,
                      HomeLayout(
                        index: 3,
                      ));
                },
                icon: const Icon(Icons.arrow_back),
              ),
            ),
            body: ListView.builder(
              itemCount: cubit.users.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    onTap: () {},
                    leading: CircleAvatar(
                      radius: 28,
                      backgroundImage: NetworkImage(server +
                          cubit.users[index]["userfollowers"]["profile_photo"]),
                    ),
                    title:
                        Text(cubit.users[index]["userfollowers"]["username"]),
                    subtitle:
                        Text(cubit.users[index]["userfollowers"]["email"]),
                    trailing: _removeBtn(context, index),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}








// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:revive/modules/LoginAndReg/login.dart';
// import 'package:revive/shared/component/component.dart';

// class Followers extends StatelessWidget {
//   const Followers({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Followers"),
//         centerTitle: true,
//         leading: IconButton(
//           onPressed: () {
//             navigateAndFinish(context, loginScreen());
//           },
//           icon: const Icon(Icons.arrow_back),
//         ),
//       ),
//       body: ListView.builder(
//         itemCount: 10,
//         itemBuilder: (context, index) {
//           return Card(
//             child: ListTile(
//               onTap: () {},
//               leading: CircleAvatar(
//                 radius: 28,
//                 backgroundImage: const AssetImage("assets/images/prof1.jpeg"),
//               ),
//               title: const Text("hodasalama89"),
//               subtitle: const Text("Hoda Salama"),
//               trailing: _removeBtn(context),
//             ),
//           );
//         },
//       ),
//     );
//   }

//   Widget _removeBtn(BuildContext context) {
//     return SizedBox(
//       child: MaterialButton(
//         elevation: 2.0,
//         highlightElevation: 0.0,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(20.0),
//         ),
//         padding: const EdgeInsets.symmetric(vertical: 8.0),
//         color: Color.fromARGB(61, 158, 158, 158),
//         onPressed: () => Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => loginScreen()),
//         ),
//         child: const Text(
//           "Remove",
//           style: TextStyle(
//             fontSize: 10.0,
//             color: Colors.white,
//             fontWeight: FontWeight.w400,
//           ),
//         ),
//       ),
//     );
//   }
// }
