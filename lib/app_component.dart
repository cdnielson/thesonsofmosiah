// Copyright (c) 2016, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:angular2/angular2.dart';
import 'package:audioplayer/audio_player.dart';

@Component(
    selector: 'my-app',
    templateUrl: 'app_component.html',
    directives: const [AudioPlayer])
class AppComponent {}
