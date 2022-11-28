import 'package:dynamic_forms_v1/models/submit_view_forms_details_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class SubmitFormsDetailsAnswers extends StatefulWidget {
  const SubmitFormsDetailsAnswers({super.key});

  @override
  State<SubmitFormsDetailsAnswers> createState() =>
      _SubmitFormsDetailsAnswersState();
}

class _SubmitFormsDetailsAnswersState
    extends State<SubmitFormsDetailsAnswers> {
  getFormId() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var fId = preferences.getInt("formId");
    return fId;
  }

  getInsKey() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var iKey = preferences.getString("insKey");
    return iKey;
  }

  Future<SubmitViewFormsDetailsModel> getSubmitViewFormsDetails() async {
    var fid = await getFormId();
    var iKey = await getInsKey();

    var response = await http.get(
        Uri.parse(
          'http://demo.techxcape.com/dynamicform/public/admin/submittedforms/view/$fid/$iKey',
        ),
        headers: {"Accept": "application/json"});
    if (response.statusCode == 200) {
      return submitViewFormsDetailsModelFromJson(response.body);
    } else {
      throw Exception('Failed to load album');
    }
  }

  Future<SubmitViewFormsDetailsModel>? submitViewFormsDetails;

  @override
  void initState() {
    getFormId();
    getInsKey();
    submitViewFormsDetails = getSubmitViewFormsDetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      body: Container(
          width: size.width,
          child: FutureBuilder(
              future: submitViewFormsDetails,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: size.height * .03,
                        ),
                        Container(
                          width: size.width * .9,
                          child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: snapshot.data!.answers!.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                      10,
                                    ),
                                  ),
                                  elevation: 10,
                                  child: Container(
                                    width: size.width * .9,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                        10,
                                      ),
                                    ),
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: size.height * .03,
                                        ),
                                        Container(
                                          width: size.width * .75,
                                          child: Text(
                                            snapshot.data!.answers![index]
                                                .questionId
                                                .toString(),
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: size.height * .023,
                                            ),
                                          ),
                                        ),
                                        Column(children: [
                                          Container(
                                            width: size.width * .75,
                                            child: TextFormField(
                                              style: TextStyle(
                                                  color: Colors.grey[700]),
                                              readOnly: true,
                                              initialValue: snapshot
                                                  .data!.answers![index].answer
                                                  .toString(),
                                              decoration: const InputDecoration(
                                                enabledBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Colors.orange,
                                                  ),
                                                ),
                                                focusedBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Colors.orange,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: size.height * .03),
                                        ])
                                      ],
                                    ),
                                  ),
                                );
                              }),
                        ),
                        SizedBox(
                          height: size.height * .03,
                        ),
                      ],
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }
                return Center(child: CircularProgressIndicator());
              })),
    );
  }
}
