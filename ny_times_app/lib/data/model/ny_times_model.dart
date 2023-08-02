import 'package:ny_times_app/domain/entity/ny_times_entity.dart';

final class NyTimesModel extends NyTimesEntity {
  const NyTimesModel(
      {required super.title,
      required super.abstractAboutNews,
      required super.byline,
      required super.publishedDate,
      required super.media,
      required super.source});

  factory NyTimesModel.fromJson(JsonMap json) => NyTimesModel(
        title: json['title'],
        abstractAboutNews: json['abstract'],
        byline: json['byline'],
        publishedDate: json['published_date'],
        media: (json['media'] as List)
            .map((media) => MediaModel.fromJson(media))
            .toList(),
        source: json['source'],
      );
}

final class MediaModel extends MediaEntity {
  const MediaModel({required super.mediaMetaData});

  factory MediaModel.fromJson(JsonMap json) => MediaModel(
      mediaMetaData: (json['media-metadata'] as List)
          .map((media) => MediaMetaDataModel.fromJson(media))
          .toList());
}

final class MediaMetaDataModel extends MediaMetaData {
  const MediaMetaDataModel({required super.url});
  factory MediaMetaDataModel.fromJson(JsonMap json) =>
      MediaMetaDataModel(url: json['url']);
}

typedef JsonMap = Map<String, dynamic>;
