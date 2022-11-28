import 'package:dynamic_forms_v1/models/submit_view_forms_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class SubmitFormsDetailsView extends StatefulWidget {
  const SubmitFormsDetailsView({super.key});

  @override
  State<SubmitFormsDetailsView> createState() => _SubmitFormsDetailsViewState();
}

class _SubmitFormsDetailsViewState extends State<SubmitFormsDetailsView> {
  var formTitle;
  getFormId() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var user = preferences.getInt("formId");
    return user;
  }

  getFormITitle() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var title = preferences.getString("formSubTitle");
    setState(() {
      formTitle = title;
    });
    return formTitle;
  }

  Future<SubmitViewFormsModel> getSubmitFormsDetails() async {
    var id = await getFormId();
    var response = await http.get(
        Uri.parse(
          'http://demo.techxcape.com/dynamicform/public/admin/submittedforms/view/$id',
        ),
        headers: {"Accept": "application/json"});
    if (response.statusCode == 200) {
      print(submitViewFormsModelFromJson(response.body));
      return submitViewFormsModelFromJson(response.body);
    } else {
      throw Exception('Failed to load album');
    }
  }

  Future<SubmitViewFormsModel>? submitFormsDetails;

  @override
  void initState() {
    getFormId();
    getFormITitle();
    submitFormsDetails = getSubmitFormsDetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          "$formTitle",
          style: TextStyle(color: Colors.white, fontSize: size.height * .025),
        ),
      ),
      body: Container(
        width: size.width,
        padding: EdgeInsets.all(size.height * .015),
        child: FutureBuilder<SubmitViewFormsModel>(
            future: submitFormsDetails,
            builder: (context, snapshot) {
              List keys = [];
              List date = [];

              if (snapshot.hasData) {
                snapshot.data!.formInstances!.entries.forEach((data) {
                  keys.add(data.key);
                  date.add(data.value[0].createdAt);
                });

                return ListView.builder(
                    itemCount: keys.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      String formattedDate = DateFormat('dd-MM-yyyy').format(
                        date[index],
                      );
                      String formattedTime = DateFormat('KK:mm a').format(
                        date[index],
                      );
                      return Column(
                        children: [
                          ListTile(
                            onTap: () async {
                              SharedPreferences preferences =
                                  await SharedPreferences.getInstance();
                              await preferences.setString(
                                'insKey',
                                keys[index],
                              );
                              Get.toNamed("/SubmitFormsDetailsAnswers");
                              // Navigator.pushNamed(
                              //     context, "/SubmitViewFormsInstanceDetails");
                            },
                            title: Text(
                              "${formattedDate}",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: size.height * .023,
                              ),
                            ),
                            leading: Text(
                              "${index + 1}",
                              style: TextStyle(
                                color: Colors.orange,
                                fontWeight: FontWeight.bold,
                                fontSize: size.height * .024,
                              ),
                            ),
                            subtitle: Text(
                              "${formattedTime}",
                              style: TextStyle(
                                // color: Colors.black,
                                fontSize: size.height * .021,
                              ),
                            ),
                            trailing: Icon(
                              Icons.arrow_forward_ios,
                              size: size.height * .03,
                              color: Colors.orange,
                            ),
                          ),
                          Divider()
                        ],
                      );
                    });
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              return Center(child: CircularProgressIndicator());
            }),
      ),
    );
  }
}
