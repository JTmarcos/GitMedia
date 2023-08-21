import 'package:flutter/material.dart';
import 'package:gitmedia/data/components/custom_text_form.dart';
import 'package:gitmedia/data/models/arguments.dart';
import 'package:gitmedia/data/models/follower_model.dart';
import 'package:gitmedia/data/models/git_repositorys_model.dart';
import 'package:gitmedia/data/models/git_user_model.dart';
import 'package:gitmedia/data/repository/user_repository.dart';
import 'package:gitmedia/routes/routes.dart';

class FollowerCard extends StatefulWidget {
  final Follower follower;

  const FollowerCard({super.key, required this.follower});

  @override
  State<FollowerCard> createState() => _FollowerCardState();
}

class _FollowerCardState extends State<FollowerCard> {
  final GitUserRepository client = GitUserRepository();

  late List<GitRepository> repoList;
  late Arguments arguments;
  GitUser? user;

  Future<void> apiUserButton(String value) async {
    Future.delayed(const Duration(seconds: 2));
    try {
      final response = await client.getFollower(value);
      user = response;
    } catch (e) {
      user = null;
    }
  }

  Future<void> apiRepoButton(String value) async {
    Future.delayed(const Duration(seconds: 2));
    try {
      final repoResponse = await client.getRepoFollower(value);
      repoList = repoResponse;
    } catch (e) {
      repoList = [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.10,
      width: MediaQuery.of(context).size.width,
      child: GestureDetector(
        onTap: () async {
          await apiUserButton(widget.follower.url);
          await apiRepoButton(widget.follower.repoUrl);

          if (user != null) {
            final Arguments arguments = Arguments(list: repoList, user: user);
            navigatorKey.currentState!.popAndPushNamed(
              Routes.searchpage,
              arguments: arguments,
            );
          } else {
            navigatorKey.currentState!
                .pushReplacementNamed(Routes.unfindedpage);
          }
        },
        child: Card(
          color: Colors.black,
          child: Row(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.15,
                width: MediaQuery.of(context).size.width * 0.15,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                        child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.network(
                        widget.follower.avatarUrl,
                        fit: BoxFit.fill,
                      ),
                    )),
                  ],
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.05,
              ),
              Text(
                widget.follower.login,
                style: const TextStyle(color: Colors.white),
              )
            ],
          ),
        ),
      ),
    );
  }
}
