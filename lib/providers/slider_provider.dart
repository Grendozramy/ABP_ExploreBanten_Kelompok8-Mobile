import 'package:explore_banten_mobile/models/sliders_model.dart';
import 'package:explore_banten_mobile/service/slider_service.dart';
import 'package:flutter/material.dart';

class SliderProvider with ChangeNotifier {
  static List<SliderModel> _sliders = [];
  static List<SliderModel> get sliders => _sliders;

  set slider(List<SliderModel> slider) {
    _sliders = slider;
    notifyListeners();
  }

  Future<void> getSlider() async {
    try {
      List<SliderModel> slider = await SliderService().getSliders();
      _sliders = slider;
    } catch (e) {
      print(e);
    }
  }
}
