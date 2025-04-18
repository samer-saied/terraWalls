import 'dart:convert';

class UnsplashPhoto {
  final String id;
  final String slug;
  // final AlternativeSlugs alternativeSlugs;
  final DateTime createdAt;
  final int width;
  final int height;
  final String color;
  final String? description;
  final String altDescription;
  final PhotoUrls urls;
  final PhotoLinks links;
  final String assetType;
  final PhotoUser user;

  UnsplashPhoto({
    required this.id,
    required this.slug,
    // required this.alternativeSlugs,
    required this.createdAt,
    required this.width,
    required this.height,
    required this.color,
    this.description,
    required this.altDescription,
    required this.urls,
    required this.links,

    required this.assetType,
    required this.user,
  });

  factory UnsplashPhoto.fromJson(Map<String, dynamic> json) {
    return UnsplashPhoto(
      id: json['id'].toString(),
      slug: json['slug'],
      createdAt:json['created_at'] == null ? DateTime.now() : DateTime.parse(json['created_at']),
      width: json['width'],
      height: json['height'],
      color: json['color'] ?? "",
      description: json['description'] ?? "",
      altDescription: json['alt_description'] ?? "",
      urls: PhotoUrls.fromJson(json['urls']),
      links:
          json['links'] == null
              ? PhotoLinks(download: "sa", self: "sa")
              : PhotoLinks.fromJson(json['links']),
      assetType: json['asset_type'] ?? "",
      user: PhotoUser.fromJson(json['user']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'slug': slug,
      // 'alternative_slugs': alternativeSlugs.toJson(),
      'created_at': createdAt.toIso8601String(),
      'width': width,
      'height': height,
      'color': color,
      'description': description,
      'alt_description': altDescription,
      'urls': urls.toJson(),
      'links': links.toJson(),
      'asset_type': assetType,
      'user': user.toJson(),
    };
  }

  String toJsonString() => json.encode(toJson());
}

class AlternativeSlugs {
  final String en;
  final String es;
  // Add other languages as needed

  AlternativeSlugs({required this.en, required this.es});

  factory AlternativeSlugs.fromJson(Map<String, dynamic> json) {
    return AlternativeSlugs(
      en: json['en'],
      es: json['es'],
      // Add other languages as needed
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'en': en,
      'es': es,
      // Add other languages as needed
    };
  }
}

class PhotoUrls {
  final String raw;
  final String full;
  final String regular;

  // Add other URL types as needed

  PhotoUrls({required this.raw, required this.full, required this.regular});

  factory PhotoUrls.fromJson(Map<String, dynamic> json) {
    return PhotoUrls(
      raw: json['raw'],
      full: json['full'],
      regular: json['regular'],
      // Add other URL types as needed
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'raw': raw,
      'full': full,
      'regular': regular,
      // Add other URL types as needed
    };
  }
}

class PhotoLinks {
  final String self;
  final String download;
  // Add other link types as needed

  PhotoLinks({required this.self, required this.download});

  factory PhotoLinks.fromJson(Map<String, dynamic> json) {
    return PhotoLinks(
      self: json['self'],
      download: json['download'],
      // Add other link types as needed
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'self': self,
      'download': download,
      // Add other link types as needed
    };
  }
}

class SportsTopic {
  final String status;
  final DateTime approvedOn;

  SportsTopic({required this.status, required this.approvedOn});

  factory SportsTopic.fromJson(Map<String, dynamic> json) {
    return SportsTopic(
      status: json['status'],
      approvedOn: DateTime.parse(json['approved_on']),
    );
  }

  Map<String, dynamic> toJson() {
    return {'status': status, 'approved_on': approvedOn.toIso8601String()};
  }
}

class PhotoUser {
  final String id;
  final DateTime updatedAt;
  final String username;
  final String name;

  PhotoUser({
    required this.id,
    required this.updatedAt,
    required this.username,
    required this.name,
  });

  factory PhotoUser.fromJson(Map<String, dynamic> json) {
    return PhotoUser(
      id: json['id'],
      updatedAt: DateTime.parse(json['updated_at']),
      username: json['username'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'updated_at': updatedAt.toIso8601String(),
      'username': username,
      'name': name,
    };
  }
}
