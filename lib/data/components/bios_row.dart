import 'package:flutter/material.dart';

class BiosRow extends StatelessWidget {
  const BiosRow(
      {super.key,
      required this.bios,
      required this.login,
      required this.location});
  final String? bios;
  final String login;
  final String? location;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 10, 5, 10),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(login,style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              const SizedBox(
                height: 5,
              ),
              if (location != null) Text(location!,style: const TextStyle(fontSize: 15),),
              const SizedBox(
                height: 5,
              ),
              if (bios != null)
                SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: Text(
                      bios!,
                      maxLines: 10,
                      overflow: TextOverflow.ellipsis,
                    )),
              const SizedBox(
                height: 5,
              ),
            ],
          )
        ],
      ),
    );
  }
}
