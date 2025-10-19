import 'package:aunkur_farmer/src/common/constant/common_content.dart';
import 'package:aunkur_farmer/src/feature/news/bloc/news_bloc.dart';
import 'package:aunkur_farmer/src/feature/news/presentation/widget/news_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsListPage extends StatelessWidget {
  const NewsListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('News List')),
      body: BlocConsumer<NewsBloc, NewsState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(scaffoldDefaultPadding),
            child: ListView.separated(
              itemCount: 10, // Example item count
              itemBuilder: (context, index) {
                return const NewsCard();
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(height: 8.0);
              },
            ),
          );
        },
      ),
    );
  }
}
