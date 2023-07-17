import 'package:flutter/material.dart';
import 'package:flutter_application_1_test/news_category.dart';
import 'package:flutter_application_1_test/pages/news_list.dart';
import 'package:flutter_application_1_test/components/custom_app_bar.dart';
import 'package:flutter_application_1_test/providers/selected_category_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // remove debug banner
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends ConsumerStatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  ConsumerState<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<MyHomePage> {
  int _selectedIntex = 0;

  @override
  Widget build(BuildContext context) {
    onTap(int index) {
      ref
          .read(selectedCategoryProvider.notifier)
          .selectCategory(Category.values[index].name);
      setState(() {
        _selectedIntex = index;
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: const CustomAppBar(),
      ),
      body: const NewsList(),
      bottomNavigationBar: BottomNavigationBar(
        items: Category.values
            .map((category) => BottomNavigationBarItem(
                icon: const Icon(Icons.abc), label: category.name))
            .toList(),
        onTap: onTap,
        currentIndex: _selectedIntex,
      ),
    );
  }
}
