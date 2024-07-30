import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:interview/scrollingText.dart';

class AudioPage extends StatefulWidget {
  const AudioPage({super.key, required this.files});

  final FilePickerResult? files;

  @override
  State<AudioPage> createState() => _AudioPageState();
}

class _AudioPageState extends State<AudioPage> {
  final Color mainColor = Color.fromARGB(255, 140, 75, 139);
  final Color bgColor = const Color(0xFF262026);
  int selectedFile = 0;
  PlayerController playerController = PlayerController();

  @override
  void initState() {

 extractWaveForms();


    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(8),
        color: Colors.grey,
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Music",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 20),
                  ),
                  RichText(
                      text: TextSpan(children: [
                        const TextSpan(
                            text: "237",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 20)),
                        TextSpan(
                            text: " Online",
                            style: TextStyle(color: mainColor, fontSize: 18))
                      ]))
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24), color: mainColor),
              width: double.infinity,
              height: 80,
              child: const Center(
                child: Text(
                  'Back to Plinko',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 20),
                ),
              ),
            ),
            SizedBox(
              height: 60,
              child: ScrollingText(
                  text: this.widget.files!.names[selectedFile]!,
                  textStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 20)),
            ),
            Container(
              height: 40,
              child: Row(
                children: [
                  Text(this
                      .widget
                      .files!
                      .xFiles![selectedFile]
                      .name
                      .split('-')[0]!)
                ],
              ),
            ),
            Container(
                height: 320,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    gradient:
                    const LinearGradient(colors: [Colors.grey, Colors.black12])),
                child: AudioFileWaveforms(
                  size: Size(MediaQuery.of(context).size.width - 80, 80.0),
                  playerController: playerController,
                  playerWaveStyle:  PlayerWaveStyle(showSeekLine: false,
                    scaleFactor: 1,
                    fixedWaveColor: Colors.white30,
                    liveWaveColor: Colors.white,
                    waveCap: StrokeCap.butt,
                  ),
                  waveformData: [],
                )),
            Container(
              height: 120,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    child: Container(
                      height: 80,
                      width: 120,
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(
                              colors: [Colors.grey, Colors.black38]),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(48),
                              bottomLeft: Radius.circular(48),
                              topRight: Radius.circular(12),
                              bottomRight: Radius.circular(12))),
                      child: Icon(Icons.fast_rewind_rounded),
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      setState(() async {
                        await playerController.startPlayer();
                      });
                    },
                    child: Container(
                      height: 80,
                      width: 120,
                      decoration: BoxDecoration(
                          color: mainColor,
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(12),
                              bottomLeft: Radius.circular(12),
                              topRight: Radius.circular(12),
                              bottomRight: Radius.circular(12))),
                      child: playerController.playerState == PlayerState.playing
                          ? Icon(Icons.pause)
                          : Icon(Icons.play_arrow_rounded),
                    ),
                  ),
                  InkWell(
                    child: Container(
                      height: 80,
                      width: 120,
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(
                              colors: [Colors.black38, Colors.grey]),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(12),
                              bottomLeft: Radius.circular(12),
                              topRight: Radius.circular(48),
                              bottomRight: Radius.circular(48))),
                      child: const Icon(Icons.fast_forward_rounded),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void _playandPause() async {
    playerController.playerState == PlayerState.playing
        ? await playerController.pausePlayer()
        : await playerController.startPlayer(finishMode: FinishMode.loop);
  }

 extractWaveForms() {


    List<dynamic> waveForms =[];

    widget.files!.xFiles.forEach((e){

      e.readAsBytes().then((value){

      var newList = [];

      for (int i = 0; i < 100; i++) {



      }


      });

    });

}


}

