import 'package:flutter/material.dart';
import 'package:worshipsong_cross_platform/Views/SongsTitleListWidget.dart';
import 'package:worshipsong_cross_platform/domain/Song.dart';

class TabBarWidget extends StatelessWidget {
  final List<Song> songs;
  const TabBarWidget({super.key, required this.songs});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 1,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              tabs: [
                Tab(icon: Icon(Icons.book)),
              ],
            ),
            title: const Text('Worship song'),
          ),
          body: TabBarView(
            children: <Widget>[
              new SongsTitleListWidget().defaultListView(songs),
            ],
          ),
        ),
      ),
    );
  }
}