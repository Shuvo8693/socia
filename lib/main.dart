import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socia/core/widgets/BottomNavBarScreen.dart';
import 'package:socia/features/authentication/data/service/auth_login_service.dart';
import 'package:socia/features/authentication/data/service/auth_service.dart';
import 'package:socia/features/authentication/presentation/bloc/auth_bloc.dart';
import 'package:socia/features/home/data/service/add_story_service.dart';
import 'package:socia/features/home/data/service/get_post_service.dart';
import 'package:socia/features/home/data/service/story_service.dart';
import 'package:socia/features/home/presentation/bloc/get_post_bloc/get_post_bloc.dart';
import 'package:socia/features/home/presentation/bloc/story_bloc/story_bloc.dart';
import 'package:socia/features/profile/data/service/update_profile_service.dart';
import 'package:socia/features/profile/presentation/bloc/update_profile_bloc.dart';
import 'package:socia/firebase_options.dart';

import 'config/theme/theme_data.dart';
import 'features/home/presentation/bloc/story_list_bloc/story_list_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: firebaseOptions());
  runApp(const SocIa());
}

class SocIa extends StatelessWidget {
  const SocIa({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => AuthBloc(
                authService: AuthService(),
                authLogInService: AuthLogInService())),
        BlocProvider(
            create: (context) => GetPostBloc(getPostService: GetPostService())),
        BlocProvider(
            create: (context) => StoryBloc(
                storyService: StoryService(),
                addStoryService: AddStoryService())),
        BlocProvider(
            create: (context) => StoryListBloc(storyService: StoryService())),
        BlocProvider(
            create: (context) => UpdateProfileBloc(updateProfileService: UpdateProfileService())),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'SocIa',
        theme: lightTheme(),
        darkTheme: darkTheme(),
        themeMode: ThemeMode.system,
        home: const BottomNavBarScreen(),
      ),
    );
  }
}
