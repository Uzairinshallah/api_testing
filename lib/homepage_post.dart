import 'package:api_testing/post_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomepagePost extends StatefulWidget {
  const HomepagePost({Key? key}) : super(key: key);

  @override
  _HomepagePostState createState() => _HomepagePostState();
}

Future<PostModel?> createUser(String name, String jobTitle) async{
  final String apiUrl = "https://reqres.in/api/users";

  final response = await http.post(Uri.parse(apiUrl), body : {
    "name": name,
    "job": jobTitle,
  });
  if(response.statusCode == 201)
    {
      final String responseString = response.body;
      return postModelFromJson(responseString);
    }else{
    return null;
  }
}


class _HomepagePostState extends State<HomepagePost> {

  PostModel? _user;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController jobController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(32),
        child: Column(
          children:  [
            TextField(
              controller: nameController,
            ),
            TextField(
              controller: jobController,
            ),

            const SizedBox(height: 32,),
            _user == null ? Container():
            Text("The user ${_user!.name}, ${_user!.id} is created successfully at time ${_user!.createdAt.toIso8601String()}"),

          ],
        ),
      ),
        floatingActionButton: FloatingActionButton(
            elevation: 0.0,
            child: const Icon(Icons.check),
            backgroundColor: const Color(0xFFE57373),
            onPressed: () async {
              final String name = nameController.text;
              final String jobTitle = jobController.text;

              final PostModel? user = await createUser(name,jobTitle);

              setState(() {
                _user = user!;
              });
            }
        )
    );


  }
}
