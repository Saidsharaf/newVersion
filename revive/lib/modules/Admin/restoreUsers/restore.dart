import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:revive/modules/Admin/home_admin/homeAdmin.dart';
import 'package:revive/modules/Admin/restoreUsers/cubit/cubit.dart';
import 'package:revive/modules/Admin/restoreUsers/cubit/state.dart';
import 'package:revive/shared/component/component.dart';
import 'package:revive/shared/network/end_point.dart';

class RestoreUsers extends StatelessWidget {
  const RestoreUsers({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RestoreCubit()..userShowRestore(),
      child: BlocConsumer<RestoreCubit, RestoreStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = RestoreCubit.get(context);
          var list = cubit.users;
          return ConditionalBuilder(
            condition: state is showRestoreSuccessState,
            builder: (context) {
              return Scaffold(
                appBar: AppBar(
                  title: Text("Restore Users"),
                  centerTitle: true,
                  leading: IconButton(
                    onPressed: () {
                      navigateAndFinish(context, HomeAdmin());
                    },
                    icon: Icon(Icons.arrow_back),
                  ),
                ),
                body: ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    return Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      elevation: 4,
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                            ),
                            child: Image.network(
                              server + list[index]["profile_photo"],
                              height: 250,
                              width: MediaQuery.of(context).size.width,
                              fit: BoxFit.fill,
                            ),
                          ),
                          ListTile(
                            title: Text(
                              list[index]["username"],
                              style: TextStyle(fontSize: 20),
                            ),
                            trailing: Text(
                              'id: ${list[index]["id"]}',
                              style: TextStyle(fontSize: 20),
                            ),
                            subtitle: Text(
                              list[index]["email"],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: TextButton(
                              onPressed: () {
                                cubit.userRestore(id: list[index]["id"]);
                                navigate(context, RestoreUsers());
                              },
                              style: TextButton.styleFrom(
                                  backgroundColor: Colors.blue,
                                  minimumSize: Size(
                                      MediaQuery.of(context).size.width, 56)),
                              child: const Text(
                                'Restore User',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              );
            },
            fallback: (context) => Center(
              child: CircularProgressIndicator(
                color: Colors.green,
              ),
            ),
          );
        },
      ),
    );
  }
}
