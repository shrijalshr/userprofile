import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:userprofile/common/const/asset_paths.dart';
import 'package:userprofile/common/extensions/app_extensions.dart';
import 'package:userprofile/data/model/user_model.dart';
import 'package:userprofile/module/user_profile_list/bloc/bloc/user_profile_bloc.dart';

import '../widgets/scrollable_column.dart';
import '../widgets/user_profile_tile.dart';

class UserListScreen extends StatelessWidget {
  const UserListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("User Profile List"),
      ),
      body: BlocBuilder<UserProfilesBloc, UserProfilesState>(
        builder: (context, state) {
          switch (state) {
            case UserProfileLoading():
              return const Center(child: CircularProgressIndicator());

            case UserProfilesFailed():
              return RefreshIndicator.adaptive(
                onRefresh: () async {
                  context.read<UserProfilesBloc>().add(LoadUsers());
                },
                child: Center(
                  child: ScrollableColumn(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Image.asset(
                        AssetPaths.error,
                        height: 175,
                        fit: BoxFit.fitHeight,
                      ).pb(24),
                      Center(
                          child: Text(
                        "${state.error}",
                        style: context.textStyles.displayMedium
                            ?.copyWith(color: context.color.errorColor),
                        textAlign: TextAlign.center,
                      )),
                    ],
                  ),
                ),
              );

            case UserProfilesLoaded():
              return RefreshIndicator.adaptive(
                onRefresh: () async {
                  context.read<UserProfilesBloc>().add(LoadUsers());
                },
                child: ListView.separated(
                    physics: const BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics(),
                    ),
                    padding: const EdgeInsets.all(10),
                    itemBuilder: (context, index) {
                      UserModel? user = state.users![index];
                      return UserProfileTile(user: user);
                    },
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 10),
                    itemCount: state.users!.length),
              );
            default:
              return const Text("Something went wrong");
          }
        },
      ),
    );
  }
}
