/*
 * Created on Sat Nov 02 2024
 * Created by Tejas Surve
 *
 * Copyright (c) Tejas Surve
 */

import 'package:flutter/material.dart';
import 'package:flutter_task/data/models/content.dart';
import 'package:flutter_task/resources/utils/layout.dart';

class ReelCard extends StatelessWidget {
  final Content reel;

  const ReelCard({super.key, required this.reel});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
              vertical: rSize(context, 8), horizontal: rSize(context, 8)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundImage:
                        NetworkImage(reel.user?.profilePictureCdn ?? ''),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        reel.user?.fullname ?? '',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              color: Theme.of(context).colorScheme.surface,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      Text(
                        reel.user?.designation ?? '',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: Theme.of(context).colorScheme.surface,
                            ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          height: 300, // Set a standard height for the card
          child: Stack(
            children: [
              // Video thumbnail as background
              Positioned.fill(
                child: Image.network(
                  reel.thumbCdnUrl ?? '',
                  fit: BoxFit.cover,
                ),
              ),
              // Overlay gradient for readability
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.black.withOpacity(0.3),
                        Colors.transparent
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.center,
                    ),
                  ),
                ),
              ),
              // Profile pic, name, title overlay
            ],
          ),
        ),
        const SizedBox(height: 8), // Space between the card and stats
        // Likes, comments, and views below the card
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: rSize(context, 16),
            vertical: rSize(context, 8),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  _buildStatColumn(context, Icons.favorite, reel.totalLikes),
                  _buildStatColumn(context, Icons.comment, reel.totalComments),
                  _buildStatColumn(context, Icons.visibility, reel.totalViews),
                ],
              ),
              SizedBox(
                height: rSize(context, 8),
              ),
              Text(
                reel.title ?? '',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.surface,
                    ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.start,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildStatColumn(BuildContext context, IconData icon, int? count) {
    return Row(
      children: [
        Icon(icon, color: Colors.white, size: 16), // Icon for the statistic
        const SizedBox(width: 4),
        Text(
          count != null ? count.toString() : '0',
          style: const TextStyle(color: Colors.white, fontSize: 14),
        ),
        SizedBox(
          width: rSize(context, 16),
        )
      ],
    );
  }
}
