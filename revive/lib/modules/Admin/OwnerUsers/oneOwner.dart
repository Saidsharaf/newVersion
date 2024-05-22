import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:revive/models/appModel/adminModel/allUsers/cubit.dart';
import 'package:revive/models/appModel/adminModel/allUsers/states.dart';
import 'package:revive/modules/Admin/OwnerUsers/owner.dart';
import 'package:revive/modules/Admin/home_admin/audience.dart';
import 'package:revive/shared/component/component.dart';
import 'package:revive/shared/network/end_point.dart';
import 'package:revive/shared/network/local/shared_pref.dart';

class OneOwner extends StatelessWidget {
  const OneOwner({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AllUsersCubit()..showALlUsers(type: "OWNER"),
      child: BlocConsumer<AllUsersCubit, AllUsersStates>(
        listener: (context, state) {
          // if (state is allUsersSuccessState) {
          //   if (state.allUsersModel.status!) {
          //     print(state.allUsersModel.users![int.parse(sharedPref.getData(key: "id"))].username);
          //   }
          //   }
        },
        builder: (context, state) {
          var cubit = AllUsersCubit.get(context);
          var list = cubit.users;
          var msgRole = cubit.msgRole;
          var stat = cubit.stat;
          return ConditionalBuilder(
            condition: state is allUsersSuccessState,
            builder: (context) => Scaffold(
              appBar: AppBar(
                leading: IconButton(
                    onPressed: () {
                      navigateAndFinish(context, OwnerUsers());
                    },
                    icon: Icon(Icons.arrow_back)),
              ),
              body: Padding(
                padding: const EdgeInsets.only(
                  left: 20.0,
                  right: 20,
                  top: 40,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        width: 330,
                        height: 450,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Image.network(
                                    server + list[sharedPref.getData(key: "idOwner")]["profile_photo"],
                                    // height: 150,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(height: 1),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "${list[sharedPref.getData(key: "idOwner")]["username"]}",
                                    style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                SizedBox(height: 16),
                                TextFormField(
                                  // initialValue: state
                                  //     .allUsersModel
                                  //     .users![sharedPref.getData(key: "id")]
                                  //     .password,
                                  initialValue: "12345678",
                                  decoration: InputDecoration(
                                    labelText: 'Password',
                                  ),
                                ),
                                SizedBox(height: 16),
                                DropdownButton<String>(
                                  value: cubit.valueChosen,
                                  items: [
                                    DropdownMenuItem(
                                      child: Text('Admin'),
                                      value: '1',
                                    ),
                                    DropdownMenuItem(
                                      child: Text('Customer'),
                                      value: '3',
                                    ),
                                    DropdownMenuItem(
                                      child: Text('Owner'),
                                      value: '2',
                                    ),
                                  ],
                                  onChanged: (value) {
                                    cubit.changeDropBtnOwner(value);
                                    print(value);
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 29,
                      ),
                      GestureDetector(
                        onTap: () {
                          cubit.ModifyRole(id: list[sharedPref.getData(key: "idOwner")]["id"],role:int.tryParse(cubit.valueChosen) ,);
                          // showToast(
                          //     msg: msgRole,
                          //     state:stat? toastStates.SUCCESS:toastStates.ERROR,);
                          navigateAndFinish(context, Audience());
                        },
                        child: Container(
                          height: 50,
                          width: 250,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 102, 173, 105),
                            borderRadius: BorderRadius.circular(7),
                          ),
                          child: Center(
                              child: Text(
                            "UPDATE",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          )),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            fallback: (context) => Center(
                child: CircularProgressIndicator(
              color: Colors.green,
              backgroundColor: Colors.grey[300],
            )),
          );
        },
      ),
    );
  }
}
