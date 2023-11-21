import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MenuSection extends StatelessWidget {
  const MenuSection({super.key});

  Widget itemMenu(String image, String title) {
    return Column(
      children: [
        SvgPicture.asset(
          image,
          height: 50,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          title,
          style: TextStyle(color: Colors.white),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 50,
      runSpacing: 30,
      children: [
        itemMenu('assets/ic_atlas_logo.svg', 'Atlas'),
        itemMenu('assets/ic_home_reservation.svg', 'Reservation'),
        itemMenu('assets/ic_home_outlets.svg', 'Outlet'),
        itemMenu('assets/ic_bottles.svg', 'My Bottles'),
        itemMenu('assets/ic_whatson.svg', "What's on"),
        itemMenu('assets/ic_event.svg', 'Events'),
      ],
    );
  }
}
