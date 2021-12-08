import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'dart:io';





class MultiPartHome extends StatefulWidget {
  const MultiPartHome({Key? key}) : super(key: key);

  @override
  State<MultiPartHome> createState() => _MultiPartHomeState();
}

class _MultiPartHomeState extends State<MultiPartHome> {
  File? _image;

   getImage()async{
    final image = await ImagePicker().pickImage(
        source: ImageSource.gallery,

    );
    if(image==null)
    {
      return;
    }
    else{
      setState(() {
        _image =File(image.path);
        uploadImage('image', _image!);
        print('Image Details = $_image');
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Image Upload'),),
        body: SingleChildScrollView(
          child: Column(
            children: [
              TextButton(
                onPressed: (){
                  getImage();

                  print('Image Details = $_image');
                },
                child: const Text('Upload'),),
              if( _image==null )
                Center(child: InkWell( onTap: (){
                  getImage();
                }, child: const Text('Select image')),)
              else
                SizedBox(height:500,width:500,child:Image.file(_image!),),
            ],
          ),
        ),









        // Center(
        //   child: Container(
        //     child: TextButton(onPressed: (){
        //       uploadImage('image', File('assets/pp.jpg'));
        //     },child: Text('Upload'),),
        //   ),
        // ),
      ),
    );
  }
}

uploadImage(String title, File file) async{

  print('Image Details function = $file');

  var request = http.MultipartRequest("POST",Uri.parse("https://api.imgur.com/3/image"));

  request.fields['title'] = "dummyImage";
  request.headers['Authorization'] = "Client-ID " +"f12243b7b2edfa4";

  var picture = http.MultipartFile.fromBytes('image', file.readAsBytesSync(),
      filename: 'testimage.png');

  request.files.add(picture);

  var response = await request.send();

  var responseData = await response.stream.toBytes();

  var result = String.fromCharCodes(responseData);

  print(result);



}




























// class MultiPartHome extends StatefulWidget {
//   const MultiPartHome({Key? key}) : super(key: key);
//
//   @override
//   State<MultiPartHome> createState() => _MultiPartHomeState();
// }
//
// class _MultiPartHomeState extends State<MultiPartHome> {
//
//    File? _image;
//
//    getImage()async{
//     final image = await ImagePicker().pickImage(
//         source: ImageSource.gallery,
//
//     );
//     if(image==null)
//     {
//       return;
//     }
//     else{
//       setState(() {
//         _image =File(image.path);
//
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Image Upload')),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             TextButton(
//               onPressed: (){
//                 getImage();
//                 Upload( _image!);
//             },
//               child: const Text('Upload'),),
//             if( _image==null )
//               Center(child: InkWell( onTap: (){
//                 getImage();
//               }, child: const Text('Select image')),)
//             else
//               SizedBox(height:500,width:500,child:Image.file(_image!),),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
//
// Upload(File file) async {
//   var stream = http.ByteStream(DelegatingStream.typed(file.openRead()));
//   var length = await file.length();
//
//   var uri = Uri.parse("https://api.imgur.com/3/image");
//
//   var request = http.MultipartRequest("POST", uri);
//   var multipartFile = http.MultipartFile('file', stream, length,
//       filename: basename(file.path));
//   //contentType: new MediaType('image', 'png'));
//
//   request.files.add(multipartFile);
//   var response = await request.send();
//   print('response' + response.statusCode.toString());
//   response.stream.transform(utf8.decoder).listen((value) {
//     print(value);
//
//   });
// }







// uploadImage(String title, File file) async {
//   var request = http.MultipartRequest("POST",Uri.parse("https://api.imgur.com/3/image"));
//
//   request.fields['title'] = "DummyImage";
//   request.headers['Authorization'] = "";
//
//   var picture = http.MultipartFile.fromBytes('image', (await rootBundle.load(file.path)).buffer.asUint8List(),
//       filename: 'uzair.jpg');
//
//   request.files.add(picture);
//
//   var response = await request.send();
//
//   var responseData = await response.stream.toBytes();
//
//   var result = String.fromCharCodes(responseData);
//
//   print(result);
//
//
// }
