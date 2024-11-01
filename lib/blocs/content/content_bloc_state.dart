part of 'content_bloc_bloc.dart';

sealed class ContentBlocState {}

final class ContentBlocInitial extends ContentBlocState {}

final class ContentBlocInProgress extends ContentBlocState {}

final class ContentBlocLoaded extends ContentBlocState {
  final List<Content> contentModel;
  // final Response contentModel;
  ContentBlocLoaded(this.contentModel);
}

final class ContentBlocFailed extends ContentBlocState {
  final String errorMessage;

  ContentBlocFailed(this.errorMessage);
}
