import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'fetch_model.dart';


class MyHomePageFetch extends StatefulWidget {
  const MyHomePageFetch({Key? key}) : super(key: key);

  @override
  _MyHomePageFetchState createState() => _MyHomePageFetchState();
}

class _MyHomePageFetchState extends State<MyHomePageFetch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data From Internet'),
      ),
        body: SafeArea(child: FutureBuilder(
          future: getData('a'),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if(snapshot.connectionState!=ConnectionState.done){
              return const CircularProgressIndicator();
            }
            if(snapshot.hasError) {
              return const Text("Something Wrong. ");
              }
            if(snapshot.hasData){
              return ListView.builder(
                  scrollDirection: Axis.vertical,
                  padding: EdgeInsets.all(10),
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context,int index){
                    // Color colorCombo =
                    //     hexToColor(snapshot.data[index].color);
                    return InkWell(
                      onTap: (){
                        print(snapshot.data[index].firstName);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              backgroundImage: NetworkImage(snapshot.data[index].avatar),
                              radius: 20,
                            ),
                            Container(width: 25,),
                            Text(
                                "User  ID : "+snapshot.data[index].id.toString()+"\n"+
                                "First Name : "+snapshot.data[index].firstName.toUpperCase()+"\n"+
                                "Last Name : "+snapshot.data[index].lastName.toUpperCase()+"\n"+
                                "Email : "+snapshot.data[index].email.toUpperCase()+"\n",

                                //     "Year : "+snapshot.data[index].year.toString()+"\n "+
                                // "pantoneValue : "+snapshot.data[index].pantoneValue.toUpperCase(),
                                style: const TextStyle(
                                fontSize: 11,

                                  // color: colorCombo,
                            ),
                            ),
                          ],
                        ),
                      ),
                    );

                  });
            }
            return const Text("Error while calling getData");
          },),
        )
    );
  }
}

  Color hexToColor(String code ){
  return Color(int.parse(code.substring(1,7),radix:16)+0xFF000000);
  }


  Future<List<Datum>> getData(context) async {
    var url = "https://reqres.in/api/users?page=2";
    var response = await http.get(Uri.parse(url));
    print(response);
    if (response.statusCode == 200) {
      //print('Data found');
      ModelClassFetch dataModel = modelClassFromMap(response.body);
      //print(dataModel.support.url);
      List<Datum> arrData = dataModel.data;
      return arrData;
    }else{
      print('Something Wrong');
      throw Exception("Failed to Fetch Data");
    }

  }



