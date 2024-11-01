/*
 * Created on Fri Nov 01 2024
 * Created by Tejas Surve
 *
 * Copyright (c) Tejas Surve
 */

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task/blocs/content/content_bloc_bloc.dart';
import 'package:flutter_task/data/models/content.dart';
import 'package:flutter_task/presentation/pages/video_screen.dart';
import 'package:flutter_task/presentation/widgets/reel_card.dart';
import 'package:flutter_task/resources/utils/layout.dart';

class ReelsScreen extends StatefulWidget {
  @override
  ReelsScreenState createState() => ReelsScreenState();
}

class ReelsScreenState extends State<ReelsScreen> {
  final ScrollController _scrollController = ScrollController();
  final List<Content> _reels = [];
  bool _isLoadingMore = false;
  bool _hasMore = true;
  late ContentBlocBloc contentBlocBloc;
  int page = 1;

  @override
  void initState() {
    super.initState();
    contentBlocBloc = context.read<ContentBlocBloc>();
    _fetchInitialContent();
    _scrollController.addListener(_scrollListener);
  }

  void _fetchInitialContent() {
    contentBlocBloc.add(const FetchContentData(1));
    _listenForContentData();
  }

  void _listenForContentData() async {
    await for (var state in contentBlocBloc.stream) {
      if (state is ContentBlocLoaded) {
        List<Content> newReels = state.contentModel;
        if (newReels.isEmpty) {
          setState(() {
            _isLoadingMore = false;
            _hasMore = false;
          });
          break;
        }
        setState(() {
          _reels.addAll(newReels);
          _isLoadingMore = false;
        });
        break;
      }
    }
  }

  void _scrollListener() {
    if (_scrollController.position.pixels ==
            _scrollController.position.maxScrollExtent &&
        !_isLoadingMore &&
        _hasMore) {
      _fetchAdditionalContent();
    }
  }

  void _fetchAdditionalContent() {
    setState(() {
      _isLoadingMore = true;
      page++; // Increment the page counter each time more content is fetched
    });
    contentBlocBloc.add(FetchContentData(page));
    _listenForContentData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView.builder(
        controller: _scrollController,
        itemCount: _reels.length + (_isLoadingMore ? 1 : 0),
        itemBuilder: (context, index) {
          if (index == _reels.length) {
            return Center(
                child: CircularProgressIndicator(
              color: Theme.of(context).colorScheme.surface,
            ));
          }
          // Each reel card in the list
          return GestureDetector(
            onTap: () => _openVideoScreen(_reels[index]),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: rSize(context, 8)),
              child: ReelCard(reel: _reels[index]),
            ),
          );
        },
      ),
    );
  }

  // Open the full-screen video player
  void _openVideoScreen(Content reel) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => VideoScreen(reel: reel),
      ),
    );
  }
}
