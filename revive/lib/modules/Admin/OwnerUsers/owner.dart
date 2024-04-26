import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:revive/models/appModel/adminModel/allUsers/cubit.dart';
import 'package:revive/models/appModel/adminModel/allUsers/states.dart';
import 'package:revive/modules/Admin/home_admin/audience.dart';
import 'package:revive/shared/component/component.dart';
import 'package:revive/shared/network/end_point.dart';
import 'package:revive/shared/network/local/shared_pref.dart';

class OwnerUsers extends StatelessWidget {
  const OwnerUsers({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AllUsersCubit()..showALlUsers(type: "OWNER"),
      child: BlocConsumer<AllUsersCubit, AllUsersStates>(
        listener: (context, state) {
          // if(state is allUsersSuccessState){
          //   state.allUsersModel.users![0];
          // }
        },
        builder: (context, state) {
          var cubit = AllUsersCubit.get(context);
          return state is allUsersSuccessState
              ? Scaffold(
                  appBar: AppBar(
                    title: Text("Owners"),
                    centerTitle: true,
                      leading: IconButton(
                        onPressed: () {
                          navigateAndFinish(context, Audience());
                        },
                        icon: Icon(Icons.arrow_back)),
                  ),
                  body: ListView.builder(
                    itemCount: state.allUsersModel.users!.length,
                    itemBuilder: (context, index) {
                      return Slidable(
                        key: const ValueKey(0),
                        startActionPane: ActionPane(
                          // A motion is a widget used to control how the pane animates.
                          motion: const ScrollMotion(),
                  
                          // A pane can dismiss the Slidable.
                          dismissible: DismissiblePane(onDismissed: () {
                            cubit.DeleteOwners(
                                id: state.allUsersModel.users![index].id);
                          }),
                  
                          // All actions are defined in the children parameter.
                          children: [
                            // A SlidableAction can have an icon and/or a label.
                            SlidableAction(
                              onPressed: (context) {},
                              backgroundColor: Color(0xFFFE4A49),
                              foregroundColor: Colors.white,
                              icon: Icons.delete,
                              label: 'Delete',
                            ),
                            SlidableAction(
                              onPressed: (context) {},
                              backgroundColor: Color(0xFF21B7CA),
                              foregroundColor: Colors.white,
                              icon: Icons.share,
                              label: 'Share',
                            ),
                          ],
                        ),
                        child: Card(
                          child: ListTile(
                            leading: CircleAvatar(
                              radius: 28,
                              backgroundImage: NetworkImage( server +
                                    state.allUsersModel.users![index]
                                        .profilePhoto!,),
                            ),
                            title:
                                Text(state.allUsersModel.users![index].username!),
                            subtitle:
                                Text(state.allUsersModel.users![index].email!),
                            trailing: Icon(Icons.arrow_forward),
                          ),
                        ),
                      );
                    },
                  ),
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
