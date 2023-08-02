import 'package:equatable/equatable.dart';

class NyTimesEntity extends Equatable {
  final String source;
  final String title;
  final String abstractAboutNews;
  final String byline;
  final String publishedDate;
  final List<MediaEntity> media;

  const NyTimesEntity({
    required this.source,
    required this.title,
    required this.abstractAboutNews,
    required this.byline,
    required this.publishedDate,
    required this.media,
  });

  @override
  List<Object> get props =>
      [title, abstractAboutNews, byline, publishedDate, media,source];
}

class MediaEntity extends Equatable {
  final List<MediaMetaData> mediaMetaData;

  const MediaEntity({required this.mediaMetaData});

  @override
  List<Object> get props => [mediaMetaData];
}

class MediaMetaData extends Equatable {
  final String url;

  const MediaMetaData({required this.url});

  @override
  List<Object> get props => [url];
}
