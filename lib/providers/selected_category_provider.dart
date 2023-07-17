import 'package:flutter_application_1_test/news_category.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SelectCategoryNotifier extends StateNotifier<String> {
  SelectCategoryNotifier() : super(Category.international.name);

  void selectCategory(String category) {
    state = category;
  }
}

final selectedCategoryProvider =
    StateNotifierProvider<SelectCategoryNotifier, String>((ref) {
  return SelectCategoryNotifier();
});
