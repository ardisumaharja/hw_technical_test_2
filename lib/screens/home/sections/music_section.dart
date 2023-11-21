import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hw_technical_test_2/blocs/song_cubit/song_cubit.dart';
import 'package:hw_technical_test_2/blocs/song_cubit/song_state.dart';
import 'package:hw_technical_test_2/screens/home/sections/card_song.dart';

class MusicSection extends StatefulWidget {
  const MusicSection({super.key});

  @override
  State<MusicSection> createState() => _MusicSectionState();
}

class _MusicSectionState extends State<MusicSection> {
  @override
  void initState() {
    context.read<SongCubit>().getListBanner();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SongCubit, SongState>(
      builder: (context, state) {
        if (state.status == SongCubitStatus.success) {
          return Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: state.listSong.length,
              itemBuilder: (context, index) {
                final item = state.listSong[index];
                return CardSong(
                  title: item.title,
                  imageNetwork: item.profilePictureUrl,
                  artis: item.artist,
                );
              },
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
