// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Follower {
  final String login;
  final String avatarUrl;
  final String url;
  final String htmlUrl;
  final String repoUrl;

  Follower({
    required this.login,
    required this.avatarUrl,
    required this.url,
    required this.htmlUrl,
    required this.repoUrl,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'login': login,
      'avatarUrl': avatarUrl,
      'url': url,
      'htmlUrl': htmlUrl,
      'repoUrl': repoUrl,
    };
  }

  factory Follower.fromMap(Map<String, dynamic> map) {
    return Follower(
      login: map['login'] as String,
      avatarUrl: map['avatar_url'] as String,
      url: map['url'] as String,
      htmlUrl: map['html_url'] as String,
      repoUrl: map['repos_url'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Follower.fromJson(String source) =>
      Follower.fromMap(json.decode(source) as Map<String, dynamic>);
}
