import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:revive/models/appModel/adminModel/allUsers/cubit.dart';
import 'package:revive/models/appModel/adminModel/allUsers/states.dart';
import 'package:revive/modules/Admin/Users/user.dart';
import 'package:revive/shared/component/component.dart';
import 'package:revive/shared/network/end_point.dart';
import 'package:revive/shared/network/local/shared_pref.dart';

class OneUser extends StatelessWidget {
  const OneUser({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AllUsersCubit()..showALlUsers(type: "CUSTOMER"),
      child: BlocConsumer<AllUsersCubit, AllUsersStates>(
        listener: (context, state) {
          // if (state is allUsersSuccessState) {
          //   if (state.allUsersModel.status!) {
          //     print(state.allUsersModel.users![int.parse(sharedPref.getData(key: "id"))].username);
          //   }
          //   }
        },
        builder: (context, state) {
          // var cubit = AllUsersCubit.get(context);
          return state is allUsersSuccessState
              ? Scaffold(
                  appBar: AppBar(
                    leading: IconButton(
                        onPressed: () {
                          navigateAndFinish(context, Users());
                        },
                        icon: Icon(Icons.arrow_back)),
                  ),
                  body: Column(
                    children: [
                      CircleAvatar(
                        radius: 100,
                        backgroundImage: NetworkImage(
                          server +
                              state
                                  .allUsersModel
                                  .users![sharedPref.getData(key: "id")]
                                  .profilePhoto!,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          children: [
                            Text("Name : "),
                            Container(
                              height: 50,
                              width: 150,
                              child: TextFormField(
                                initialValue: state
                                    .allUsersModel
                                    .users![sharedPref.getData(key: "id")]
                                    .username,
                                cursorColor: Colors.grey,
                                decoration: InputDecoration(
                                  border: UnderlineInputBorder(
                                      borderSide: BorderSide.none),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              :  Center(
                  child: CircularProgressIndicator(
                  color: Colors.green,
                  backgroundColor: Colors.grey[300],
                ));
        },
      ),
    );
  }
}
