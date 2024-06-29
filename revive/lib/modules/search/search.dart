import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:revive/modules/search/addFollowToOther/secProfile.dart';
import 'package:revive/modules/search/cubit/cubit.dart';
import 'package:revive/modules/search/cubit/state.dart';
import 'package:revive/shared/component/component.dart';
import 'package:revive/shared/network/end_point.dart';
import 'package:revive/shared/network/local/shared_pref.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    var searchController = TextEditingController();
    return BlocProvider(
      create: (context) => SearchCubit(),
      child: BlocConsumer<SearchCubit, SearchStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = SearchCubit.get(context);
          bool isSearch = false;
          Widget buildSearch(index) {
            return GestureDetector(
              onTap: () {
                print(index + 1);
                sharedPref.saveData(key: "searchId", value: index );
                navigate(context, secProfile());
              },
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundImage: NetworkImage(
                        server + cubit.users[index]["profile_photo"]),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          cubit.users[index]["username"],
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          cubit.users[index]["email"],
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }

          return Scaffold(
            appBar: AppBar(),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  defultFormField(
                    controller: searchController,
                    type: TextInputType.text,
                    lable: "search",
                    suffix: Icons.search,
                    onChange: (value) {
                      cubit.showSearch(query: value);
                      sharedPref.saveData(
                          key: "searchController", value: value);
                      isSearch = true;
                    },
                  ),
                  BlocBuilder<SearchCubit, SearchStates>(
                    builder: (context, state) {
                      if (state is searchSuccessState) {
                        return Expanded(
                          child: ListView.separated(
                            separatorBuilder: (context, index) => SizedBox(
                              height: 15,
                            ),
                            itemCount: cubit.users.length,
                            itemBuilder: (context, index) => buildSearch(index),
                          ),
                        );
                      } else
                        return isSearch
                            ? CircularProgressIndicator(
                                color: Colors.green,
                              )
                            : Container();
                    },
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
