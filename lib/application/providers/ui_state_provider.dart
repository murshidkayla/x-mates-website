import 'package:flutter/material.dart';

class UIStateProvider extends ChangeNotifier {
  final Map<String, bool> _hoverStates = {};
  final Map<String, AnimationController> _controllers = {};
  bool _isMobileMenuOpen = false;
  bool _isButtonPressed = false;

  // Hover states
  bool isHovered(String key) => _hoverStates[key] ?? false;

  void setHovered(String key, bool value) {
    if (_hoverStates[key] != value) {
      _hoverStates[key] = value;
      notifyListeners();
    }
  }

  // Mobile menu state
  bool get isMobileMenuOpen => _isMobileMenuOpen;

  void setMobileMenuOpen(bool value) {
    if (_isMobileMenuOpen != value) {
      _isMobileMenuOpen = value;
      notifyListeners();
    }
  }

  void toggleMobileMenu() {
    _isMobileMenuOpen = !_isMobileMenuOpen;
    notifyListeners();
  }

  // Button pressed state
  bool get isButtonPressed => _isButtonPressed;

  void setButtonPressed(bool value) {
    if (_isButtonPressed != value) {
      _isButtonPressed = value;
      notifyListeners();
    }
  }

  // Animation controllers
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



