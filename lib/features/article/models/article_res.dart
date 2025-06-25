import 'package:flutter/material.dart';
import 'package:healofy_assignment/utils/app_colors.dart';

class ArticleResponse {
  ArticleResponse({required this.status, required this.data});

  final String status;
  final ArticleData? data;

  factory ArticleResponse.fromJson(Map<String, dynamic> json) {
    return ArticleResponse(
      status: json["status"] as String,
      data: json["data"] == null ? null : ArticleData.fromJson(json["data"] as Map<String, dynamic>),
    );
  }

  @override
  String toString() => "$status, $data, ";
}

class ArticleData {
  ArticleData({required this.theme, required this.contents});

  final HTheme? theme;
  final List<DataContent> contents;

  factory ArticleData.fromJson(Map<String, dynamic> json) {
    return ArticleData(
      theme: json["theme"] == null ? null : HTheme.fromJson(json["theme"] as Map<String, dynamic>),
      contents: json["contents"] == null
          ? []
          : List<DataContent>.from((json["contents"] as List).map((x) => DataContent.fromJson(x as Map<String, dynamic>))),
    );
  }

  @override
  String toString() => "$theme, $contents, ";
}

class DataContent {
  DataContent({required this.type, required this.item});

  final String type;
  final AItem? item;

  factory DataContent.fromJson(Map<String, dynamic> json) {
    return DataContent(
      type: json["type"] as String,
      item: json["item"] == null ? null : AItem.fromJson(json["item"] as Map<String, dynamic>),
    );
  }

  @override
  String toString() => "$type, $item, ";
}

class AItem {
  AItem({
    required this.mediaType,
    required this.url,
    required this.thumbnailUrl,
    required this.height,
    required this.width,
    required this.background,
    required this.title,
    required this.subTitle,
    required this.contents,
    required this.videoReviews,
  });

  final String mediaType;
  final String url;
  final String thumbnailUrl;
  final int height;
  final int width;
  final String background;
  final String title;
  final String subTitle;
  final List<VideoReviewElement> contents;
  final List<VideoReviewElement> videoReviews;

  factory AItem.fromJson(Map<String, dynamic> json) {
    return AItem(
      mediaType: json["mediaType"] as String? ?? "",
      url: json["url"] as String? ?? "",
      thumbnailUrl: json["thumbnailUrl"] as String? ?? "",
      height: json["height"] as int? ?? 0,
      width: json["width"] as int? ?? 0,
      background: json["background"] as String? ?? "",
      title: json["title"] as String? ?? "",
      subTitle: json["subTitle"] as String? ?? "",
      contents: json["contents"] == null
          ? []
          : List<VideoReviewElement>.from(
              (json["contents"] as List).map((x) => VideoReviewElement.fromJson(x as Map<String, dynamic>)),
            ),
      videoReviews: json["videoReviews"] == null
          ? []
          : List<VideoReviewElement>.from(
              (json["videoReviews"] as List).map((x) => VideoReviewElement.fromJson(x as Map<String, dynamic>)),
            ),
    );
  }

  @override
  String toString() {
    return "$mediaType, $url, $thumbnailUrl, $height, $width, $background, $title, $subTitle, $contents, $videoReviews, ";
  }
}

class VideoReviewElement {
  VideoReviewElement({
    required this.mediaType,
    required this.url,
    required this.height,
    required this.width,
    required this.thumbnailUrl,
    required this.fullVideoUrl,
  });

  final String mediaType;
  final String url;
  final int height;
  final int width;
  final String thumbnailUrl;
  final String fullVideoUrl;

  factory VideoReviewElement.fromJson(Map<String, dynamic> json) {
    return VideoReviewElement(
      mediaType: json["mediaType"] as String? ?? "",
      url: json["url"] as String? ?? "",
      height: json["height"] as int? ?? 0,
      width: json["width"] as int? ?? 0,
      thumbnailUrl: json["thumbnailUrl"] as String? ?? "",
      fullVideoUrl: json["fullVideoUrl"] as String? ?? "",
    );
  }

  @override
  String toString() {
    return "$mediaType, $url, $height, $width, $thumbnailUrl, $fullVideoUrl, ";
  }
}

class HTheme {
  HTheme({
    required this.backgroundLight,
    required this.backgroundDark,
    required this.title,
    required this.subTitle,
    required this.message,
    required this.button,
  });

  final Color? backgroundLight;
  final Color? backgroundDark;
  final Color? title;
  final Color? subTitle;
  final Color? message;
  final Color? button;

  factory HTheme.fromJson(Map<String, dynamic> json) {
    return HTheme(
      backgroundLight: json["backgroundLight"] != null ? HexColor.fromHex(json["backgroundLight"] as String) : null,
      backgroundDark: json["backgroundDark"] != null ? HexColor.fromHex(json["backgroundDark"] as String) : null,
      title: json["title"] != null ? HexColor.fromHex(json["title"] as String) : null,
      subTitle: json["subTitle"] != null ? HexColor.fromHex(json["subTitle"] as String) : null,
      message: json["message"] != null ? HexColor.fromHex(json["message"] as String) : null,
      button: json["button"] != null ? HexColor.fromHex(json["button"] as String) : null,
    );
  }

  @override
  String toString() {
    return "$backgroundLight, $backgroundDark, $title, $subTitle, $message, $button, ";
  }
}
