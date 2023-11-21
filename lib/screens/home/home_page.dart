import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:hw_technical_test_2/blocs/banner_cubit/banner_cubit.dart';
import 'package:hw_technical_test_2/blocs/song_cubit/song_cubit.dart';
import 'package:hw_technical_test_2/screens/home/sections/menu_section.dart';
import 'package:hw_technical_test_2/screens/home/sections/banner_section.dart';
import 'package:hw_technical_test_2/screens/home/sections/music_section.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (context) => GetIt.I<BannerCubit>()),
      BlocProvider(create: (context) => GetIt.I<SongCubit>()),
    ], child: const HomePageView());
  }
}

class HomePageView extends StatelessWidget {
  const HomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.only(top: 80, left: 18, right: 18),
        child: Column(
          children: [
            BannerSection(),
            SizedBox(
              height: 20,
            ),
            MenuSection(),
            SizedBox(
              height: 10,
            ),
            MusicSection(),
          ],
        ),
      ),
    );
  }
}
