import 'package:drop/core/colors/colors.dart';
import 'package:drop/presentation/screens/all_music_list/widgets/music_playing_interface_widget.dart';
import "package:flutter/material.dart";
import 'package:just_audio/just_audio.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:permission_handler/permission_handler.dart';

class Musics extends StatefulWidget {
  const Musics({
    super.key,
  });

  @override
  State<Musics> createState() => _MusicsState();
}

class _MusicsState extends State<Musics> {
  final OnAudioQuery _audioQuery = OnAudioQuery();
  final AudioPlayer player = AudioPlayer();
  bool isPlayerViewVisible = false;
  void _changePlayerViewVisibility() {
    setState(() {
      isPlayerViewVisible = !isPlayerViewVisible;
    });
  }

  @override
  void initState() {
    super.initState();
    requestPermission();
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  void requestPermission() {
    Permission.storage.request();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(30),
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: ConstantColors.dark,
              borderRadius: BorderRadius.circular(30),
            ),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: ConstantColors.violet2),
                  borderRadius: BorderRadius.circular(30),
                ),
                prefixText: "Search",
                hintStyle: TextStyle(color: ConstantColors.green),
                suffixIcon: Icon(
                  Icons.search,
                  color: ConstantColors.green,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: FutureBuilder<List<SongModel>>(
              future: _audioQuery.querySongs(
                sortType: null,
                orderType: OrderType.ASC_OR_SMALLER,
                uriType: UriType.EXTERNAL,
                ignoreCase: true,
              ),
              builder: (context, item) {
                if (item.data == null) return const CircularProgressIndicator();
                if (item.data!.isEmpty) return const Text("Nothing found!");
                return ListView.builder(
                  itemBuilder: ((context, index) {
                    List<SongModel> allSongs = [];
                    allSongs.clear();
                    allSongs = item.data!;
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 2),
                      child: GestureDetector(
                        onTap: () {
                          _changePlayerViewVisibility();
                          player.setAudioSource(createPlaylist(item.data!));
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  MusicPlayingInterfaceWidget(
                                    player: player,
                                    songModelList: [item.data![index]],
                                  )));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: ConstantColors.dark),
                          height: 70,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 18, right: 18),
                                child: QueryArtworkWidget(
                                    id: allSongs.elementAt(index).id,
                                    nullArtworkWidget: Icon(
                                      Icons.music_note_outlined,
                                      color: ConstantColors.violet2,
                                    ),
                                    type: ArtworkType.AUDIO),
                              ),
                              Expanded(
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Text(
                                    allSongs.elementAt(index).title,
                                    style: TextStyle(
                                      color: ConstantColors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(right: 25),
                                      child: (Icon(
                                        Icons.favorite_outline,
                                        color: ConstantColors.green,
                                      )),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 25),
                                      child: Icon(
                                        Icons.play_arrow_outlined,
                                        color: ConstantColors.green,
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
                  itemCount: item.data!.length,
                );
              }),
        ),
      ],
    );
  }

  ConcatenatingAudioSource createPlaylist(List<SongModel> songs) {
    List<AudioSource> sources = [];
    for (var song in songs) {
      sources.add(AudioSource.uri(Uri.parse(song.uri!)));
    }
    return ConcatenatingAudioSource(children: sources);
  }
}
