import 'dart:convert';

class UnsplashPhoto {
  final String id;
  final String slug;
  final AlternativeSlugs alternativeSlugs;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? promotedAt;
  final int width;
  final int height;
  final String color;
  final String blurHash;
  final String? description;
  final String altDescription;
  final List<dynamic>? breadcrumbs;
  final PhotoUrls urls;
  final PhotoLinks links;
  final int likes;
  final bool likedByUser;
  final List<dynamic>? currentUserCollections;
  final dynamic sponsorship;
  final String assetType;
  final PhotoUser user;

  UnsplashPhoto({
    required this.id,
    required this.slug,
    required this.alternativeSlugs,
    required this.createdAt,
    required this.updatedAt,
    this.promotedAt,
    required this.width,
    required this.height,
    required this.color,
    required this.blurHash,
    this.description,
    required this.altDescription,
    this.breadcrumbs,
    required this.urls,
    required this.links,
    required this.likes,
    required this.likedByUser,
    this.currentUserCollections,
    this.sponsorship,
    required this.assetType,
    required this.user,
  });

  factory UnsplashPhoto.fromJson(Map<String, dynamic> json) {
    return UnsplashPhoto(
      id: json['id'],
      slug: json['slug'],
      alternativeSlugs: AlternativeSlugs.fromJson(json['alternative_slugs']),
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      promotedAt:
          json['promoted_at'] != null
              ? DateTime.parse(json['promoted_at'])
              : null,
      width: json['width'],
      height: json['height'],
      color: json['color'],
      blurHash: json['blur_hash'],
      description: json['description'] ?? "",
      altDescription: json['alt_description'] ?? "",
      breadcrumbs: json['breadcrumbs'] ?? [],
      urls: PhotoUrls.fromJson(json['urls']),
      links: PhotoLinks.fromJson(json['links']),
      likes: json['likes'],
      likedByUser: json['liked_by_user'] ?? "",
      currentUserCollections: json['current_user_collections'] ?? [],
      sponsorship: json['sponsorship'] ?? "",
      assetType: json['asset_type'] ?? "",
      user: PhotoUser.fromJson(json['user']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'slug': slug,
      'alternative_slugs': alternativeSlugs.toJson(),
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
      'promoted_at': promotedAt?.toIso8601String(),
      'width': width,
      'height': height,
      'color': color,
      'blur_hash': blurHash,
      'description': description,
      'alt_description': altDescription,
      'breadcrumbs': breadcrumbs,
      'urls': urls.toJson(),
      'links': links.toJson(),
      'likes': likes,
      'liked_by_user': likedByUser,
      'current_user_collections': currentUserCollections,
      'sponsorship': sponsorship,
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
