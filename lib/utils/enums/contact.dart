enum ContactType { whatsApp, telegram, instagram }

String socialText(ContactType social) {
  switch (social) {
    case ContactType.whatsApp:
      return "WHATSAPP";
    case ContactType.telegram:
      return "TELEGRAM";
    case ContactType.instagram:
      return "INSTGRAM";
  }
}
