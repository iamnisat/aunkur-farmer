import 'package:aunkur_farmer/src/feature/news/repositories/news_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final NewsRepo newsRepo;

  NewsBloc(this.newsRepo) : super(NewsInitial()) {
    on<NewsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
