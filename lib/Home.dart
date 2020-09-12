import 'package:aprenda_ingles/Bichos.dart';
import 'package:aprenda_ingles/Numeros.dart';
import 'package:aprenda_ingles/Vogais.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  AudioPlayer audioPlayer = AudioPlayer();
  TabController _tabController;


  @override
  void initState() {
    super.initState();

    _tabController = TabController(
      length: 3,
      vsync: this,
      initialIndex: 0,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Aprenda Inglês'),
        bottom: TabBar(
          indicatorColor: Colors.white,
          labelStyle: TextStyle(
            fontWeight: FontWeight.bold,
          ),
          controller: _tabController,
          tabs: <Widget>[
            Tab(
              child: Text('Bichos'),
            ),
            Tab(
              child: Text('Números'),
            ),
            Tab(
              child: Text('Vogais'),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          Bichos(),
          Numeros(),
          Vogais(),
        ],
      ),
    );
  }
}
