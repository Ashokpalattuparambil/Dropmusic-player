import 'dart:developer';
import 'package:drop/core/colors/colors.dart';
import 'package:drop/presentation/screens/all_music_list/widgets/playbutton_widget.dart';
import "package:flutter/material.dart";
import 'package:on_audio_query/on_audio_query.dart';
import 'package:just_audio/just_audio.dart';

class MusicPlayingInterfaceWidget extends StatefulWidget {
  final List<SongModel> songModelList;
  final AudioPlayer player;

  const MusicPlayingInterfaceWidget({
    super.key,
    required this.player,
    required this.songModelList,
  });

  @override
  State<MusicPlayingInterfaceWidget> createState() =>
      _MusicPlayingInterfaceWidgetState();
}

class _MusicPlayingInterfaceWidgetState
    extends State<MusicPlayingInterfaceWidget> {
  Duration _duration = const Duration();
  Duration _position = const Duration();
  bool isPlaying = false;

  String currentSongTitle = '';
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    playSong();
  }

  void playSong() async {
    try {
      for (var element in widget.songModelList) {
        songModelList.add(AudioSource.uri(
          Uri.parse(element.uri!),
        ));
      }
      widget.player.play();
      isPlaying = true;
    } on Exception {
      log("cannot play song");
    }

    widget.player.durationStream.listen((d) {
      setState(() {
        _duration = d!;
      });
    });
    widget.player.positionStream.listen((p) {
      setState(() {
        _position = p;
      });
    });
    listenToSongChangeIndex();
  }

  void valueChangetoSec(int seconds) {
    Duration duration = Duration(seconds: seconds);
    widget.player.seek(duration);
  }

  void listenToSongChangeIndex() {
    widget.player.currentIndexStream.listen((event) {
      setState(() {
        if (event != null) {
          currentIndex = event;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstantColors.violet,
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.favorite_outline,
                    color: ConstantColors.green,
                    size: 33,
                  ),
                  Icon(
                    Icons.playlist_add,
                    color: ConstantColors.green,
                    size: 33,
                  )
                ],
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                widget.songModelList[currentIndex].displayNameWOExt,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: ConstantColors.white.withOpacity(0.2),
                ),
              ),
            ),
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 100),
                  child: Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: 300,
                      height: 300,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: ConstantColors.dark),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 125),
                  child: Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: 250,
                      height: 250,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: ConstantColors.green),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50, left: 80),
                  child: Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: 250,
                      height: 250,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: ConstantColors.violet3),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 129,
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: 240,
                      height: 240,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: ConstantColors.dark,
                      ),
                      child: QueryArtworkWidget(
                          artworkWidth: 240,
                          artworkHeight: 240,
                          artworkBorder: BorderRadius.circular(130),
                          artworkClipBehavior: Clip.antiAlias,
                          id: widget.songModelList[currentIndex].id,
                          nullArtworkWidget: Icon(
                            Icons.music_note_outlined,
                            size: 75,
                            color: ConstantColors.violet3,
                          ),
                          type: ArtworkType.AUDIO),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  activeTrackColor: ConstantColors.violet3,
                  inactiveTrackColor: ConstantColors.dark,
                  trackHeight: 22.0,
                  thumbShape:
                      const RoundSliderThumbShape(enabledThumbRadius: 12.0),
                  overlayColor: Colors.red.withAlpha(32),
                  overlayShape:
                      const RoundSliderOverlayShape(overlayRadius: 28.0),
                ),
                child: SizedBox(
                  width: 400,
                  child: Slider(
                    thumbColor: ConstantColors.white,
                    value: _position.inSeconds.toDouble(),
                    min: const Duration(microseconds: 0).inSeconds.toDouble(),
                    max: _duration.inSeconds.toDouble(),
                    onChanged: (value) {
                      setState(() {
                        valueChangetoSec(value.toInt());
                        value = value;
                      });
                    },
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30, top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    _position.toString().split(".")[0],
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: ConstantColors.green),
                  ),
                  Text(
                    _duration.toString().split(".")[0],
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: ConstantColors.green),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(
                    Icons.shuffle_rounded,
                    color: ConstantColors.green,
                    size: 30,
                  ),
                  PlayButtonWidget(
                    width: 50,
                    height: 50,
                    icon: IconButton(
                      onPressed: () {
                        if (widget.player.hasPrevious) {
                          widget.player.seekToPrevious();
                        }
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        color: ConstantColors.green,
                        size: 30,
                      ),
                    ),
                  ),
                  PlayButtonWidget(
                    width: 70,
                    height: 70,
                    icon: IconButton(
                      padding: const EdgeInsets.all(1),
                      iconSize: 60,
                      onPressed: () {
                        setState(() {
                          if (isPlaying) {
                            widget.player.pause();
                          } else {
                            widget.player.play();
                          }
                          isPlaying = !isPlaying;
                        });
                      },
                      icon: Icon(
                        isPlaying ? (Icons.pause) : Icons.play_circle,
                        color: ConstantColors.violet3,
                      ),
                    ),
                  ),
                  PlayButtonWidget(
                    width: 50,
                    height: 50,
                    icon: IconButton(
                      onPressed: () {
                        if (widget.player.hasNext) {
                          widget.player.seekToNext();
                        }
                      },
                      icon: Icon(
                        Icons.arrow_forward,
                        color: ConstantColors.green,
                        size: 30,
                      ),
                    ),
                  ),
                  Icon(
                    Icons.loop_sharp,
                    color: ConstantColors.green,
                    size: 30,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                padding: const EdgeInsets.all(30),
                width: 300,
                height: 250,
                decoration: BoxDecoration(
                  color: ConstantColors.dark,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  "Artist:${widget.songModelList[currentIndex].artist}",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: ConstantColors.violet3),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
