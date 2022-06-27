import 'package:digital_ocean_app/ui/view/crew.dart';
import 'package:digital_ocean_app/ui/view/marine_location.dart';
import 'package:flutter/material.dart';

class HomePageView extends StatefulWidget {
  HomePageView({Key? key}) : super(key: key);

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(children: [
        CrewPage(),
        MarineLocation(),
      ]),
    );
  }
}
