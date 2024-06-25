import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:revive/modules/betweenOwner_Customer/post_screen/cubitShowAllPosts/cubit.dart';
import 'package:revive/modules/betweenOwner_Customer/post_screen/cubitShowAllPosts/state.dart';
import 'package:revive/shared/component/component.dart';
import 'package:revive/shared/network/end_point.dart';
import 'package:revive/shared/network/local/shared_pref.dart';
import 'package:revive/tabs/my_post_details.dart';

class MyPost extends StatelessWidget {
  const MyPost({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShowAllPostsCubit()..showMyPosts(),
      child: BlocConsumer<ShowAllPostsCubit, ShowAllPostsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: MasonryGridView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: context.read<ShowAllPostsCubit>().users.length,
                gridDelegate:
                    const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    print(index);
                    sharedPref.saveData(key: "numIDD", value: index+10);
                    navigate(context, MyPostDetails());
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Opacity(
                        opacity: 0.9,
                        child: Image.network(server +
                            context.read<ShowAllPostsCubit>().users[index]
                                ["path"]),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
