import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:revive/models/appModel/machine/cubit.dart';
import 'package:revive/models/appModel/machine/states.dart';
import 'package:revive/modules/Admin/Machine/addMachine.dart';
import 'package:revive/shared/component/component.dart';

class MachineAdmin extends StatelessWidget {
  const MachineAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MachineCubit(),
      child: BlocConsumer<MachineCubit, MachineStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = MachineCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text("Machine"),
              centerTitle: true,
            ),
            body: ListView(
              padding: EdgeInsets.zero,
              children: [
                SizedBox(
                  height: 12,
                ),
                Container(
                  color: Colors.white,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.only(topLeft: Radius.circular(100))),
                    child: GridView.count(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisCount: 2,
                      crossAxisSpacing: 40,
                      mainAxisSpacing: 30,
                      children: [
                        itemDashboard(
                            title: 'Delete',
                            iconData: CupertinoIcons.delete,
                            background: Colors.deepOrange,
                            onPress: () {
                              //nav and ask for api
                            }),
                        itemDashboard(
                            title: 'Add',
                            iconData: CupertinoIcons.add_circled,
                            background: const Color.fromARGB(255, 76, 163, 175),
                            onPress: () {
                              navigate(context, AddMahcine());
                            }),
                        itemDashboard(
                            title: 'Update',
                            iconData: CupertinoIcons.arrow_2_circlepath_circle,
                            background: Color.fromARGB(255, 170, 170, 77),
                            onPress: () {}),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20)
              ],
            ),
          );
        },
      ),
    );
  }

  itemDashboard(
          {String? title,
          IconData? iconData,
          Color? background,
          Function()? onPress}) =>
      GestureDetector(
        onTap: onPress,
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    offset: const Offset(0, 5),
                    color: Colors.green.withOpacity(.2),
                    spreadRadius: 2,
                    blurRadius: 5)
              ]),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: background,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(iconData, color: Colors.white)),
              const SizedBox(height: 8),
              Text(
                title!.toUpperCase(),
                // style: ,
              ),
            ],
          ),
        ),
      );
}
