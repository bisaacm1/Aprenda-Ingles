import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:audioplayers/audio_cache.dart';

class Bichos extends StatefulWidget {
  @override
  _BichosState createState() => _BichosState();
}

class _BichosState extends State<Bichos> {
  AudioPlayer audioPlayer = AudioPlayer();
  AudioCache audioCache = AudioCache(prefix: "audios/");
  double volume = 0.5;

  _pausar() async {
    int resultado = await audioPlayer.pause();
    if (resultado == 1) {
      //sucesso
    }
  }

  _parar() async {
    int resultado = await audioPlayer.stop();
    if (resultado == 1) {
      //sucesso
    }
  }

  _audioCao() async {
    audioPlayer = await audioCache.play("cao.mp3");
    await audioPlayer.setVolume(volume);
  }

  _audioGato() async {
    audioPlayer = await audioCache.play("gato.mp3");
    await audioPlayer.setVolume(volume);
  }

  _audioLeao() async {
    audioPlayer = await audioCache.play("leao.mp3");
    await audioPlayer.setVolume(volume);
  }

  _audioMacaco() async {
    audioPlayer = await audioCache.play("macaco.mp3");
    await audioPlayer.setVolume(volume);
  }

  _audioOvelha() async {
    audioPlayer = await audioCache.play("ovelha.mp3");
    await audioPlayer.setVolume(volume);
  }

  _audioVaca() async {
    audioPlayer = await audioCache.play("vaca.mp3");
    await audioPlayer.setVolume(volume);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(),
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.music_note,
                  color: Color(0xff795548),
                ),
                Slider(
                  value: volume,
                  min: 0,
                  max: 1,
                  activeColor: Color(0xff795548),
                  //divisions: 10,
                  onChanged: (novoVolume) {
                    setState(() {
                      volume = novoVolume;
                    });
                    audioPlayer.setVolume(novoVolume);
                  },
                ),
                Padding(
                  padding: EdgeInsets.only(right: 8, left: 8),
                  child: GestureDetector(
                    onTap: () {
                      _pausar();
                    },
                    child: Icon(
                      Icons.pause,
                      color: Color(0xff795548),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 16, left: 8),
                  child: GestureDetector(
                    onTap: () {
                      _parar();
                    },
                    child: Icon(
                      Icons.stop,
                      color: Color(0xff795548),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
        backgroundColor: Color(0xfff5e9b9),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(8),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 8, bottom: 8),
                  child: GestureDetector(
                    child: Image.asset('assets/images/cao.png'),
                    onTap: () {
                      _audioCao();
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8, bottom: 8),
                  child: GestureDetector(
                    child: Image.asset('assets/images/gato.png'),
                    onTap: () {
                      _audioGato();
                    },
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 8, bottom: 8),
                  child: GestureDetector(
                    child: Image.asset('assets/images/leao.png'),
                    onTap: () {
                      _audioLeao();
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8, bottom: 8),
                  child: GestureDetector(
                    child: Image.asset('assets/images/macaco.png'),
                    onTap: () {
                      _audioMacaco();
                    },
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 8, bottom: 8),
                  child: GestureDetector(
                    child: Image.asset('assets/images/ovelha.png'),
                    onTap: () {
                      _audioOvelha();
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8, bottom: 8),
                  child: GestureDetector(
                    child: Image.asset('assets/images/vaca.png'),
                    onTap: () {
                      _audioVaca();
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
