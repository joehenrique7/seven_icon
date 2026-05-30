import 'package:flutter_test/flutter_test.dart';

import 'package:seven_icon/seven_icon.dart';

void main() {
  test('SevenIcons usa a font family e o package corretos', () {
    expect(SevenIcons.fontFamily, 'SevenIcon');
    expect(SevenIcons.fontPackage, 'seven_icon');
  });
}
