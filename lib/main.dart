import 'package:flutter/material.dart';
import 'package:weathercheck_app/screens/SearchRegionsScreen.dart';
import 'package:weathercheck_app/widget/BottomBar.dart';

void main() {
  runApp(WeatherApp()); // runApp은 루트 위젯을 실행하는것
}

class WeatherApp extends StatefulWidget { // MyAPP은 화면을 담당하는 레이아웃
  _WeatherAppState createState() => _WeatherAppState(); // _MyAppState는 위젯의 상태를 담당,
}

class _WeatherAppState extends State<WeatherApp> with SingleTickerProviderStateMixin { //_MyAppstate는 MyApp을 상속하여, MyApp의 위젯 상태를 담당
  TabController? controller;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'weatherApp',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.blue,
        ).copyWith(
          secondary: Colors.white, // accentColor 대신 secondary로 설정
        ),
      ),
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          body: TabBarView(
            controller: controller,
            physics: NeverScrollableScrollPhysics(),
            children: <Widget>[
              SearchRegionsScreen(),
              Container(
                  child: Center(
                    child: Text('home')
              )),
              Container(
                  child: Center(
                      child: Text('list')
                  )),
              Container(
                  child: Center(
                      child: Text('cs')
                  )),
            ],
          ),
          bottomNavigationBar: Bottom(),
        ),
      ),
    );
  }
}