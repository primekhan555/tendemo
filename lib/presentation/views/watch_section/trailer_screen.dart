import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tendemo/core/app_print.dart';
import 'package:tendemo/extensions/sized_box.dart';
import 'package:tendemo/navigation/navigation.dart';
import 'package:tendemo/presentation/base_widgets/base_widget.dart';
import 'package:tendemo/presentation/common_widgets/primary_button.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../providers/watch_provider.dart';

class TrailerScreen extends StatefulWidget {
  static const String routeName = "trailer_screen";
  final int params;
  const TrailerScreen({super.key, required this.params});

  @override
  State<TrailerScreen> createState() => _TrailerScreenState();
}

class _TrailerScreenState extends State<TrailerScreen> {
  // late VideoPlayerController _controller;

  YoutubePlayerController? _controller;
  // YoutubePlayerController get controller => _controller;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      initPlayer();
    });
    // goBackAfterFinish();
  }

  goBack() {
    Navigation.pop();
    // Future.delayed(Duration(seconds: 1),(){
    //   _controller?.dispose();
    // });
  }

  initPlayer() async {
    String id = await context
        .read<WatchProvider>()
        .getMovieVideos(widget.params.toString());
    _controller = YoutubePlayerController(
      initialVideoId: id,
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: true,
        disableDragSeek: false,
        loop: false,
        isLive: false,
        forceHD: false,
        enableCaption: true,
      ),
    );
    setState(() {});
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Consumer<WatchProvider>(builder: (context, pro, child) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BaseWidget(
                  state: pro.movieVideosRes,
                  builder: (context) {
                    return _controller != null
                        ? YoutubePlayer(
                            controller: _controller!,
                            showVideoProgressIndicator: true,
                            progressColors: const ProgressBarColors(
                              playedColor: Colors.amber,
                              handleColor: Colors.amberAccent,
                            ),
                            onEnded: (d) {
                              goBack();
                            },
                          )
                        : const CircularProgressIndicator();
                  }),
              20.spaceY,
              PrimaryButton(
                title: 'Done',
                onTap: () {
                  goBack();
                },
              )
            ],
          );
        }),
      ),
    );
  }
}
