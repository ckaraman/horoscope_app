class Horoscope {
  final String _horoscopeName;
  final String _horoscopeDate;
  final String _horoscopeGenerals;
  final String _horoscopeDetail;
  final String _horoscopeAvatar;
  final String _horoscopeBigPicture;

  get horoscopeName => this._horoscopeName;
  get horoscopeDate => this._horoscopeDate;
  get horoscopeGenerals => this._horoscopeGenerals;
  get horoscopeDetail => this._horoscopeDetail;
  get horoscopeAvatar => this._horoscopeAvatar;
  get horoscopeBigPicture => this._horoscopeBigPicture;

  Horoscope(
    this._horoscopeName,
    this._horoscopeDate,
    this._horoscopeGenerals,
    this._horoscopeDetail,
    this._horoscopeAvatar,
    this._horoscopeBigPicture,
  );

  @override
  String toString() {
    return "$_horoscopeName- $_horoscopeAvatar";
  }
}
