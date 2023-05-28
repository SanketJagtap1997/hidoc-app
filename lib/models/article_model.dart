import 'package:hidoc/common/utils/app_errors.dart';

class ArticleModel {
  int? success;
  String? message;
  ArticalData? articalData;
  String? timestamp;

  ArticleModel({this.success, this.message, this.articalData, this.timestamp});

  ArticleModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    articalData = json['data'] != null ? ArticalData.fromJson(json['data']) : null;
    timestamp = json['timestamp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.articalData != null) {
      data['data'] = this.articalData?.toJson();
    }
    data['timestamp'] = this.timestamp;
    return data;
  }
}

class ArticalData {
  List<News>? news;
  List<TrandingBulletin>? trandingBulletin;
  String? specialityName;
  List<Article>? latestArticle;
  List<ExploreArticle>? exploreArticle;
  List<Article>? trandingArticle;
  Article? article;
  List<Article>? bulletin;
  int? sId;

  ArticalData({this.news, this.trandingBulletin, this.specialityName, this.latestArticle, this.exploreArticle, this.trandingArticle, this.article, this.bulletin, this.sId});

  ArticalData.fromJson(Map<String, dynamic> json) {
    if (json['news'] != null) {
      news = <News>[];
      json['news'].forEach((v) {
        news?.add(new News.fromJson(v));
      });
    }
    if (json['trandingBulletin'] != null) {
      trandingBulletin = <TrandingBulletin>[];
      json['trandingBulletin'].forEach((v) {
        trandingBulletin?.add(new TrandingBulletin.fromJson(v));
      });
    }
    specialityName = json['specialityName'];
    if (json['latestArticle'] != null) {
      latestArticle = <Article>[];
      json['latestArticle'].forEach((v) {
        latestArticle?.add(Article.fromJson(v));
      });
    }
    if (json['exploreArticle'] != null) {
      exploreArticle = <ExploreArticle>[];
      json['exploreArticle'].forEach((v) {
        exploreArticle?.add(new ExploreArticle.fromJson(v));
      });
    }
    if (json['trandingArticle'] != null) {
      trandingArticle = <Article>[];
      json['trandingArticle'].forEach((v) {
        trandingArticle?.add(Article.fromJson(v));
      });
    }
    article = json['article'] != null ? new Article.fromJson(json['article']) : null;
    if (json['bulletin'] != null) {
      bulletin = <Article>[];
      json['bulletin'].forEach((v) {
        bulletin?.add(Article.fromJson(v));
      });
    }
    sId = json['sId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.news != null) {
      data['news'] = this.news?.map((v) => v.toJson()).toList();
    }
    if (this.trandingBulletin != null) {
      data['trandingBulletin'] = this.trandingBulletin?.map((v) => v.toJson()).toList();
    }
    data['specialityName'] = this.specialityName;
    // if (this.latestArticle != null) {
    //   data['latestArticle'] =
    //       this.latestArticle.map((v) => v.toJson()).toList();
    // }
    if (this.exploreArticle != null) {
      data['exploreArticle'] = this.exploreArticle?.map((v) => v.toJson()).toList();
    }
    // if (this.trandingArticle != null) {
    //   data['trandingArticle'] =
    //       this.trandingArticle.map((v) => v.toJson()).toList();
    // }
    if (this.article != null) {
      data['article'] = this.article?.toJson();
    }
    // if (this.bulletin != null) {
    //   data['bulletin'] = this.bulletin.map((v) => v.toJson()).toList();
    // }
    data['sId'] = this.sId;
    return data;
  }
}

class News {
  int? id;
  String? title;
  String? url;
  String? urlToImage;
  String? description;
  String? speciality;
  String? newsUniqueId;
  int? trendingLatest;
  String? publishedAt;

  News({this.id, this.title, this.url, this.urlToImage, this.description, this.speciality, this.newsUniqueId, this.trendingLatest, this.publishedAt});

  News.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    url = json['url'];
    urlToImage = json['urlToImage'];
    description = json['description'];
    speciality = json['speciality'];
    newsUniqueId = json['newsUniqueId'];
    trendingLatest = json['trendingLatest'];
    publishedAt = json['publishedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['url'] = this.url;
    data['urlToImage'] = this.urlToImage;
    data['description'] = this.description;
    data['speciality'] = this.speciality;
    data['newsUniqueId'] = this.newsUniqueId;
    data['trendingLatest'] = this.trendingLatest;
    data['publishedAt'] = this.publishedAt;
    return data;
  }
}

class TrandingBulletin {
  int? id;
  String? articleTitle;
  String? redirectLink;
  String? articleImg;
  String? articleDescription;

  TrandingBulletin({
    this.id,
    this.articleTitle,
    this.redirectLink,
    this.articleImg,
    this.articleDescription,
  });

  TrandingBulletin.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    articleTitle = json['articleTitle'];
    redirectLink = json['redirectLink'];
    articleImg = json['articleImg'];
    articleDescription = json['articleDescription'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['articleTitle'] = this.articleTitle;
    data['redirectLink'] = this.redirectLink;
    data['articleImg'] = this.articleImg;
    data['articleDescription'] = this.articleDescription;

    return data;
  }
}

class ExploreArticle {
  int? id;
  String? articleTitle;
  String? redirectLink;
  String? articleImg;
  String? articleDescription;
  String? specialityId;
  int? rewardPoints;
  String? keywordsList;
  String? articleUniqueId;
  int? articleType;
  String? createdAt;

  ExploreArticle(
      {this.id,
      this.articleTitle,
      this.redirectLink,
      this.articleImg,
      this.articleDescription,
      this.specialityId,
      this.rewardPoints,
      this.keywordsList,
      this.articleUniqueId,
      this.articleType,
      this.createdAt});

  ExploreArticle.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    articleTitle = json['articleTitle'];
    redirectLink = json['redirectLink'];
    articleImg = json['articleImg'];
    articleDescription = json['articleDescription'];
    specialityId = json['specialityId'];
    rewardPoints = json['rewardPoints'];
    keywordsList = json['keywordsList'];
    articleUniqueId = json['articleUniqueId'];
    articleType = json['articleType'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['articleTitle'] = this.articleTitle;
    data['redirectLink'] = this.redirectLink;
    data['articleImg'] = this.articleImg;
    data['articleDescription'] = this.articleDescription;
    data['specialityId'] = this.specialityId;
    data['rewardPoints'] = this.rewardPoints;
    data['keywordsList'] = this.keywordsList;
    data['articleUniqueId'] = this.articleUniqueId;
    data['articleType'] = this.articleType;
    data['createdAt'] = this.createdAt;
    return data;
  }
}

class Article {
  int? id;
  String? articleTitle;
  String? redirectLink;
  String? articleImg;
  String? articleDescription;
  String? specialityId;
  int? rewardPoints;
  String? keywordsList;
  int? articleType;
  String? createdAt;

  Article(
      {this.id,
      this.articleTitle,
      this.redirectLink,
      this.articleImg,
      this.articleDescription,
      this.specialityId,
      this.rewardPoints,
      this.keywordsList,
      this.articleType,
      this.createdAt});

  Article.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    articleTitle = json['articleTitle'];
    redirectLink = json['redirectLink'];
    articleImg = json['articleImg'];
    articleDescription = json['articleDescription'];
    specialityId = json['specialityId'];
    rewardPoints = json['rewardPoints'];
    keywordsList = json['keywordsList'];
    articleType = json['articleType'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['articleTitle'] = this.articleTitle;
    data['redirectLink'] = this.redirectLink;
    data['articleImg'] = this.articleImg;
    data['articleDescription'] = this.articleDescription;
    data['specialityId'] = this.specialityId;
    data['rewardPoints'] = this.rewardPoints;
    data['keywordsList'] = this.keywordsList;
    data['articleType'] = this.articleType;
    data['createdAt'] = this.createdAt;
    return data;
  }
}

class ArticleDataResponse {
  final ArticleModel? data;
  final AppBaseError? error;

  ArticleDataResponse(this.data, this.error);

  ArticleDataResponse.fromJson(Map<String, dynamic> json)
      : data = ArticleModel.fromJson(json),
        error = null;

  ArticleDataResponse.withError(this.error) : data = null;
}
