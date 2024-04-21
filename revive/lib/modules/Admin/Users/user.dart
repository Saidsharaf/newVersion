import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:revive/models/appModel/adminModel/users/cubit.dart';
import 'package:revive/models/appModel/adminModel/users/states.dart';
import 'package:revive/shared/network/end_point.dart';
import 'package:revive/shared/network/local/shared_pref.dart';

class Users extends StatelessWidget {
  const Users({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShowUserCubit(),
      child: BlocConsumer<ShowUserCubit, ShowUserStates>(
        listener: (context, state) {
          
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text("User"),
              centerTitle: true,
            ),
            body: ListView.builder(
              itemCount: 8,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 28,
                      backgroundImage: NetworkImage(
                          server + sharedPref.getData(key: "profilePic")),
                    ),
                    title: Text(sharedPref.getData(key: "UserName")),
                    subtitle: Text(sharedPref.getData(key: "UserEmail")),
                    trailing: Icon(Icons.arrow_forward),
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
