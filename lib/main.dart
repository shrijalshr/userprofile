import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:userprofile/common/config/network/dio_client.dart';
import 'package:userprofile/common/config/theme/app_theme.dart';
import 'package:userprofile/data/repo/user_repo.dart';
import 'package:userprofile/module/user_profile_list/view/user_list_screen.dart';

import 'module/user_profile_list/bloc/bloc/user_profile_bloc.dart';

void initApp() async {
  DioClient().init();
}

void main() {
  initApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'User Profiles',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        home: const RootApp());
  }
}

class RootApp extends StatelessWidget {
  const RootApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserProfilesBloc(UserRepo())..add(LoadUsers()),
      child: const UserListScreen(),
    );
  }
}
