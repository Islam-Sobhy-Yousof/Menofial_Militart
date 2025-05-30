enum LanguageType {
  ARABIC,
  ENGLISH,
}

const String ARABIC = "ar";
const String ENGLISH = "en";

extension LanguageManagerExtention on LanguageType {
  String getLanguage() {
    switch (this) {
      case LanguageType.ARABIC:
        return ARABIC;

      case LanguageType.ENGLISH:
        return ENGLISH;
    }
  }
}
