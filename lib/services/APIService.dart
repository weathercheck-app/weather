import 'dart:convert';
import 'package:http/http.dart' as http;


final String host = 'http://localhost:8080/api/v1';

class APIService {

  Future<List<String>> RegionsFirstList() async {
    final response = await http.get(Uri.parse('$host/Regions/first'));

    List<Map<String, dynamic>> data = _decodeResponse(response);
    return data.map((e) => e['cname'] as String).toList();
  } // 헬퍼 함수로 응답 디코딩

  Future<List<String>> RegionsSecondList(String cname) async {
    // cname 값을 쿼리 파라미터로 추가
    final response = await http.get(Uri.parse('$host/Regions/second?cname=$cname'));

    List<Map<String, dynamic>> data = _decodeResponse(response);
    return data.map((e) => e['saname'] as String).toList();
  }

  Future<List<String>> RegionsThirdList(String saname) async {
    // cname 값을 쿼리 파라미터로 추가
    final response = await http.get(Uri.parse('$host/Regions/third?saname=$saname'));

    List<Map<String, dynamic>> data = _decodeResponse(response);
    return data.map((e) => e['sname'] as String).toList();
  }




  // 헬퍼 함수: 응답을 UTF-8로 디코딩하고 JSON 파싱
  List<Map<String, dynamic>> _decodeResponse(http.Response response) {
    final decodedBody = utf8.decode(response.bodyBytes); // UTF-8로 디코딩
    final List<dynamic> jsonData = json.decode(decodedBody);
    return jsonData.cast<Map<String, dynamic>>();  // JSON 파싱 후 List로 반환
  }
}