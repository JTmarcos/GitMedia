import 'package:flutter/material.dart';
import 'package:gitmedia/data/components/custom_text_form.dart';
import 'package:gitmedia/data/models/arguments.dart';

import 'package:gitmedia/data/models/follower_model.dart';
import 'package:gitmedia/data/repository/user_repository.dart';

import 'package:gitmedia/routes/routes.dart';

// ignore: must_be_immutable
class CustomRow extends StatefulWidget {
  final String image;
  final int qntRepos;
  final int followers;
  final int following;
  final String followerUrl;
  final String account;

  const CustomRow(
      {super.key,
      required this.image,
      required this.followers,
      required this.following,
      required this.qntRepos,
      required this.followerUrl,
      required this.account});

  @override
  State<CustomRow> createState() => _CustomRowState();
}

class _CustomRowState extends State<CustomRow> {
  GitUserRepository client = GitUserRepository();

  List<Follower>? list;

  Future<void> callFollowers(url) async {
    try {
      final response = await client.callFollowList(url);
      list = response;
    } catch (e) {
      list = [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 20, 5, 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 100,
            height: 100,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.network(
                widget.image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: MediaQuery.of(context).size.width * 0.05),
          InkWell(
            splashColor: Colors.transparent,
            onTap: () async {
              await callFollowers(widget.followerUrl);
              final FollowerPageArguments argument =
                  FollowerPageArguments(name: widget.account, followers: list);
              navigatorKey.currentState!
                  .pushNamed(Routes.followerPage, arguments: argument);
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "${widget.followers}",
                  style: const TextStyle(fontSize: 18),
                ),
                const Text(
                  "Followers",
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.05,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "${widget.following}",
                style: const TextStyle(fontSize: 18),
              ),
              const Text(
                "Following",
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.05,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "${widget.qntRepos}",
                style: const TextStyle(fontSize: 18),
              ),
              const Text(
                "Repos",
                style: TextStyle(fontSize: 18),
              ),
            ],
          )
        ],
      ),
    );
  }
}
