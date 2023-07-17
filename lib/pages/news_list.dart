import 'package:flutter/material.dart';
import 'package:flutter_application_1_test/components/custom_card.dart';
import 'package:flutter_application_1_test/providers/news_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NewsList extends ConsumerStatefulWidget {
  const NewsList({super.key});

  @override
  ConsumerState<NewsList> createState() => _NewsListState();
}

class _NewsListState extends ConsumerState<NewsList> {
  @override
  Widget build(BuildContext context) {
    var rssFeedAsyncValue = ref.watch(newsProvider);

    return rssFeedAsyncValue.when(
      skipLoadingOnRefresh: false,
      data: (rssFeed) {
        var items = rssFeed.items;
        return ListView(
          children: <Widget>[
            if (items != null)
              ...items.map(
                (item) {
                  return CustomCard(
                    descritpion: item.title ?? 'no data',
                    picture: item.media?.contents?.first.url ??
                        'https://www.ipsgroup.fr/wp-content/uploads/2013/12/default_image_01-1024x1024-570x321.png',
                  );
                },
              )
          ],
        );
      },
      error: (error, stackTrace) {
        return Text(error.toString());
      },
      loading: (() {
        return const CircularProgressIndicator();
      }),
    );
  }
}
