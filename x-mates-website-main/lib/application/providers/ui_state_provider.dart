import 'package:flutter/material.dart';

class UIStateProvider extends ChangeNotifier {
  final Map<String, bool> _hoverStates = {};
  final Map<String, AnimationController> _controllers = {};

  bool isHovered(String key) => _hoverStates[key] ?? false;

  void setHovered(String key, bool value) {
    if (_hoverStates[key] != value) {
      _hoverStates[key] = value;
      notifyListeners();
    }
  }

  void registerController(String key, AnimationController controller) {
    _controllers[key] = controller;
  }

  AnimationController? getController(String key) => _controllers[key];

  @override
  void dispose() {
    for (var controller in _controllers.values) {
      controller.dispose();
    }
    _controllers.clear();
    _hoverStates.clear();
    super.dispose();
  }
}



