import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:healofy_assignment/features/article/models/article_res.dart';
import 'package:http/http.dart' as http;

class ArticleVM extends ChangeNotifier {
  bool _fetchingArticle = true;
  bool get fetchingArticle => _fetchingArticle;
  set fetchingArticle(bool value) {
    _fetchingArticle = value;
    notifyListeners();
  }

  ArticleData? articleData;

  ArticleVM() {
    fetchArticle();
  }

  Future<void> fetchArticle() async {
    try {
      final request = http.Request('GET', Uri.parse('https://afsarhealofy.github.io/flutterapitest/flutterapitest.json'));
      final http.StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        final Map<String, dynamic> resJson = json.decode(await response.stream.bytesToString()) as Map<String, dynamic>;
        final ArticleResponse articleResponse = ArticleResponse.fromJson(resJson);
        articleData = articleResponse.data;
      }
    } catch (e) {
      articleData = null;
      notifyListeners();
      debugPrint("Error fetching article: $e");
    } finally {
      fetchingArticle = false;
    }
  }
}
