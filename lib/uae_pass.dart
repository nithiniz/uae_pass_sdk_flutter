import 'package:flutter/services.dart';

import 'uae_pass_platform_interface.dart';

class UaePass {
  Future<void> setUpSandbox() async {
    UaePassPlatform.instance.setUp(
        "sandbox_stage",
        "sandbox_stage",
        false,
        "uaepassdemoappDS",
        "123123213",
        "https://oauthtest.com/authorization/return",
        "urn:uae:digitalid:profile");
  }

  Future<void> setUpEnvironment(
      String clientId, String clientSecret, String urlScheme, String state,
      {bool isProduction = false,
      String redirectUri = "https://oauthtest.com/authorization/return",
      String scope = "urn:uae:digitalid:profile"}) async {
    UaePassPlatform.instance.setUp(clientId, clientSecret, isProduction,
        urlScheme, state, redirectUri, scope);
  }

  Future<String> signIn() async {
    try {
      return await UaePassPlatform.instance.signIn();
    } on PlatformException catch (e) {
      throw (e.message ?? "Unknown error");
    } catch (e) {
      throw ("Unknown error");
    }
  }

  Future<String> signDocument(String urlString, {String? signatureInfo}) async {
    try {
      return await UaePassPlatform.instance.signDocument(urlString, signatureInfo: signatureInfo ?? '');
    } on PlatformException catch (e) {
      throw (e.message ?? "Unknown error");
    } catch (e) {
      throw ("Unknown error $e");
    }
  }

  Future<String> getAccessToken(String token) async {
    try {
      return await UaePassPlatform.instance.getAuthToken(token);
    } on PlatformException catch (e) {
      throw (e.message ?? "Unknown error");
    } catch (e) {
      throw ("Unknown error");
    }
  }

  Future<void> signOut() async {
    try {
      return await UaePassPlatform.instance.signOut();
    } on PlatformException catch (e) {
      throw (e.message ?? "Unknown error");
    } catch (e) {
      throw ("Unknown error");
    }
  }
}
