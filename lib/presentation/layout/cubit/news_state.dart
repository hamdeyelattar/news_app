part of 'news_cubit.dart';

@immutable
abstract class NewsState {}

class NewsInitial extends NewsState {}

class NewsBottomNavState extends NewsState {}

class NewsGetBusinessLoadingState extends NewsState {}

class NewsGetBusinessSuccessState extends NewsState {}

class NewsGetBusinessfaluireState extends NewsState {
  final String error;
  NewsGetBusinessfaluireState(this.error);
}

class NewsGetSportsLoadingState extends NewsState {}

class NewsGetSportsSuccessState extends NewsState {}

class NewsGetSportsfaluireState extends NewsState {
  final String error;
  NewsGetSportsfaluireState(this.error);
}

class NewsGetSienceLoadingState extends NewsState {}

class NewsGetSienceSuccessState extends NewsState {}

class NewsGetSiencefaluireState extends NewsState {
  final String error;
  NewsGetSiencefaluireState(this.error);
}

class NewsGetSearchLoadingState extends NewsState {}

class NewsGetSearchSuccessState extends NewsState {}

class NewsGetSearchfaluireState extends NewsState {
   final String error;
  NewsGetSearchfaluireState(this.error);
}

class NewsChangeModeState extends NewsState {}

