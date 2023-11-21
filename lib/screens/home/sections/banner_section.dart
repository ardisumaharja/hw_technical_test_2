import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hw_technical_test_2/blocs/banner_cubit/banner_cubit.dart';
import 'package:hw_technical_test_2/blocs/banner_cubit/banner_state.dart';

class BannerSection extends StatefulWidget {
  const BannerSection({super.key});

  @override
  State<BannerSection> createState() => _BannerSectionState();
}

class _BannerSectionState extends State<BannerSection> {
  @override
  void initState() {
    context.read<BannerCubit>().getListBanner();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BannerCubit, BannerState>(builder: (context, state) {
      if (state.status == BannerCubitStatus.success) {
        return SizedBox(
          height: 300,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: state.listBanner.length,
            itemBuilder: (context, index) {
              final item = state.listBanner[index];
              return Image.network(item.imgUrl);
            },
          ),
        );
      } else {
        return Container();
      }
    });
  }
}
