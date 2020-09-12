import 'package:aprenda_ingles/Home.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:audioplayers/audio_cache.dart';

class Numeros extends StatefulWidget {
  @override
  _NumerosState createState() => _NumerosState();
}

class _NumerosState extends State<Numeros> {
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

  _execultar(String nomeAudio) {
    audioCache.play(nomeAudio + ".mp3");
  }

//CARREGA OS ARQUIVOS ANTES PARA NAO DAR DELEY
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    audioCache.loadAll(
      ["1.mp3", "2.mp3", "3.mp3", "4.mp3", "5.mp3", "6.mp3"],
    );
  }

  @override
  Widget build(BuildContext context) {
    // double largura = MediaQuery.of(context).size.width;
    // double altura = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        child: GridView.count(
          padding: EdgeInsets.only(
            top: 16,
          ),

          crossAxisCount: 2,
          //PRGA O TAMANHO DA TELA
          childAspectRatio: MediaQuery.of(context).size.aspectRatio * 2.5,
          //scrollDirection: Axis.vertical,
          children: <Widget>[
            GestureDetector(
              child: Image.asset('assets/images/1.png'),
              onTap: () {
                _execultar("1");
              },
            ),
            GestureDetector(
              child: Image.asset('assets/images/2.png'),
              onTap: () {
                _execultar("2");
              },
            ),
            GestureDetector(
              child: Image.asset('assets/images/3.png'),
              onTap: () {
                _execultar("3");
              },
            ),
            GestureDetector(
              child: Image.asset('assets/images/4.png'),
              onTap: () {
                _execultar("4");
              },
            ),
            GestureDetector(
              child: Image.asset('assets/images/5.png'),
              onTap: () {
                _execultar("5");
              },
            ),
            GestureDetector(
              child: Image.asset('assets/images/6.png'),
              onTap: () {
                _execultar("6");
              },
            ),
          ],
        ),
      ),
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
    );
  }
}
