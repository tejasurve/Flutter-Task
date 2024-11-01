/*
 * Created on Sat Nov 02 2024
 * Created by Tejas Surve
 *
 * Copyright (c) Tejas Surve
 */

part of 'content_bloc_bloc.dart';

sealed class ContentBlocEvent extends Equatable {
  const ContentBlocEvent();

  @override
  List<Object> get props => [];
}

class FetchContentData extends ContentBlocEvent {
  final int page;
  const FetchContentData(this.page);
  @override
  List<Object> get props => [page];
}
