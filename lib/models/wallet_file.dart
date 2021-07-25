class WalletFile {
  String? address;
  String? id;
  int? version;
  Crypto? crypto;

  WalletFile({this.address, this.id, this.version, this.crypto});

  WalletFile.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    id = json['id'];
    version = json['version'];
    crypto =
    json['crypto'] != null ? new Crypto.fromJson(json['crypto']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address'] = this.address;
    data['id'] = this.id;
    data['version'] = this.version;
    if (this.crypto != null) {
      data['crypto'] = this.crypto!.toJson();
    }
    return data;
  }
}

class Crypto {
  String? cipher;
  String? ciphertext;
  Cipherparams? cipherparams;
  String? kdf;
  Kdfparams? kdfparams;
  String? mac;

  Crypto(
      {this.cipher,
        this.ciphertext,
        this.cipherparams,
        this.kdf,
        this.kdfparams,
        this.mac});

  Crypto.fromJson(Map<String, dynamic> json) {
    cipher = json['cipher'];
    ciphertext = json['ciphertext'];
    cipherparams = json['cipherparams'] != null
        ? new Cipherparams.fromJson(json['cipherparams'])
        : null;
    kdf = json['kdf'];
    kdfparams = json['kdfparams'] != null
        ? new Kdfparams.fromJson(json['kdfparams'])
        : null;
    mac = json['mac'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cipher'] = this.cipher;
    data['ciphertext'] = this.ciphertext;
    if (this.cipherparams != null) {
      data['cipherparams'] = this.cipherparams!.toJson();
    }
    data['kdf'] = this.kdf;
    if (this.kdfparams != null) {
      data['kdfparams'] = this.kdfparams!.toJson();
    }
    data['mac'] = this.mac;
    return data;
  }
}

class Cipherparams {
  String? iv;

  Cipherparams({this.iv});

  Cipherparams.fromJson(Map<String, dynamic> json) {
    iv = json['iv'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['iv'] = this.iv;
    return data;
  }
}

class Kdfparams {
  int? dklen;
  int? n;
  int? p;
  int? r;
  String? salt;

  Kdfparams({this.dklen, this.n, this.p, this.r, this.salt});

  Kdfparams.fromJson(Map<String, dynamic> json) {
    dklen = json['dklen'];
    n = json['n'];
    p = json['p'];
    r = json['r'];
    salt = json['salt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dklen'] = this.dklen;
    data['n'] = this.n;
    data['p'] = this.p;
    data['r'] = this.r;
    data['salt'] = this.salt;
    return data;
  }
}
