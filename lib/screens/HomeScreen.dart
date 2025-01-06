// lib/screens/HomeScreen.dart
import 'package:flutter/material.dart';
import 'package:weathercheck_app/services/APIService.dart';

class HomeScreen extends StatelessWidget {
  final APIService apiService = APIService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: FutureBuilder<List>(
        future: apiService.RegionsFirstList(), // APIService로 데이터를 가져오는 작업
        builder: (context, snapshot) {
          // 데이터 로딩 상태 확인
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator()); // 로딩 중인 경우
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}')); // 에러 발생 시
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No data available')); // 데이터가 없을 경우
          } else {
            List data = snapshot.data!; // 데이터가 있을 경우
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('Item ${data[index]}'), // 각 아이템을 표시
                );
              },
            );
          }
        },
      ),
    );
  }
}