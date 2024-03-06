import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:graduation_project/features/competitions/presentation/pages/competition_score_board.dart';
import 'components/body.dart';

class MultiChoicesPage extends StatefulWidget {
  @override
  State<MultiChoicesPage> createState() => _MultiChoicesPageState();
}

class _MultiChoicesPageState extends State<MultiChoicesPage> {

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        toolbarHeight: 0,
        elevation: 0,
      ),
      body: const Body(),
    );
  }
}
