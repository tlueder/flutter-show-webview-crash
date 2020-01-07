// Copyright 2018 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// ignore_for_file: public_member_api_docs

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() => runApp(MaterialApp(home: WebViewCrashExample()));

const String kNavigationExamplePage = '''
<!DOCTYPE html><html>
<head><title>Flutter WebView Crash Demo</title></head>
<body>
<p>
Click select box to crash
</p>
<select name="crash" id="crash">
  <option value="crash1" >Crash 1</option>
  <option value="crash2" >Crash 2</option>
</select>
</body>
</html>
''';

class WebViewCrashExample extends StatelessWidget {

  final String contentBase64 =
        base64Encode(const Utf8Encoder().convert(kNavigationExamplePage));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter WebView Crash Demo'),
      ),
      body: Builder(builder: (BuildContext context) {
        return WebView(
          initialUrl: 'data:text/html;base64,$contentBase64',
          javascriptMode: JavascriptMode.unrestricted,
        );
      }),
    );
  }
}