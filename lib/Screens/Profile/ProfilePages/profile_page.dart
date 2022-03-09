import 'package:eshop/Screens/CommonWidgets/app_loader.dart';
import 'package:eshop/Screens/Profile/ProfileViews/profile_view.dart';
import 'package:eshop/Screens/Profile/bloc/index.dart';
import 'package:eshop/Screens/Profile/bloc/user_repo.dart';
import 'package:eshop/Utils/apptheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfiilePage extends StatefulWidget {
  const ProfiilePage({Key? key}) : super(key: key);

  @override
  State<ProfiilePage> createState() => _ProfiilePageState();
}

class _ProfiilePageState extends State<ProfiilePage> {
  UserBloc? bloc;

  @override
  void initState() {
    super.initState();
    bloc = UserBloc(UserDeaultState(), UserRepo());
    bloc?.add(UserDetailEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blue100,
      body: BlocProvider(
        create: (context) => bloc!,
        child: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            if (state is UserDeaultState || state is UserLoadingState) {
             return const AppLoader();
            }
            return const ProfileView();
          },
          bloc: bloc,
        ),
        
      ),
    );
  }
}
