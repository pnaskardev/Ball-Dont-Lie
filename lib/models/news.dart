class News {
  String? newsLink;
  String? image;
  String? title;
  String? publisherLogo;
  String? publisherName;
  String? publisherDate;

  News(
      {this.newsLink,
      this.image,
      this.title,
      this.publisherLogo,
      this.publisherName,
      this.publisherDate});

  News.fromJson(Map<String, dynamic> json) {
    newsLink = json['NewsLink'];
    image = json['Image'];
    title = json['Title'];
    publisherLogo = json['PublisherLogo'];
    publisherName = json['PublisherName'];
    publisherDate = json['PublisherDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['NewsLink'] = this.newsLink;
    data['Image'] = this.image;
    data['Title'] = this.title;
    data['PublisherLogo'] = this.publisherLogo;
    data['PublisherName'] = this.publisherName;
    data['PublisherDate'] = this.publisherDate;
    return data;
  }
}