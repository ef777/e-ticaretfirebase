class Urundetay {
  String? id;
  String? urunKodu;
  String? urunAdi;
  String? urunLink;
  String? urunKisaAciklama;
  String? urunUzunAciklama;
  String? urunEtiketleri;
  String? tezgahId;
  String? tezgahKodu;
  String? kategoriId;
  String? kategoriKodu;
  String? statu;
  String? statuSertifika;
  String? kimden;
  String? uretim;
  String? uretimIl;
  String? birim;
  String? stokKontrol;
  String? stokKodu;
  String? stokAdeti;
  String? varyasyon;
  String? durum;
  String? yDurum;
  String? zaman;
  String? vitrinResim;
  String? gosterimPuan;
  String? icerik;
  String? tumkategori;
  String? indirim;
  String? perakende;
  String? toptan;
  String? express;
  String? indirimTarihKontrol;
  String? indirimBaslamaTarihi;
  String? indirimBitisTarihi;
  String? kimdenbaslik;
  String? kimdenicon;
  String? uretimbaslik;
  String? uretimicon;
  String? uretimdeger;
  String? statubaslik;
  String? statuicon;
  String? staturenk;
  String? kategoriBaslik;
  String? il;
  String? birimAdi;
  String? birimSembol;
  String? yorumadet;
  String? puanlama;
  List<Urunicerikleri>? urunicerikleri;
  List<Urunresim>? urunresim;
  Uruntezgah? uruntezgah;
  Urunkargo? urunkargo;
  List<String>? begenilenUrunler;
  String? satisadeti;
  Urundetay(
      {this.id,
      this.urunKodu,
      this.urunAdi,
      this.urunLink,
      this.urunKisaAciklama,
      this.urunUzunAciklama,
      this.urunEtiketleri,
      this.tezgahId,
      this.tezgahKodu,
      this.kategoriId,
      this.kategoriKodu,
      this.statu,
      this.statuSertifika,
      this.kimden,
      this.uretim,
      this.uretimIl,
      this.birim,
      this.stokKontrol,
      this.stokKodu,
      this.stokAdeti,
      this.varyasyon,
      this.durum,
      this.yDurum,
      this.zaman,
      this.vitrinResim,
      this.gosterimPuan,
      this.icerik,
      this.tumkategori,
      this.indirim,
      this.perakende,
      this.toptan,
      this.express,
      this.indirimTarihKontrol,
      this.indirimBaslamaTarihi,
      this.indirimBitisTarihi,
      this.kimdenbaslik,
      this.kimdenicon,
      this.uretimbaslik,
      this.uretimicon,
      this.uretimdeger,
      this.statubaslik,
      this.statuicon,
      this.staturenk,
      this.kategoriBaslik,
      this.il,
      this.birimAdi,
      this.birimSembol,
      this.yorumadet,
      this.puanlama,
      this.urunicerikleri,
      this.urunresim,
      this.uruntezgah,
      this.urunkargo,
      this.begenilenUrunler,
      this.satisadeti});

  Urundetay.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    urunKodu = json['urun_kodu'];
    urunAdi = json['urun_adi'];
    urunLink = json['urun_link'];
    urunKisaAciklama = json['urun_kisa_aciklama'];
    urunUzunAciklama = json['urun_uzun_aciklama'];
    urunEtiketleri = json['urun_etiketleri'];
    tezgahId = json['tezgah_id'];
    tezgahKodu = json['tezgah_kodu'];
    kategoriId = json['kategori_id'];
    kategoriKodu = json['kategori_kodu'];
    statu = json['statu'];
    statuSertifika = json['statu_sertifika'];
    kimden = json['kimden'];
    uretim = json['uretim'];
    uretimIl = json['uretim_il'];
    birim = json['birim'];
    stokKontrol = json['stok_kontrol'];
    stokKodu = json['stok_kodu'];
    stokAdeti = json['stok_adeti'];
    varyasyon = json['varyasyon'];
    durum = json['durum'];
    yDurum = json['y_durum'];
    zaman = json['zaman'];
    vitrinResim = json['vitrin_resim'];
    gosterimPuan = json['gosterim_puan'];
    icerik = json['icerik'];
    tumkategori = json['tumkategori'];
    indirim = json['indirim'];
    perakende = json['perakende'];
    toptan = json['toptan'];
    express = json['express'];
    indirimTarihKontrol = json['indirim_tarih_kontrol'];
    indirimBaslamaTarihi = json['indirim_baslama_tarihi'];
    indirimBitisTarihi = json['indirim_bitis_tarihi'];
    kimdenbaslik = json['kimdenbaslik'];
    kimdenicon = json['kimdenicon'];
    uretimbaslik = json['uretimbaslik'];
    uretimicon = json['uretimicon'];
    uretimdeger = json['uretimdeger'];
    statubaslik = json['statubaslik'];
    statuicon = json['statuicon'];
    staturenk = json['staturenk'];
    kategoriBaslik = json['kategoriBaslik'];
    kategoriId = json['kategoriId'];
    il = json['il'];
    birimAdi = json['birimAdi'];
    birimSembol = json['birimSembol'];
    yorumadet = json['yorumadet'];
    puanlama = json['puanlama'].toString();
    urunicerikleri = <Urunicerikleri>[];
    if (json['urunicerikleri'] != "") {
      json['urunicerikleri'].forEach((v) {
        urunicerikleri!.add(Urunicerikleri.fromJson(v));
      });
    }
    if (json['urunresim'] != null) {
      urunresim = <Urunresim>[];
      json['urunresim'].forEach((v) {
        urunresim!.add(Urunresim.fromJson(v));
      });
    }
    uruntezgah = json['uruntezgah'] != null
        ? Uruntezgah.fromJson(json['uruntezgah'])
        : null;
    urunkargo = json['urunkargo'] != null
        ? Urunkargo.fromJson(json['urunkargo'])
        : null;
    if (json['begenilen_urunler'] != null) {
      begenilenUrunler = <String>[];
      json['begenilen_urunler'].forEach((v) {
        begenilenUrunler!.add("1");
      });
    }
    satisadeti = json['satisadeti'];
  }
}

class Urunicerikleri {
  String? id;
  String? icon;
  String? adi;
  String? title;
  String? keywords;
  String? description;
  String? url;
  String? durum;
  String? tezgahSecilebilirlik;
  String? anasayfadaGoster;
  String? sira;
  String? resim;

  Urunicerikleri(
      {this.id,
      this.icon,
      this.adi,
      this.title,
      this.keywords,
      this.description,
      this.url,
      this.durum,
      this.tezgahSecilebilirlik,
      this.anasayfadaGoster,
      this.sira,
      this.resim});

  Urunicerikleri.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    icon = json['icon'];
    adi = json['adi'];
    title = json['title'];
    keywords = json['keywords'];
    description = json['description'];
    url = json['url'];
    durum = json['durum'];
    tezgahSecilebilirlik = json['tezgah_secilebilirlik'];
    anasayfadaGoster = json['anasayfada_goster'];
    sira = json['sira'];
    resim = json['resim'];
  }
}

class Urunresim {
  String? id;
  String? urunId;
  String? urunKodu;
  String? resim;
  String? durum;
  String? aciklama;

  Urunresim(
      {this.id,
      this.urunId,
      this.urunKodu,
      this.resim,
      this.durum,
      this.aciklama});

  Urunresim.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    urunId = json['urun_id'];
    urunKodu = json['urun_kodu'];
    resim = json['resim'];
    durum = json['durum'];
    aciklama = json['aciklama'];
  }
}

class Uruntezgah {
  String? tezgahId;
  String? tezgahToken;
  String? tezgahKodu;
  String? tezgahAdi;
  String? sifre;
  String? kayitTarih;
  String? kayitIp;
  String? durum;
  String? telefon;
  String? eposta;
  String? epostaOnay;
  String? logo;
  String? kapakFoto;
  String? aciklama;
  String? kadinGirisimci;
  String? perakende;
  String? toptan;
  String? express;
  String? puan;
  String? statu;
  String? tezgahKategori;
  String? tezgahLink;
  String? toplamsatis;
  int? toplamurun;

  Uruntezgah(
      {this.tezgahId,
      this.tezgahToken,
      this.tezgahKodu,
      this.tezgahAdi,
      this.sifre,
      this.kayitTarih,
      this.kayitIp,
      this.durum,
      this.telefon,
      this.eposta,
      this.epostaOnay,
      this.logo,
      this.kapakFoto,
      this.aciklama,
      this.kadinGirisimci,
      this.perakende,
      this.toptan,
      this.express,
      this.puan,
      this.statu,
      this.tezgahKategori,
      this.tezgahLink,
      this.toplamsatis,
      this.toplamurun});

  Uruntezgah.fromJson(Map<String, dynamic> json) {
    tezgahId = json['tezgah_id'];
    tezgahToken = json['tezgah_token'];
    tezgahKodu = json['tezgah_kodu'];
    tezgahAdi = json['tezgah_adi'];
    sifre = json['sifre'];
    kayitTarih = json['kayit_tarih'];
    kayitIp = json['kayit_ip'];
    durum = json['durum'];
    telefon = json['telefon'];
    eposta = json['eposta'];
    epostaOnay = json['eposta_onay'];
    logo = json['logo'];
    kapakFoto = json['kapak_foto'];
    aciklama = json['aciklama'];
    kadinGirisimci = json['kadin_girisimci'];
    perakende = json['perakende'];
    toptan = json['toptan'];
    express = json['express'];
    puan = json['puan'];
    statu = json['statu'];
    tezgahKategori = json['tezgah_kategori'];
    tezgahLink = json['tezgah_link'];
    toplamsatis = json['toplamsatis'];
    toplamurun = json['toplamurun'];
  }
}

class Urunkargo {
  String? id;
  String? urunId;
  String? urunKodu;
  String? perakendeKargoSablonu;
  String? perakendeKargolamaSuresi;
  String? perakendeAdet;
  String? perakendeFiyat;
  String? perakendeKargoUcreti;
  String? perakendeEn;
  String? perakendeBoy;
  String? perakendeYukseklik;
  String? perakendeAgirlik;
  String? perakendeKargoNotu;
  String? toptanKargoSablonu;
  String? toptanKargolamaSuresi;
  String? toptanAdet;
  String? toptanFiyat;
  String? toptanKargoUcreti;
  String? toptanEn;
  String? toptanBoy;
  String? toptanYukseklik;
  String? toptanAgirlik;
  String? toptanKargoNotu;
  String? perakendeKargoUcretiFiyat;
  String? toptanKargoUcretiFiyat;
  String? perakendeKargoUcretiAltLimit;
  String? toptanKargoUcretiAltLimit;
  String? expressKargoSablonu;
  String? expressAdet;
  String? expressFiyat;
  String? expressEn;
  String? expressBoy;
  String? expressYukseklik;
  String? expressAgirlik;
  String? expressTeslimatSuresi;
  String? expressKargoNotu;
  String? expressKargolamaSuresi;
  String? perakendeKargoDurum;
  String? toptanKargoDurum;
  String? expressKargoDurum;
  String? expressKargoUcreti;
  String? expressKargoUcretiFiyat;
  String? expressKargoUcretiAltLimit;
  Perakende? perakende;
  Perakende? toptan;
  Express? express;

  Urunkargo(
      {this.id,
      this.urunId,
      this.urunKodu,
      this.perakendeKargoSablonu,
      this.perakendeKargolamaSuresi,
      this.perakendeAdet,
      this.perakendeFiyat,
      this.perakendeKargoUcreti,
      this.perakendeEn,
      this.perakendeBoy,
      this.perakendeYukseklik,
      this.perakendeAgirlik,
      this.perakendeKargoNotu,
      this.toptanKargoSablonu,
      this.toptanKargolamaSuresi,
      this.toptanAdet,
      this.toptanFiyat,
      this.toptanKargoUcreti,
      this.toptanEn,
      this.toptanBoy,
      this.toptanYukseklik,
      this.toptanAgirlik,
      this.toptanKargoNotu,
      this.perakendeKargoUcretiFiyat,
      this.toptanKargoUcretiFiyat,
      this.perakendeKargoUcretiAltLimit,
      this.toptanKargoUcretiAltLimit,
      this.expressKargoSablonu,
      this.expressAdet,
      this.expressFiyat,
      this.expressEn,
      this.expressBoy,
      this.expressYukseklik,
      this.expressAgirlik,
      this.expressTeslimatSuresi,
      this.expressKargoNotu,
      this.expressKargolamaSuresi,
      this.perakendeKargoDurum,
      this.toptanKargoDurum,
      this.expressKargoDurum,
      this.expressKargoUcreti,
      this.expressKargoUcretiFiyat,
      this.expressKargoUcretiAltLimit,
      this.perakende,
      this.toptan,
      this.express});

  Urunkargo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    urunId = json['urun_id'];
    urunKodu = json['urun_kodu'];
    perakendeKargoSablonu = json['perakende_kargo_sablonu'];
    perakendeKargolamaSuresi = json['perakende_kargolama_suresi'];
    perakendeAdet = json['perakende_adet'];
    perakendeFiyat = json['perakende_fiyat'];
    perakendeKargoUcreti = json['perakende_kargo_ucreti'];
    perakendeEn = json['perakende_en'];
    perakendeBoy = json['perakende_boy'];
    perakendeYukseklik = json['perakende_yukseklik'];
    perakendeAgirlik = json['perakende_agirlik'];
    perakendeKargoNotu = json['perakende_kargo_notu'];
    toptanKargoSablonu = json['toptan_kargo_sablonu'];
    toptanKargolamaSuresi = json['toptan_kargolama_suresi'];
    toptanAdet = json['toptan_adet'];
    toptanFiyat = json['toptan_fiyat'];
    toptanKargoUcreti = json['toptan_kargo_ucreti'];
    toptanEn = json['toptan_en'];
    toptanBoy = json['toptan_boy'];
    toptanYukseklik = json['toptan_yukseklik'];
    toptanAgirlik = json['toptan_agirlik'];
    toptanKargoNotu = json['toptan_kargo_notu'];
    perakendeKargoUcretiFiyat = json['perakende_kargo_ucreti_fiyat'];
    toptanKargoUcretiFiyat = json['toptan_kargo_ucreti_fiyat'];
    perakendeKargoUcretiAltLimit = json['perakende_kargo_ucreti_alt_limit'];
    toptanKargoUcretiAltLimit = json['toptan_kargo_ucreti_alt_limit'];
    expressKargoSablonu = json['express_kargo_sablonu'];
    expressAdet = json['express_adet'];
    expressFiyat = json['express_fiyat'];
    expressEn = json['express_en'];
    expressBoy = json['express_boy'];
    expressYukseklik = json['express_yukseklik'];
    expressAgirlik = json['express_agirlik'];
    expressTeslimatSuresi = json['express_teslimat_suresi'];
    expressKargoNotu = json['express_kargo_notu'];
    expressKargolamaSuresi = json['express_kargolama_suresi'];
    perakendeKargoDurum = json['perakende_kargo_durum'];
    toptanKargoDurum = json['toptan_kargo_durum'];
    expressKargoDurum = json['express_kargo_durum'];
    expressKargoUcreti = json['express_kargo_ucreti'];
    expressKargoUcretiFiyat = json['express_kargo_ucreti_fiyat'];
    expressKargoUcretiAltLimit = json['express_kargo_ucreti_alt_limit'];
    perakende = json['perakende'] != null
        ? Perakende.fromJson(json['perakende'])
        : null;
    toptan = json['toptan'] != null ? Perakende.fromJson(json['toptan']) : null;
    express =
        json['express'] != null ? Express.fromJson(json['express']) : null;
  }
}

class Perakende {
  String? id;
  String? adi;
  String? deger;
  String? varsayilanSecim;
  String? expressdurum;
  Gonderim? gonderim;
  Kargo? kargo;

  Perakende(
      {this.id,
      this.adi,
      this.deger,
      this.varsayilanSecim,
      this.expressdurum,
      this.gonderim,
      this.kargo});

  Perakende.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    adi = json['adi'];
    deger = json['deger'];
    varsayilanSecim = json['varsayilan_secim'];
    expressdurum = json['expressdurum'];
    gonderim =
        json['gonderim'] != null ? Gonderim.fromJson(json['gonderim']) : null;
    kargo = json['kargo'] != null ? Kargo.fromJson(json['kargo']) : null;
  }
}

class Gonderim {
  String? id;
  String? gonderimAdi;
  String? adi;
  String? gonderimDeger;
  String? title;
  String? icon;
  String? toptanSiparisFormu;
  String? varsayilanSecim;
  String? renkKodu;

  Gonderim(
      {this.id,
      this.gonderimAdi,
      this.adi,
      this.gonderimDeger,
      this.title,
      this.icon,
      this.toptanSiparisFormu,
      this.varsayilanSecim,
      this.renkKodu});

  Gonderim.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    gonderimAdi = json['gonderim_adi'];
    adi = json['adi'];
    gonderimDeger = json['gonderim_deger'];
    title = json['title'];
    icon = json['icon'];
    toptanSiparisFormu = json['toptan_siparis_formu'];
    varsayilanSecim = json['varsayilan_secim'];
    renkKodu = json['renk_kodu'];
  }
}

class Kargo {
  String? id;
  String? tezgahId;
  String? tezgahKodu;
  String? sablonAdi;
  String? gonderimDepo;
  String? gonderimKargoFirmasi;
  String? iadeDepo;
  String? iadeDegisimKargoFirmasi;
  String? iadeDegisimSartlari;
  GonderimKargoFirmasiAdi? gonderimKargoFirmasiAdi;
  GonderimKargoFirmasiAdi? iadeDegisimKargoFirmasiAdi;
  List<dynamic>? mevkiler;
  Mesailer? mesailer;

  Kargo(
      {this.id,
      this.tezgahId,
      this.tezgahKodu,
      this.sablonAdi,
      this.gonderimDepo,
      this.gonderimKargoFirmasi,
      this.iadeDepo,
      this.iadeDegisimKargoFirmasi,
      this.iadeDegisimSartlari,
      this.gonderimKargoFirmasiAdi,
      this.iadeDegisimKargoFirmasiAdi,
      this.mevkiler,
      this.mesailer});

  Kargo.fromJson(Map<String, dynamic> json) {
    //var deger = jsonDecode(json['gonderim_kargo_firmasi_adi']) as List;
    id = json['id'];
    tezgahId = json['tezgah_id'];
    tezgahKodu = json['tezgah_kodu'];
    sablonAdi = json['sablon_adi'];
    gonderimDepo = json['gonderim_depo'];
    gonderimKargoFirmasi = json['gonderim_kargo_firmasi'];
    iadeDepo = json['iade_depo'];
    iadeDegisimKargoFirmasi = json['iade_degisim_kargo_firmasi'];
    iadeDegisimSartlari = json['iade_degisim_sartlari'];
    if (json['gonderim_kargo_firmasi_adi'] != null) {
      gonderimKargoFirmasiAdi =
          GonderimKargoFirmasiAdi.fromJson(json['gonderim_kargo_firmasi_adi']);
    } else {
      gonderimKargoFirmasiAdi = null;
    }
    iadeDegisimKargoFirmasiAdi = json['iade_degisim_kargo_firmasi_adi'] != null
        ? GonderimKargoFirmasiAdi.fromJson(
            json['iade_degisim_kargo_firmasi_adi'])
        : null;
    if (json['mevkiler'] != null) {
      // var body = jsonDecode(json['mevkiler']) as List;
      mevkiler = json['mevkiler'].map((e) => Mevkiler.fromJson(e)).toList();
    }
    if (json['mesailer'] != null) {
      mesailer = Mesailer.fromJson(json['mesailer']);
    }
  }
}

class GonderimKargoFirmasiAdi {
  String? id;
  String? firmaAdi;
  String? firmaKodu;

  GonderimKargoFirmasiAdi({this.id, this.firmaAdi, this.firmaKodu});

  GonderimKargoFirmasiAdi.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firmaAdi = json['firma_adi'];
    firmaKodu = json['firma_kodu'];
  }
}

class Express {
  String? id;
  String? adi;
  String? deger;
  String? varsayilanSecim;
  String? expressdurum;
  Gonderim? gonderim;
  Kargo? kargo;
  int? durum;

  Express(
      {this.id,
      this.adi,
      this.deger,
      this.varsayilanSecim,
      this.expressdurum,
      this.gonderim,
      this.kargo,
      this.durum});

  Express.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    adi = json['adi'];
    deger = json['deger'];
    varsayilanSecim = json['varsayilan_secim'];
    expressdurum = json['expressdurum'];
    gonderim =
        json['gonderim'] != null ? Gonderim.fromJson(json['gonderim']) : null;
    kargo = json['kargo'] != null ? Kargo.fromJson(json['kargo']) : null;
    durum = json['durum'];
  }
}

class Mesailer {
  String? id;
  String? sablonId;
  String? tezgahId;
  String? tezgahKodu;
  String? pazartesi;
  String? pazartesiMesaiBasla;
  String? pazartesiMesaiBitis;
  String? sali;
  String? saliMesaiBasla;
  String? saliMesaiBitis;
  String? carsamba;
  String? carsambaMesaiBasla;
  String? carsambaMesaiBitis;
  String? persembe;
  String? persembeMesaiBasla;
  String? persembeMesaiBitis;
  String? cuma;
  String? cumaMesaiBasla;
  String? cumaMesaiBitis;
  String? cumartesi;
  String? cumartesiMesaiBasla;
  String? cumartesiMesaiBitis;
  String? pazar;
  String? pazarMesaiBasla;
  String? pazarMesaiBitis;

  Mesailer(
      {this.id,
      this.sablonId,
      this.tezgahId,
      this.tezgahKodu,
      this.pazartesi,
      this.pazartesiMesaiBasla,
      this.pazartesiMesaiBitis,
      this.sali,
      this.saliMesaiBasla,
      this.saliMesaiBitis,
      this.carsamba,
      this.carsambaMesaiBasla,
      this.carsambaMesaiBitis,
      this.persembe,
      this.persembeMesaiBasla,
      this.persembeMesaiBitis,
      this.cuma,
      this.cumaMesaiBasla,
      this.cumaMesaiBitis,
      this.cumartesi,
      this.cumartesiMesaiBasla,
      this.cumartesiMesaiBitis,
      this.pazar,
      this.pazarMesaiBasla,
      this.pazarMesaiBitis});

  Mesailer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sablonId = json['sablon_id'];
    tezgahId = json['tezgah_id'];
    tezgahKodu = json['tezgah_kodu'];
    pazartesi = json['pazartesi'];
    pazartesiMesaiBasla = json['pazartesi_mesai_basla'];
    pazartesiMesaiBitis = json['pazartesi_mesai_bitis'];
    sali = json['sali'];
    saliMesaiBasla = json['sali_mesai_basla'];
    saliMesaiBitis = json['sali_mesai_bitis'];
    carsamba = json['carsamba'];
    carsambaMesaiBasla = json['carsamba_mesai_basla'];
    carsambaMesaiBitis = json['carsamba_mesai_bitis'];
    persembe = json['persembe'];
    persembeMesaiBasla = json['persembe_mesai_basla'];
    persembeMesaiBitis = json['persembe_mesai_bitis'];
    cuma = json['cuma'];
    cumaMesaiBasla = json['cuma_mesai_basla'];
    cumaMesaiBitis = json['cuma_mesai_bitis'];
    cumartesi = json['cumartesi'];
    cumartesiMesaiBasla = json['cumartesi_mesai_basla'];
    cumartesiMesaiBitis = json['cumartesi_mesai_bitis'];
    pazar = json['pazar'];
    pazarMesaiBasla = json['pazar_mesai_basla'];
    pazarMesaiBitis = json['pazar_mesai_bitis'];
  }
}

class Mevkiler {
  String? plaka;
  String? iladi;
  List<Ilceler>? ilceler;

  Mevkiler({this.plaka, this.iladi, this.ilceler});

  Mevkiler.fromJson(Map<String, dynamic> json) {
    plaka = json['plaka'];
    iladi = json['iladi'];
    if (json['ilceler'] != null) {
      ilceler = <Ilceler>[];
      json['ilceler'].forEach((v) {
        ilceler!.add(Ilceler.fromJson(v));
      });
    }
  }
}

class Ilceler {
  String? ilceKey;
  String? ilceadi;
  List<Mahalleler>? mahalleler;

  Ilceler({this.ilceKey, this.ilceadi, this.mahalleler});

  Ilceler.fromJson(Map<String, dynamic> json) {
    ilceKey = json['ilce_key'];
    ilceadi = json['ilceadi'];
    if (json['mahalleler'] != null) {
      mahalleler = <Mahalleler>[];
      json['mahalleler'].forEach((v) {
        mahalleler!.add(Mahalleler.fromJson(v));
      });
    }
  }
}

class Mahalleler {
  String? mahalleKey;
  String? mahalleadi;

  Mahalleler({this.mahalleKey, this.mahalleadi});

  Mahalleler.fromJson(Map<String, dynamic> json) {
    mahalleKey = json['mahalle_key'];
    mahalleadi = json['mahalleadi'];
  }
}
