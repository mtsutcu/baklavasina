import 'package:baklavasina/widgets/league_card_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class LeaguesPageViewWidget extends StatefulWidget {
  const LeaguesPageViewWidget({Key? key}) : super(key: key);

  @override
  State<LeaguesPageViewWidget> createState() => _LeaguesPageViewWidgetState();
}

class _LeaguesPageViewWidgetState extends State<LeaguesPageViewWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
      child: PageView(
        physics: BouncingScrollPhysics(),
        children: [
          LeagueCardWidget(
            leagueText: "1. LİG",
          ),
          LeagueCardWidget(
            leagueText: "2. LİG",
          ),
          LeagueCardWidget(
            leagueText: "3. LİG",
          ),
        ],
      ),
    );
  }
}
