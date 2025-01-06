import 'package:flutter/material.dart';
import 'package:weathercheck_app/services/APIService.dart';

class SearchRegionsScreen extends StatefulWidget {
  @override
  _SearchRegionsScreenState createState() => _SearchRegionsScreenState();
}

class _SearchRegionsScreenState extends State<SearchRegionsScreen> with AutomaticKeepAliveClientMixin {

  @override
  bool get wantKeepAlive => true;

  final APIService apiService = APIService();
  String? selectedRegion;
  String? selectedCity;
  String? selectedSpot;

  List<String> regions = [];
  List<String> cities = [];
  List<String> spots = []; // 세 번째 드롭다운의 스팟 데이터

  @override
  void initState() {
    super.initState();
    _loadRegions(); // 초기화 시 지역 데이터 로드
  }

  // 지역 리스트 불러오기
  Future<void> _loadRegions() async {
    final List<String> regionData = await apiService.RegionsFirstList();
    setState(() {
      regions = regionData;
    });
  }

  // 도시 리스트 불러오기
  Future<void> _loadCities(String region) async {
    final List<String> cityData = await apiService.RegionsSecondList(region);
    setState(() {
      cities = cityData;
      selectedCity = null; // 도시 변경 시 초기화
      selectedSpot = null; // 스팟 초기화
    });
  }

  // spot 리스트 불러오기
  Future<void> _loadSpots(String spot) async {
    final List<String> spotData = await apiService.RegionsThirdList(spot);
    setState(() {
      spots = spotData;
      selectedSpot = null; // 스팟 초기화
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Regions'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // 첫 번째 드롭다운: 지역
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text('Region', style: TextStyle(fontSize: 16)),
                    SizedBox(width: 16), // 레이블과 드롭다운 사이의 공간
                    Expanded(
                      child: DropdownButton<String>(
                        hint: Text('Select Region'),
                        value: selectedRegion,
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedRegion = newValue;
                            _loadCities(selectedRegion!); // 지역 선택 시 도시 불러오기
                          });
                        },
                        items: regions.map<DropdownMenuItem<String>>((item) {
                          return DropdownMenuItem<String>(
                            value: item,
                            child: Text(item),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              ],
            ),

            // 두 번째 드롭다운: 도시
            if (selectedRegion != null)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text('City', style: TextStyle(fontSize: 16)),
                      SizedBox(width: 16), // 레이블과 드롭다운 사이의 공간
                      Expanded(
                        child: DropdownButton<String>(
                          hint: Text('Select City'),
                          value: selectedCity,
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedCity = newValue;
                              _loadSpots(selectedCity!);
                              selectedSpot = null; // 도시 변경 시 스팟 초기화
                            });
                          },
                          items: cities.map<DropdownMenuItem<String>>((city) {
                            return DropdownMenuItem<String>(
                              value: city,
                              child: Text(city),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                ],
              ),

            // 세 번째 드롭다운: 관광지
            if (selectedCity != null)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text('Spot', style: TextStyle(fontSize: 16)),
                      SizedBox(width: 16), // 레이블과 드롭다운 사이의 공간
                      Expanded(
                        child: DropdownButton<String>(
                          hint: Text('Select Spot'),
                          value: selectedSpot,
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedSpot = newValue;
                            });
                          },
                          items: spots.map<DropdownMenuItem<String>>((spot) {
                            return DropdownMenuItem<String>(
                              value: spot,
                              child: Text(spot),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                ],
              ),

            // 선택된 Spot 표시
            if (selectedSpot != null)
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Text('현재 선택된 스팟: $selectedSpot',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              )
            else if (selectedSpot == null)
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: Text('현재 스팟이 선택되지 않았어요',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  )
          ],
        ),
      ),
    );
  }
}