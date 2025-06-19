import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final dashboardPageChangeProvider = ChangeNotifierProvider<DashboardPageChangeNotifier>((ref) {
  return DashboardPageChangeNotifier();
});


class DashboardPageChangeNotifier extends ChangeNotifier {
  int _selectedPage = 0;
  final PageController pageController = PageController();

  int get selectedPage => _selectedPage;

  void setIndex(int page) {
    _selectedPage = page;
    pageController.jumpToPage(page);
    notifyListeners();
  }

  void onPageChanged(int page) {
    _selectedPage = page;
    notifyListeners();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}