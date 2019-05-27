import 'dart:ui';

void ifNoEqual(var valueA, var valueB, VoidCallback fn) {
  if (valueA != valueB) {
    fn();
  }
}

void ifNoNull(var obj,VoidCallback fn) {
  if(obj != null) {
    fn();
  }
}


