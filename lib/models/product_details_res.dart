class FlutterTestRes {
  FlutterTestRes({required this.status, required this.data});

  final String? status;
  final Data? data;

  factory FlutterTestRes.fromJson(Map<String, dynamic> json) {
    return FlutterTestRes(
      status: json["status"] as String?,
      data: json["data"] == null ? null : Data.fromJson(json["data"] as Map<String, dynamic>),
    );
  }
}

class Data {
  Data({required this.theme, required this.contents});

  final HealofyTheme? theme;
  final List<DataContent> contents;

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      theme: json["theme"] == null ? null : HealofyTheme.fromJson(json["theme"] as Map<String, dynamic>),
      contents: json["contents"] == null
          ? []
          : List<DataContent>.from((json["contents"] as List).map((x) => DataContent.fromJson(x as Map<String, dynamic>))),
    );
  }
}

class DataContent {
  DataContent({required this.type, required this.item});

  final String? type;
  final Item? item;

  factory DataContent.fromJson(Map<String, dynamic> json) {
    return DataContent(
      type: json["type"] as String?,
      item: json["item"] == null ? null : Item.fromJson(json["item"] as Map<String, dynamic>),
    );
  }
}

class Item {
  Item({
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

  final String? mediaType;
  final String? url;
  final String? thumbnailUrl;
  final int? height;
  final int? width;
  final String? background;
  final String? title;
  final String? subTitle;
  final List<VideoReviewElement> contents;
  final List<VideoReviewElement> videoReviews;

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      mediaType: json["mediaType"] as String?,
      url: json["url"] as String?,
      thumbnailUrl: json["thumbnailUrl"] as String?,
      height: json["height"] as int?,
      width: json["width"] as int?,
      background: json["background"] as String?,
      title: json["title"] as String?,
      subTitle: json["subTitle"] as String?,
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

  final String? mediaType;
  final String? url;
  final int? height;
  final int? width;
  final String? thumbnailUrl;
  final String? fullVideoUrl;

  factory VideoReviewElement.fromJson(Map<String, dynamic> json) {
    return VideoReviewElement(
      mediaType: json["mediaType"] as String?,
      url: json["url"] as String?,
      height: json["height"] as int?,
      width: json["width"] as int?,
      thumbnailUrl: json["thumbnailUrl"] as String?,
      fullVideoUrl: json["fullVideoUrl"] as String?,
    );
  }
}

class HealofyTheme {
  HealofyTheme({
    required this.backgroundLight,
    required this.backgroundDark,
    required this.title,
    required this.subTitle,
    required this.message,
    required this.button,
  });

  final String? backgroundLight;
  final String? backgroundDark;
  final String? title;
  final String? subTitle;
  final String? message;
  final String? button;

  factory HealofyTheme.fromJson(Map<String, dynamic> json) {
    return HealofyTheme(
      backgroundLight: json["backgroundLight"] as String?,
      backgroundDark: json["backgroundDark"] as String?,
      title: json["title"] as String?,
      subTitle: json["subTitle"] as String?,
      message: json["message"] as String?,
      button: json["button"] as String?,
    );
  }
}
