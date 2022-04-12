part of 'shared.dart';

class ColorPallete {
  static const primaryColor = Color(0xFF503E9D);
  static const secondaryColor = Color(0xFFFBD460);
  static const succesColor = Color(0xFF3E9D9D);
  static const errorColor = Color(0xFFFF5C83);
  static const greyColor = Colors.grey;
}

class AppTextStyle {
  static var titleStyle = GoogleFonts.raleway(
    fontSize: 20,
    fontWeight: FontWeight.w500,
    height: 1.4,
  );

  static var mediumStyle = GoogleFonts.raleway(
    fontSize: 18,
    fontWeight: FontWeight.w500,
  );

  static var normalStyle = GoogleFonts.raleway(
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );

  static var desciptionStyle = GoogleFonts.raleway(
    fontSize: 16,
    color: ColorPallete.greyColor,
    fontWeight: FontWeight.w300,
  );
}
