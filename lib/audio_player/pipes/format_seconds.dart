import 'package:angular2/angular2.dart';

@Pipe(name: 'formatseconds')
class FormatSeconds implements PipeTransform {
  transform(String v, [args]) => v?.padLeft(2, "0");
}