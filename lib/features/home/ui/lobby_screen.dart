import 'package:flutter/material.dart';
import 'package:moltaqa/features/home/ui/widgets/online_room/lobby_intro_card.dart';
import 'package:moltaqa/features/home/ui/widgets/online_room/lobby_players_listview.dart';
import 'package:moltaqa/features/home/ui/widgets/online_room/room_chat.dart';

class LobbyScreen extends StatelessWidget {
  const LobbyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: SafeArea(
          child: Column(
            spacing: 20,
            children: [LobbyIntroCard(), RoomChat(), LobbyPlayersListview()],
          ),
        ),
      ),
    );
  }
}
