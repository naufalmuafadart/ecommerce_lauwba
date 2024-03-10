import 'package:ecommerce/ui/main_screen/subscreen/home/home.dart';
import 'package:flutter/material.dart';

import '../global_widgets.dart';


class MainScreen extends StatefulWidget {

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {


  List<Widget> subscreens = [
    HomeSubscreen(),
    const Center(
      child: Text("feed Screen"),
    ),
    const Center(
      child: Text("help Screen"),
    ),
    const Center(
      child: Text("About Screen"),
    ),
  ];

  List<Tab> listOfTabs = [
    const Tab(icon: Icon(Icons.home_outlined), text: "Home",),
    const Tab(icon: Icon(Icons.feed_outlined), text: "Feeds",),
    const Tab(icon: Icon(Icons.help_outline), text: "Help",),
    const Tab(icon: Icon(Icons.info_outline), text: "About",),
  ];

  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {


    return DefaultTabController(
      length: subscreens.length,
      child: Scaffold(
          body:TabBarView(
            children : subscreens,
          ),
          bottomNavigationBar: Container(
            color: Colors.orange,
            child: TabBar(
              tabs: listOfTabs,
            ),
          ),
          floatingActionButton: btnCart(context: context)
      ),
    );
  }
}