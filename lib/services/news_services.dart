import 'package:flutter/material.dart';
import 'package:webfeed/domain/rss_feed.dart';
import 'package:http/http.dart' as http;

class NewsServices {
  Future<RssFeed> getNews(String category) async {
    var client = http.Client();
    try {
      var url = 'https://www.lemonde.fr/$category/rss_full.xml';
      var response = await client.get(Uri.parse(url));
      return RssFeed.parse(response.body);
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }
}
