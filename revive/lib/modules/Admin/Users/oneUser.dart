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
          var cubit = AllUsersCubit.get(context);
          return state is allUsersSuccessState
              ? Scaffold(
                  appBar: AppBar(
                    leading: IconButton(
                        onPressed: () {
                          navigateAndFinish(context, Users());
                        },
                        icon: Icon(Icons.arrow_back)),
                  ),
                  body: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 20.0,
                        right: 20,
                        top: 40,
                      ),
                      child: Container(
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
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Image.network(
                                  server +
                                      state
                                          .allUsersModel
                                          .users![sharedPref.getData(key: "id")]
                                          .profilePhoto!,
                                  // height: 150,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(height: 16),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "${state.allUsersModel.users![sharedPref.getData(key: "id")].username}",
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              SizedBox(height: 16),
                              TextFormField(
                                initialValue: state
                                    .allUsersModel
                                    .users![sharedPref.getData(key: "id")]
                                    .password,
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
                                    value: 'admin',
                                  ),
                                  DropdownMenuItem(
                                    child: Text('Customer'),
                                    value: 'customer',
                                  ),
                                  DropdownMenuItem(
                                    child: Text('Owner'),
                                    value: 'owner',
                                  ),
                                ],
                                onChanged: (value) {
                                  cubit.changeDropBtn(value);
                                  print(value);
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )

                  // Column(
                  //   children: [
                  //     CircleAvatar(
                  //       radius: 100,
                  //       backgroundImage: NetworkImage(
                  //         server +
                  //             state
                  //                 .allUsersModel
                  //                 .users![sharedPref.getData(key: "id")]
                  //                 .profilePhoto!,
                  //       ),
                  //     ),
                  //     SizedBox(
                  //       height: 20,
                  //     ),
                  //     Padding(
                  //       padding: const EdgeInsets.all(8.0),
                  //       child: Container(
                  //         height: 170,
                  //         decoration: BoxDecoration(
                  //           color: Colors.blueGrey,
                  //           borderRadius: BorderRadius.circular(5),
                  //         ),
                  //         child: Column(
                  //           children: [
                  //             Padding(
                  //               padding: const EdgeInsets.all(20.0),
                  //               child: Row(
                  //                 children: [
                  //                   Text(
                  //                     "Name :  ",
                  //                     style: TextStyle(
                  //                         color: Colors.white,
                  //                         fontFamily: "Inter"),
                  //                   ),
                  //                   Text(
                  //                     "${state.allUsersModel.users![sharedPref.getData(key: "id")].username}",
                  //                     style: TextStyle(
                  //                         color: Colors.white,
                  //                         fontFamily: "Body"),
                  //                   ),
                  //                 ],
                  //               ),
                  //             ),
                  //             Padding(
                  //               padding:
                  //                   const EdgeInsets.only(left: 20, bottom: 20),
                  //               child: Row(
                  //                 children: [
                  //                   Text(
                  //                     "Role : ",
                  //                     style: TextStyle(
                  //                         color: Colors.white,
                  //                         fontFamily: "Inter"),
                  //                   ),
                  //                   Container(
                  //                     height: 35,
                  //                     width: 130,
                  //                     decoration: BoxDecoration(
                  //                       color:
                  //                           Color.fromARGB(255, 111, 144, 160),
                  //                       borderRadius: BorderRadius.circular(5),
                  //                     ),
                  //                     child: Center(
                  //                       child: DropdownButton(
                  //                         style: TextStyle(color: Colors.white),
                  //                         items: [
                  //                           DropdownMenuItem(
                  //                             child: Text(
                  //                               "Customer",
                  //                               style: TextStyle(
                  //                                   color: Colors.white,
                  //                                   fontFamily: "Body"),
                  //                             ),
                  //                             value: "Customer",
                  //                           ),
                  //                           DropdownMenuItem(
                  //                             child: Text(
                  //                               "Admin",
                  //                               style: TextStyle(
                  //                                   color: Colors.white,
                  //                                   fontFamily: "Body"),
                  //                             ),
                  //                             value: "Admin",
                  //                           ),
                  //                           DropdownMenuItem(
                  //                             child: Text(
                  //                               "Owner",
                  //                               style: TextStyle(
                  //                                   color: Colors.white,
                  //                                   fontFamily: "Body"),
                  //                             ),
                  //                             value: "Owner",
                  //                           ),
                  //                         ],
                  //                         onChanged: (value) {},
                  //                         value: "Customer",
                  //                         icon: Icon(
                  //                           Icons.menu,
                  //                           color: Colors.white,
                  //                           size: 15,
                  //                         ),
                  //                         underline: Container(
                  //                           height: 2,
                  //                           color: Colors.white12,
                  //                         ),
                  //                       ),
                  //                     ),
                  //                   ),
                  //                 ],
                  //               ),
                  //             ),
                  //             Padding(
                  //               padding: const EdgeInsets.only(left: 20.0),
                  //               child: Row(
                  //                 children: [
                  //                   Text(
                  //                     "Password :  ",
                  //                     style: TextStyle(
                  //                         color: Colors.white,
                  //                         fontFamily: "Inter"),
                  //                   ),
                  //                   Container(
                  //                     height: 50,
                  //                     width: 130,
                  //                     child: TextFormField(
                  //                       maxLength: 20,
                  //                       initialValue: state
                  //                           .allUsersModel
                  //                           .users![
                  //                               sharedPref.getData(key: "id")]
                  //                           .username,
                  //                       cursorColor: Colors.grey,
                  //                       decoration: InputDecoration(
                  //                         border: UnderlineInputBorder(
                  //                             borderSide: BorderSide.none),
                  //                       ),
                  //                     ),
                  //                   ),
                  //                 ],
                  //               ),
                  //             ),
                  //           ],
                  //         ),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  )
              : Center(
                  child: CircularProgressIndicator(
                  color: Colors.green,
                  backgroundColor: Colors.grey[300],
                ));
        },
      ),
    );
  }
}
