import 'dart:convert';

class GitUser {
  final String login;

  final String avatarUrl;

  final int publicRepos;

  final String reposUrl;
  final String followersUrl;
  final String name;

  final dynamic location;

  final dynamic bio;

  final int followers;
  final int following;

  GitUser({
    required this.login,
    required this.publicRepos,
    required this.avatarUrl,
    required this.reposUrl,
    required this.followersUrl,
    required this.name,
    required this.location,
    required this.bio,
    required this.followers,
    required this.following,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'login': login,
      'avatarUrl': avatarUrl,
      "publicRepos": publicRepos,
      'reposUrl': reposUrl,
      'name': name,
      'location': location,
      'followersUrl' : followersUrl,
      'followers': followers,
      'following': following,
    };
  }

  factory GitUser.fromMap(Map<String, dynamic> map) {
    return GitUser(
      login: map['login'] as String,
      publicRepos: map['public_repos'] as int,
      avatarUrl: map['avatar_url'] as String,
      reposUrl: map['repos_url'] as String,
      followersUrl: map["followers_url"] as String ,
      name: map['name'] as String,
      location: map['location'] as dynamic,
      bio: map['bio'] as dynamic,
      followers: map['followers'] as int,
      following: map['following'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory GitUser.fromJson(String source) =>
      GitUser.fromMap(json.decode(source) as Map<String, dynamic>);
}
