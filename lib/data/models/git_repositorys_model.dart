// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class GitRepository {
  final int id;

  final String name;

  final bool private;

  final String htmlUrl;
  final String? description;

  final String url;

  final String? language;

  final String visibility;

  GitRepository({
    required this.id,
    required this.name,
    required this.private,
    required this.htmlUrl,
    required this.description,
    required this.url,
    required this.language,
    required this.visibility,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'private': private,
      'htmlUrl': htmlUrl,
      'description': description,
      'url': url,
      'language': language,
      'visibility': visibility,
    };
  }

  factory GitRepository.fromMap(Map<String, dynamic> map) {
    return GitRepository(
      id: map['id'] as int,
      name: map['name'] as String,
      private: map['private'] as bool,
      htmlUrl: map['html_url'] as String,
      description:
          map['description'] != null ? map['description'] as String : null,
      url: map['url'] as String,
      language: map['language'] != null ? map['language'] as String : null,
      visibility: map['visibility'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory GitRepository.fromJson(String source) =>
      GitRepository.fromMap(json.decode(source) as Map<String, dynamic>);
}

