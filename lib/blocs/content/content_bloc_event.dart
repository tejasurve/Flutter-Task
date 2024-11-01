part of 'content_bloc_bloc.dart';

sealed class ContentBlocEvent extends Equatable {
  const ContentBlocEvent();

  @override
  List<Object> get props => [];
}

class FetchContentData extends ContentBlocEvent {
  const FetchContentData();
  @override
  List<Object> get props => [];
}
