import 'package:flutter/material.dart';
import 'package:supernova_sunburst/presentation/pages/home_page/widgets/home_page_body.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hello World!'),
      ),
      body: HomePageBody(),
    );
  }
}
