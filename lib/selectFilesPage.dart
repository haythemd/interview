import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:interview/homePage.dart';
import 'package:interview/main.dart';

class Selectfilespage extends StatefulWidget {
  const Selectfilespage({super.key});

  @override
  State<Selectfilespage> createState() => _SelectfilespageState();
}

class _SelectfilespageState extends State<Selectfilespage> {
  PlayerController controller = PlayerController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          child: Text('Select Files'),
          onPressed: () async {
            
                await FilePicker.platform.pickFiles(allowMultiple: true).then((value)=>{

                  
                  Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext)=>AudioPage(files: value)))
                  
                });
          },
        ),
      ),
    );
  }
}
