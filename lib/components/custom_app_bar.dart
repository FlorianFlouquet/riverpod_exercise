import 'package:flutter/material.dart';
import 'package:flutter_application_1_test/providers/count_provider.dart';
import 'package:flutter_application_1_test/providers/news_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomAppBar extends ConsumerWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var countAsync = ref.watch(countProvider);

    onRefresh() {
      ref.invalidate(newsProvider);
    }

    return SizedBox(
      height: 50.0,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Spacer(),
          Text('Count: $countAsync'),
          Expanded(
            child: Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                icon: const Icon(Icons.refresh),
                onPressed: (() => onRefresh()),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
