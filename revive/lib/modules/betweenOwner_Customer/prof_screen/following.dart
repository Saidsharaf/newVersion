import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:revive/layout/home_layout.dart';
import 'package:revive/modules/betweenOwner_Customer/prof_screen/cubitFollowing/cubit.dart';
import 'package:revive/modules/betweenOwner_Customer/prof_screen/cubitFollowing/state.dart';
import 'package:revive/shared/component/component.dart';
import 'package:revive/shared/network/end_point.dart';

class Following extends StatefulWidget {
  const Following({super.key});

  @override
  State<Following> createState() => _FollowersState();
}

class _FollowersState extends State<Following> {
  // List<String> followers =
  //     List.generate(10, (index) => "hodasalama${index + 1}");

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FollowingCubit()..showFollowing(),
      child: BlocConsumer<FollowingCubit, FollowingStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = FollowingCubit.get(context);
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
                    // cubit.deleteFollow(
                    //     id: cubit.users[index]["userfollowing"]["id"]);
                    cubit.users.removeAt(index);
                    // showToast(
                    //     msg: cubit.deleteFollowModel!.msg,
                    // state: toastStates.SUCCESS);
                   // navigate(context, Following());
                  });
                },
                child: const Text(
                  "Follow",
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
              title: const Text("Following"),
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
                          cubit.users[index]["userfollowing"]["profile_photo"]),
                    ),
                    title:
                        Text(cubit.users[index]["userfollowing"]["username"]),
                    subtitle:
                        Text(cubit.users[index]["userfollowing"]["email"]),
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
            // followers.removeAt(index);
          });
        },
        child: const Text(
          "Follow",
          style: TextStyle(
            fontSize: 10.0,
            color: Colors.white,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
