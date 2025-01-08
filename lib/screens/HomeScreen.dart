import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weathercheck_app/providers/RegionNotifier.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();  // Create the state for the screen
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),  // AppBar title
      ),
      body: Center(
        child: Column(
          children: [
            Consumer<RegionNotifier>(
              builder: (context, regionNotifer, child) {
              int? Rid = int.tryParse(regionNotifer.selectedRid ?? '');

              print(Rid.runtimeType);

              return Container();
              }
            )
          ],
        ),  // Main content of the screen
      ),
    );
  }
}