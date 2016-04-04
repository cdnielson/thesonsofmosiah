import 'package:angular2/angular2.dart';

@Pipe(name: 'formatseconds')
class FormatSeconds implements PipeTransform {
  transform(String v, [args]) {
    if (v != null) {
      if (v.length < 2) {
        return "0" + v;
      }
    }
    return v;
  }
}