// ignore_for_file: avoid_print

import 'package:curriculum_web/widgets/Custom/animated_list.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:curriculum_web/utils/helpers.dart' as helper;
import 'package:emailjs/emailjs.dart';

//https://dashboard.emailjs.com/admin/templates/em0l598
// Para mandar los _emailForm se utiliza el servicio de emailjs con 200 emails gratis al mes.
// el template json lo tenemos que poner a la par con la web por ejemplo user_name alli seria {{user_name}} y así
class ContactTab extends StatefulWidget {
  const ContactTab({Key? key}) : super(key: key);

  @override
  State<ContactTab> createState() => _ContactTabState();
}

class _ContactTabState extends State<ContactTab> {
  final GlobalKey _key = GlobalKey();
  final ScrollController _scrollController = ScrollController();
  late String _nameForm, _emailForm, _msgForm;

  @override
  Widget build(BuildContext context) {
    bool isScreenWide = MediaQuery.of(context).size.width >= 1500;
    return LayoutBuilder(
      builder: (p0, p1) {
        return SingleChildScrollView(
          controller: _scrollController,
          child: Container(
              key: _key,
              margin: EdgeInsets.only(top: isScreenWide ? 150 : 50),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.05,
                ),
                child: Flex(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    direction: isScreenWide ? Axis.horizontal : Axis.vertical,
                    children: [
                      aboutContentLeft(isScreenWide),
                      aboutContentRight(isScreenWide),
                    ]),
              )),
        );
      },
    );
  }

  Widget aboutContentLeft(bool isScreenWide) {
    return _content(
        isScreenWide,
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              AppLocalizations.of(context).contactText,
              style: const TextStyle(
                  color: Colors.white, fontFamily: 'Dangrek', fontSize: 32),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 25.0),
              child: Text(
                AppLocalizations.of(context).contactText2,
                style: const TextStyle(
                    color: Colors.grey, fontFamily: 'Questrial', fontSize: 20),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 2,
              child: Padding(
                padding:
                    EdgeInsets.only(left: 8.0, bottom: isScreenWide ? 50 : 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _contactType('Telegram', FontAwesomeIcons.telegram,
                        () => helper.telegram()),
                    _contactType('Twitter', FontAwesomeIcons.twitter,
                        () => helper.twitter()),
                    _contactType('E-mail', Icons.email, () => helper.mailTo()),
                  ],
                ),
              ),
            ),
          ],
        ));
  }

  Widget aboutContentRight(bool _isScreenWide) {
    final _formKey = GlobalKey<FormState>();
    return _content(
      _isScreenWide,
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(AppLocalizations.of(context).contactAlternativeText,
              textAlign: TextAlign.start,
              style: const TextStyle(
                  color: Colors.white, fontFamily: 'Dangrek', fontSize: 32)),
          Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 100.0),
                      child: _textFieldCustom(
                          AppLocalizations.of(context).askName,
                          AppLocalizations.of(context).nameText +
                              AppLocalizations.of(context).symbolText,
                          Icons.person,
                          false,
                          ((p0) => _nameForm = p0!)),
                    ),
                    Positioned(
                      right: 1,
                      top: 1,
                      child: Container(
                        alignment: Alignment.topRight,
                        child: Icon(
                          FontAwesomeIcons.arrowTurnDown,
                          size: 35,
                          color: Theme.of(context).primaryColor.withRed(200),
                        ),
                      ),
                    ),
                  ],
                ),
                _textFieldCustom(
                  AppLocalizations.of(context).askEmail,
                  AppLocalizations.of(context).emailText +
                      AppLocalizations.of(context).symbolText,
                  Icons.mail,
                  false,
                  ((p0) => _emailForm = p0!),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    _textFieldCustom(
                        AppLocalizations.of(context).messageText,
                        AppLocalizations.of(context).messageText +
                            AppLocalizations.of(context).symbolText,
                        Icons.text_fields,
                        true,
                        ((p0) => _msgForm = p0!)),
                    _buttonForm(_formKey)
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _content(bool _isScreenWide, Widget _child) {
    return Container(
      padding:
          EdgeInsets.only(left: 50, right: 50, top: _isScreenWide ? 0 : 50),
      width: MediaQuery.of(context).size.width / (_isScreenWide ? 3 : 1),
      // height: _isScreenWide ? 700 : 600,
      child: _child,
    );
  }

  Widget _contactType(
      String _text, IconData _icon, void Function() _actionClick) {
    return InkWell(
        onTap: () => _actionClick(),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: Icon(
                _icon,
                size: 35,
                color: Colors.white,
              ),
            ),
            Text(
              _text,
              style: TextStyle(
                  decoration: TextDecoration.underline,
                  color: Theme.of(context).primaryColor.withRed(250),
                  fontFamily: 'Questrial',
                  fontSize: 18),
            ),
          ],
        ));
  }

  Widget _buttonForm(GlobalKey<FormState> _formKey) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor:
                MaterialStatePropertyAll(Theme.of(context).primaryColor)),
        onPressed: () async {
          if (_formKey.currentState!.validate()) {
            _formKey.currentState?.save();
            //values same than template in website -> see top
            Map<String, dynamic> templateParams = {
              'user_name': _nameForm,
              'user_email': _emailForm,
              'message': _msgForm
            };
            try {
              await EmailJS.send(
                dotenv.get('EMAILJS_SERVICE_KEY'),
                dotenv.get('EMAILJS_TEMPLATE_KEY'),
                templateParams,
                Options(
                  publicKey: dotenv.get('EMAILJS_PUBLIC_KEY'),
                  privateKey: dotenv.get('EMAILJS_PRIVATE_KEY'),
                ),
              );
              print('Email sended.');
            } catch (error) {
              print(error.toString());
            }
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                  content: Text(
                AppLocalizations.of(context).emailSended,
                style: const TextStyle(color: Colors.white),
              )),
            );
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(AppLocalizations.of(context).contactAction),
        ),
      ),
    );
  }

  Widget _textFieldCustom(String _text1, String _text2, IconData _icon,
      bool _multiline, void Function(String?) _onSave) {
    TextStyle _whiteStyle = const TextStyle(color: Colors.white);
    return Container(
      padding: const EdgeInsets.only(bottom: 35.0),
      width: 600,
      child: TextFormField(
        textAlignVertical: TextAlignVertical.center,
        keyboardType: _multiline ? TextInputType.multiline : TextInputType.text,
        maxLines: _multiline ? 5 : 1,
        minLines: _multiline ? 5 : 1,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(width: 1, color: Colors.white)),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white, width: 2.0),
            borderRadius: BorderRadius.circular(10.0),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red, width: 1.0),
            borderRadius: BorderRadius.circular(10.0),
          ),
          prefixIcon: _multiline
              ? Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Align(
                    alignment: Alignment.topCenter,
                    widthFactor: 1.0,
                    heightFactor: 5.0,
                    child: Icon(
                      _icon,
                      color: Colors.white,
                    ),
                  ))
              : Icon(
                  _icon,
                  color: Colors.white,
                ),
          hoverColor: Theme.of(context).primaryColor.withAlpha(50),
          hintText: _text1,
          hintStyle: _whiteStyle,
          labelText: _text2,
          labelStyle: _whiteStyle,
          alignLabelWithHint: true,
          filled: true,
          fillColor: Theme.of(context).primaryColor.withAlpha(35),
        ),
        style: _whiteStyle,
        onSaved: _onSave,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return AppLocalizations.of(context).formEmptyField;
          }
          return null;
        },
      ),
    );
  }
}
