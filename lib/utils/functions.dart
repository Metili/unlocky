import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:unlocky/components/components.dart';
import 'package:unlocky/main.dart';

void hideKeyboard({context}) {
  FocusScope.of(context).unfocus();
}

void checkResponse({isLoggin, status, body, message, context}) async {
  switch (status) {
    case 200: //resultat ok
      if (isLoggin) {
        Map infosUser = json.decode(body);
        SharedPreferences localStorage = await SharedPreferences.getInstance();
        localStorage.setString('token', infosUser['access_token']);
        localStorage.setString('user', json.encode(infosUser['user']));

        succesSnackBar(context, "Vous êtes connectés.");
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const Welcome()),
            (route) => false);
      } else {
        succesSnackBar(context, message ?? "Action réussie");
      }

      break;
    case 422:
      final errors = jsonDecode(body)['errors'];
      errorSnackBar(context, errors[errors.keys.elementAt(0)][0].toString());
      break;
    case 403:
      errorSnackBar(context, jsonDecode(body)['message'].toString());
      break;
    case 400:
      errorSnackBar(context, jsonDecode(body)['message'].toString());
      break;
    case 500:
      errorSnackBar(context, jsonDecode(body)['message'].toString());
      break;
    default:
      errorSnackBar(
          context, 'Un probleme est survenu; Utilisateur introuvable.');
      break;
  }
}
