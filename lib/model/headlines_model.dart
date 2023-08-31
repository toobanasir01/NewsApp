class Articles {
  Source? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

  Articles(
      {this.source,
      this.author,
      this.title,
      this.description,
      this.url,
      this.urlToImage,
      this.publishedAt,
      this.content});

  Articles.fromJson(Map<String, dynamic> json) {
    source = json['source'] != null ? Source.fromJson(json['source']) : null;
    author = json['author'] ?? "Anonymous";
    title = json['title'] ?? "Anonymous";
    description = json['description'] ??
        "Anonymous dat is not conatine please visit website for full news";
    url = json['url'] ??
        "https://dcblog.b-cdn.net/wp-content/uploads/2021/02/Full-form-of-URL-1-1024x824.jpg";
    urlToImage = json['urlToImage'] ??
        "https://dcblog.b-cdn.net/wp-content/uploads/2021/02/Full-form-of-URL-1-1024x824.jpg";
    publishedAt = json['publishedAt'];
    content = json['content'] ??
        "Please visit our site for complete news Thank you       [6534 chars]";
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (source != null) {
      data['source'] = source!.toJson();
    }
    data['author'] = author;
    data['title'] = title;
    data['description'] = description;
    data['url'] = url;
    data['urlToImage'] = urlToImage;
    data['publishedAt'] = publishedAt;
    data['content'] = content;
    return data;
  }
}

class Source {
  String? id;
  String? name;

  Source({this.id, this.name});

  Source.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}
