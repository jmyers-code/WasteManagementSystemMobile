import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';
import 'package:snippet_coder_utils/hex_color.dart';
import 'package:wms_project/models/collection_request_model.dart';

import '../config.dart';
import '../services/api_service.dart';

class RequestForm extends StatefulWidget {
  const RequestForm({super.key});

  @override
  State<RequestForm> createState() => _RequestFormState();
}

class _RequestFormState extends State<RequestForm> {
  bool isApiCallProcess = false;
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  late int numberOfBins;
  late String dateToBeCollected;
  String userId = "1ee30da5-49b1-4aac-879a-c9f30f830ba3";
  int localityId = 2;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: HexColor("#283B71"),
        body: ProgressHUD(
          inAsyncCall: isApiCallProcess,
          opacity: 0.3,
          key: UniqueKey(),
          child: Form(
            key: globalFormKey,
            child: _collectionRequestUI(context),
          ),
        ),
      ),
    );
  }

  Widget _collectionRequestUI(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 4,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.white, Colors.white]),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(100),
                bottomRight: Radius.circular(100),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 20, bottom: 40),
            child: Center(
              child: Text(
                "Collection Request",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 35,
                    color: Colors.white),
              ),
            ),
          ),
          FormHelper.inputFieldWidget(
            context,
            "numberOfBins",
            "Number Of Bins",
            (onValidate) {
              if (onValidate.isEmpty) {
                return "Bin(s) cannot be zero";
              }
              return null;
            },
            (onSavedVal) {
              numberOfBins = int.parse(onSavedVal);
            },
            borderFocusColor: Colors.white,
            prefixIconColor: Colors.white,
            prefixIcon: const Icon(Icons.person),
            borderColor: Colors.white,
            textColor: Colors.white,
            hintColor: Colors.white.withOpacity(0.7),
            borderRadius: 10,
            showPrefixIcon: true,
          ),
          FormHelper.inputFieldWidget(
            context,
            "dateToBeCollected",
            "Date in yyyy-MM-dd format",
            (onValidate) {
              if (onValidate.isEmpty) {
                return "Date cannot be zero";
              }
              return null;
            },
            (onSavedVal) {
              dateToBeCollected = onSavedVal;
            },
            borderFocusColor: Colors.white,
            prefixIconColor: Colors.white,
            prefixIcon: const Icon(Icons.person),
            borderColor: Colors.white,
            textColor: Colors.white,
            hintColor: Colors.white.withOpacity(0.7),
            borderRadius: 10,
            showPrefixIcon: true,
          ),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: FormHelper.submitButton(
              "Send",
              () {
                if (validateAndSave()) {
                  setState(() {
                    isApiCallProcess = true;
                  });

                  CollectionRequest model = CollectionRequest(
                      numberOfBins: numberOfBins,
                      dateToBeCollected: dateToBeCollected,
                      userId: userId,
                      localityId: localityId);

                  ApiService.saveCollectionData(model).then((response) => {
                        setState(() {
                          isApiCallProcess = false;
                        }),
                        if (response)
                          {
                            Navigator.pushNamedAndRemoveUntil(
                              context,
                              '/',
                              (route) => false,
                            )
                          }
                        else
                          {
                            FormHelper.showSimpleAlertDialog(
                              context,
                              Config.appName,
                              "Something went wrong",
                              "Ok",
                              () {
                                Navigator.pop(context);
                              },
                            )
                          }
                      });
                }
              },
              btnColor: HexColor("#283B71"),
              borderColor: Colors.white,
              txtColor: Colors.white,
              borderRadius: 10,
            ),
          ),
        ],
      ),
    );
  }

  bool validateAndSave() {
    final form = globalFormKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
  }
}
