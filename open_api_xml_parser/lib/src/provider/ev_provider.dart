import 'package:flutter/material.dart';
import 'package:open_api_xml_parser/src/model/ev.dart';
import 'package:open_api_xml_parser/src/repository/ev_repository.dart';

class EvProvider extends ChangeNotifier {
  //  EvRepository에 접근(데이터를 받아와야 하므로)
  final EvRepository _evRepository = EvRepository();

  List<Ev> _evs = [];
  List<Ev> get evs => _evs;

  //  데이터 로드
  loadEvs() async {
    //  EvRepository에 접근해서 데이터를 로드
    //  listEvs에 _evs를 바로 작성해도 되지만 예외처리와 추가적인 가공을 위해 나눠서 작성
    List<Ev>? listEvs = await _evRepository.loadEvs();
    _evs = listEvs!;
    notifyListeners();  //  데이터가 업데이트 됐으면 구독자에게 알린다.
  }
}