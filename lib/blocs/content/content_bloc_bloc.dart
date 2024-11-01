import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_task/data/models/content.dart';
import 'package:flutter_task/data/repository/content_repository.dart';

part 'content_bloc_event.dart';
part 'content_bloc_state.dart';

class ContentBlocBloc extends Bloc<ContentBlocEvent, ContentBlocState> {
  late ContentRepository contentRepository;
  ContentBlocBloc() : super(ContentBlocInitial()) {
    contentRepository = ContentRepository();

    on<FetchContentData>((event, emit) async {
      emit(ContentBlocInProgress());
      try {
       List<Content> contentModel = await contentRepository.getContentData();
        emit(ContentBlocLoaded(contentModel));
      } catch (e) {
        emit(ContentBlocFailed(e.toString()));
      }
    });
  }
}
