import 'package:worshipsong_cross_platform/domain/Song.dart';
import 'package:xml/xml.dart' as xml;

class SongParser {
  List<String> parseSong(Song song) {
    List<String> verseList = [];
    final document = xml.XmlDocument.parse(song.lyrics);
    final songNode = document.findElements('song');
    if (songNode.isNotEmpty) {
      final lyricNode = songNode.first.findElements('lyrics');
      if (lyricNode.isNotEmpty) {
        final verses = lyricNode.first.findElements('verse');
        for (final verse in verses) {
          verseList.add(formatVerse(verse.innerText));
        }
      }
    } else {
      verseList.add(song.lyrics);
    }
    return verseList;
  }

  String formatVerse(String verse) {
    return verse.replaceAll(RegExp('\\{\\w\\}'), '<tamil>')
                .replaceAll(RegExp('\\{/\\w\\}'), '</tamil>');
  }


}