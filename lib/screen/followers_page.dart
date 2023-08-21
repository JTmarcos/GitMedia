import 'package:flutter/material.dart';
import 'package:gitmedia/data/components/follower_card.dart';
import 'package:gitmedia/data/models/arguments.dart';

class FollowersPage extends StatelessWidget {
  const FollowersPage({super.key});

  @override
  Widget build(BuildContext context) {
    final FollowerPageArguments args =
        ModalRoute.of(context)?.settings.arguments as FollowerPageArguments;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(args.name),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              child: ListView.separated(
                physics: const ClampingScrollPhysics(),
                shrinkWrap: true,
                separatorBuilder: (BuildContext context, int index) =>
                    const Divider(
                  height: 0,
                  color: Colors.white,
                ),
                itemCount: args.followers!.length,
                itemBuilder: (BuildContext context, int index) {
                  return FollowerCard(
                      follower: args.followers!.elementAt(index));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
