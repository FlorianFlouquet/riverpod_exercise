import 'package:flutter_application_1_test/providers/news_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final countProvider = Provider<int>((ref) {
  var news = ref.watch(newsProvider).value;
  var count = 0;
  if (news != null && news.items != null) {
    count = news.items!.length;
  }
  return count;
});
