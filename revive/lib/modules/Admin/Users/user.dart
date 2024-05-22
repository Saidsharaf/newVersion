import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:revive/models/appModel/adminModel/allUsers/cubit.dart';
import 'package:revive/models/appModel/adminModel/allUsers/states.dart';
import 'package:revive/modules/Admin/Machine/machineAdmin.dart';
import 'package:revive/modules/Admin/Users/oneUser.dart';
import 'package:revive/modules/Admin/home_admin/audience.dart';
import 'package:revive/shared/component/component.dart';
import 'package:revive/shared/network/end_point.dart';
import 'package:revive/shared/network/local/shared_pref.dart';

class Users extends StatelessWidget {
  const Users({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AllUsersCubit()..showALlUsers(type: "CUSTOMER"),
      child: BlocConsumer<AllUsersCubit, AllUsersStates>(
        listener: (context, state) {
          // if(state is allUsersSuccessState){
          //   state.allUsersModel.users![0];
          // }
        },
        builder: (context, state) {
          var cubit = AllUsersCubit.get(context);
          var list = cubit.users;
          return ConditionalBuilder(
            condition: state is allUsersSuccessState,
            builder: (context) => Scaffold(
              appBar: AppBar(
                title: Text("User"),
                centerTitle: true,
                leading: IconButton(
                    onPressed: () {
                      navigateAndFinish(context, Audience());
                    },
                    icon: Icon(Icons.arrow_back)),
              ),
              body: ListView.builder(
                itemCount: list.length,
                itemBuilder: (context, index) {
                  return Slidable(
                    key: const ValueKey(0),
                    startActionPane: ActionPane(
                      // A motion is a widget used to control how the pane animates.
                      motion: const ScrollMotion(),

                      // A pane can dismiss the Slidable.
                      dismissible: DismissiblePane(onDismissed: () {
                        cubit.DeleteUsers(
                            id: list[index]["id"]);
                      }),
                      // All actions are defined in the children parameter.
                      children: [
                        // A SlidableAction can have an icon and/or a label.
                        SlidableAction(
                          onPressed: (context) {
                            // cubit.DeleteUsers(
                            //     id: state.allUsersModel.users![index].id);
                          },
                          backgroundColor: Color(0xFFFE4A49),
                          foregroundColor: Colors.white,
                          icon: Icons.delete,
                          label: 'Delete',
                        ),
                        SlidableAction(
                          onPressed: (context) {
                            navigate(context, MachineAdmin());
                          },
                          backgroundColor: Color(0xFF21B7CA),
                          foregroundColor: Colors.white,
                          icon: Icons.factory_outlined,
                          label: 'Machine',
                        ),
                      ],
                    ),
                    child: Card(
                      child: ListTile(
                        onTap: () {
                          cubit.changeIndexNumber(index);
                          sharedPref.saveData(key: "id", value: index);
                          navigateAndFinish(context, OneUser());
                        },
                        leading: CircleAvatar(
                          radius: 28,
                          backgroundImage: NetworkImage(
                            server +
                              list[index]["profile_photo"],
                          ),
                        ),
                        title:
                            Text(list[index]["username"]),
                        subtitle:
                            Text(list[index]["email"]),
                        trailing: Icon(Icons.arrow_forward),
                      ),
                    ),
                  );
                },
              ),
            ),
            fallback: (context) => Center(
              child: CircularProgressIndicator(
                color: Colors.green,
                backgroundColor: Colors.grey[300],
              ),
            ),
          );
        },
      ),
    );
  }
}
