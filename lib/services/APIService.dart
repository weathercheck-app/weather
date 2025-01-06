import 'dart:convert';
import 'package:http/http.dart' as http;

class APIService {
  final String host = 'http://localhost:8080/api/v1';

  Future<List> RegionsFirstList() async {
    final response = await http.get(Uri.parse('$host/Regions/first'));
    print(_decodeResponse(response));
    return _decodeResponse(response); // 헬퍼 함수로 응답 디코딩
  }



  // 헬퍼 함수: 응답을 UTF-8로 디코딩하고 JSON 파싱
  List _decodeResponse(http.Response response) {
    final decodedBody = utf8.decode(response.bodyBytes); // UTF-8로 디코딩
    return json.decode(decodedBody) as List; // JSON 파싱 후 List로 반환
  }
}