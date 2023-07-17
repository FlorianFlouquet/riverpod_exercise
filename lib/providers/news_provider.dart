import 'package:flutter_application_1_test/providers/selected_category_provider.dart';
import 'package:flutter_application_1_test/services/news_services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:webfeed/domain/rss_feed.dart';

final newsServiceProvider = Provider<NewsServices>(
  (_) => NewsServices(),
);

final newsProvider = FutureProvider<RssFeed>((ref) {
  var category = ref.watch(selectedCategoryProvider);
  return ref.watch(newsServiceProvider).getNews(category);
});
