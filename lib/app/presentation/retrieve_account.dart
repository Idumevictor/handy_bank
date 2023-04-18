// import 'package:api_test/data/services/retrieve_account_service.dart';
import 'package:flutter/material.dart';
import 'package:handy_bank/service/retrieve_account_service.dart';
import 'package:handy_bank/widgets/constants.dart';
import 'package:handy_bank/widgets/size_config.dart';

class RetrieveNumberScreen extends StatefulWidget {
  const RetrieveNumberScreen({super.key});

  @override
  State<RetrieveNumberScreen> createState() => _RetrieveNumberScreenState();
}

class _RetrieveNumberScreenState extends State<RetrieveNumberScreen> {
  final TextEditingController _numberController = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  bool isLoading = false;
  bool loaded = false;
  String apiMessage = '';
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      backgroundColor: Palette.primaryColor1,
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Form(
          key: _key,
          child: Column(
            children: [
              SizedBox(
                height: getProportionateScreenHeight(50),
              ),
              TextFormField(
                controller: _numberController,
                decoration: InputDecoration(
                    suffixIcon: isLoading
                        ? SizedBox(
                            height: getProportionateScreenHeight(5),
                            width: getProportionateScreenWidth(5),
                            child: CircularProgressIndicator(
                              strokeWidth: 1,
                              color: Colors.red,
                            ),
                          )
                        : loaded
                            ? Icon(Icons.check, color: Colors.green)
                            : null),
                onChanged: (value) {
                  if (value.length == 11) {
                    getNumber(_numberController.text);
                  }
                },
              ),
              SizedBox(
                height: getProportionateScreenHeight(150),
              ),
              apiMessage.isNotEmpty
                  ? Center(
                      child: Text(apiMessage),
                    )
                  : SizedBox()
            ],
          ),
        ),
      ),
    );
  }

  void getNumber(String number) async {
    var isValid = _key.currentState!.validate();
    setState(() {
      isLoading = true;
      loaded = false;
    });
    if (!isValid) return;
    var response = await RetrieveAccountService.getAccount(phoneNUmber: number);
    if (response!.message!.isNotEmpty) {
      setState(() {
        isLoading = false;
        loaded = true;
        apiMessage = response.message.toString();
      });
    }
  }
}
