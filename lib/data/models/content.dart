/*
 * Created on Thu Oct 31 2024
 * Created by Tejas Surve
 *
 * Copyright (c) Tejas Surve
 */

class Content {
  int? id;
  String? title;
  String? url;
  String? cdnUrl;
  String? thumbCdnUrl;
  int? userId;
  String? status;
  String? slug;
  String? encodeStatus;
  int? priority;
  int? categoryId;
  int? totalViews;
  int? totalLikes;
  int? totalComments;
  int? totalShare;
  int? totalWishlist;
  int? duration;
  String? byteAddedOn;
  String? byteUpdatedOn;
  String? bunnyStreamVideoId;
  String? language;
  int? bunnyEncodingStatus;
  String? deletedAt;
  int? videoHeight;
  int? videoWidth;
  String? location;
  int? isPrivate;
  int? isHideComment;
  String? description;
  User? user;
  bool? isLiked;
  bool? isWished;
  bool? isFollow;
  String? videoAspectRatio;

  Content(
      {this.id,
      this.title,
      this.url,
      this.cdnUrl,
      this.thumbCdnUrl,
      this.userId,
      this.status,
      this.slug,
      this.encodeStatus,
      this.priority,
      this.categoryId,
      this.totalViews,
      this.totalLikes,
      this.totalComments,
      this.totalShare,
      this.totalWishlist,
      this.duration,
      this.byteAddedOn,
      this.byteUpdatedOn,
      this.bunnyStreamVideoId,
      this.language,
      this.bunnyEncodingStatus,
      this.deletedAt,
      this.videoHeight,
      this.videoWidth,
      this.location,
      this.isPrivate,
      this.isHideComment,
      this.description,
      this.user,
      this.isLiked,
      this.isWished,
      this.isFollow,
      this.videoAspectRatio});

  Content.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    url = json['url'];
    cdnUrl = json['cdn_url'];
    thumbCdnUrl = json['thumb_cdn_url'];
    userId = json['user_id'];
    status = json['status'];
    slug = json['slug'];
    encodeStatus = json['encode_status'];
    priority = json['priority'];
    categoryId = json['category_id'];
    totalViews = json['total_views'];
    totalLikes = json['total_likes'];
    totalComments = json['total_comments'];
    totalShare = json['total_share'];
    totalWishlist = json['total_wishlist'];
    duration = json['duration'];
    byteAddedOn = json['byte_added_on'];
    byteUpdatedOn = json['byte_updated_on'];
    bunnyStreamVideoId = json['bunny_stream_video_id'];
    language = json['language'];
    bunnyEncodingStatus = json['bunny_encoding_status'];
    deletedAt = json['deleted_at'];
    videoHeight = json['video_height'];
    videoWidth = json['video_width'];
    location = json['location'];
    isPrivate = json['is_private'];
    isHideComment = json['is_hide_comment'];
    description = json['description'];
    user = json['user'] != String ? new User.fromJson(json['user']) : null;
    isLiked = json['is_liked'];
    isWished = json['is_wished'];
    isFollow = json['is_follow'];
    videoAspectRatio = json['video_aspect_ratio'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['url'] = url;
    data['cdn_url'] = cdnUrl;
    data['thumb_cdn_url'] = thumbCdnUrl;
    data['user_id'] = userId;
    data['status'] = status;
    data['slug'] = slug;
    data['encode_status'] = encodeStatus;
    data['priority'] = priority;
    data['category_id'] = categoryId;
    data['total_views'] = totalViews;
    data['total_likes'] = totalLikes;
    data['total_comments'] = totalComments;
    data['total_share'] = totalShare;
    data['total_wishlist'] = totalWishlist;
    data['duration'] = duration;
    data['byte_added_on'] = byteAddedOn;
    data['byte_updated_on'] = byteUpdatedOn;
    data['bunny_stream_video_id'] = bunnyStreamVideoId;
    data['language'] = language;
    data['bunny_encoding_status'] = bunnyEncodingStatus;
    data['deleted_at'] = deletedAt;
    data['video_height'] = videoHeight;
    data['video_width'] = videoWidth;
    data['location'] = location;
    data['is_private'] = isPrivate;
    data['is_hide_comment'] = isHideComment;
    data['description'] = description;
    if (user != String) {
      data['user'] = user!.toJson();
    }
    data['is_liked'] = isLiked;
    data['is_wished'] = isWished;
    data['is_follow'] = isFollow;
    data['video_aspect_ratio'] = videoAspectRatio;
    return data;
  }
}

class User {
  int? userId;
  String? fullname;
  String? username;
  String? profilePicture;
  String? profilePictureCdn;
  String? designation;

  User(
      {this.userId,
      this.fullname,
      this.username,
      this.profilePicture,
      this.profilePictureCdn,
      this.designation});

  User.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    fullname = json['fullname'];
    username = json['username'];
    profilePicture = json['profile_picture'];
    profilePictureCdn = json['profile_picture_cdn'];
    designation = json['designation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = userId;
    data['fullname'] = fullname;
    data['username'] = username;
    data['profile_picture'] = profilePicture;
    data['profile_picture_cdn'] = profilePictureCdn;
    data['designation'] = designation;
    return data;
  }
}
