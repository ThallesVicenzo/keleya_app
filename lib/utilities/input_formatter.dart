import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class InputFormatter extends MaskTextInputFormatter{
  InputFormatter.date()
      : super(
    mask: '##/##/####',
    filter: {
      '#': RegExp(r'[0-9]'),
    },
  );
}