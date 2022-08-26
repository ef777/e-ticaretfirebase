import 'dart:convert';
import '../config/config.dart';

// ignore: camel_case_types
class Urunliste_model {
  String? id;
  String? urunAdi;
  String? urunKisaAciklama;
  String? kategoriId;
  String? statu;
  String? birim;
  String? stokAdeti;
  String? varyasyon;
  String? durum;
  String? vitrinResim;
  String? gosterimPuan;
  String? icerik;
  String? anakategori;
  String? indirim;
  String? fiyat;
  String? indirimBaslamaTarihi;
  String? indirimBitisTarihi;
  String? ureticiAdi;
  String? statuAdi;
  String? statuRenk;
  String? uretimAdi;
  String? uretimIcon;
  String? birimAdi;
  String? birimSembol;
  String? urunFiyat;
  String? urunAdet;
  String? kargoUcreti;
  String? kargoSuresi;
  String? kargoDurum;
  String? kargoTitle;
  String? yorumadet;
  String? puanlama;

  Urunliste_model(
      {id,
      urunKodu,
      urunAdi,
      urunLink,
      urunKisaAciklama,
      urunUzunAciklama,
      urunEtiketleri,
      tezgahId,
      tezgahKodu,
      kategoriId,
      kategoriKodu,
      statu,
      statuSertifika,
      kimden,
      uretim,
      uretimIl,
      birim,
      stokKontrol,
      stokKodu,
      stokAdeti,
      varyasyon,
      durum,
      yDurum,
      zaman,
      vitrinResim,
      gosterimPuan,
      icerik,
      tumkategori,
      indirim,
      perakende,
      toptan,
      express,
      indirimTarihKontrol,
      indirimBaslamaTarihi,
      indirimBitisTarihi,
      reklammi,
      ureticiAdi,
      ureticiIcon,
      statuAdi,
      statuRenk,
      statuIcon,
      uretimAdi,
      uretimIcon,
      birimAdi,
      birimSembol,
      urunFiyat,
      urunAdet,
      kargoUcreti,
      kargoSuresi,
      kargoDurum,
      kargoTitle,
      kargoRenk,
      yorumadet,
      puanlama,
      reklamdurummu});

  Urunliste_model.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    urunAdi = json['urun_adi'];

    urunKisaAciklama = json['urun_kisa_aciklama'];

    kategoriId = json['kategori_id'];

    statu = json['statu'];

    birim = json['birim'];

    stokAdeti = json['stok_adeti'];
    varyasyon = json['varyasyon'];
    durum = json['durum'];

    vitrinResim = json['vitrin_resim'];
    gosterimPuan = json['gosterim_puan'];
    icerik = json['icerik'];

    indirim = json['indirim'];

    indirimBaslamaTarihi = json['indirim_baslama_tarihi'];
    indirimBitisTarihi = json['indirim_bitis_tarihi'];

    ureticiAdi = json['ureticiAdi'];

    statuAdi = json['statuAdi'];
    statuRenk = json['statuRenk'];

    uretimAdi = json['uretimAdi'];
    uretimIcon = json['uretimIcon'];
    birimAdi = json['birimAdi'];
    birimSembol = json['birimSembol'];
    urunFiyat = json['urunFiyat'];
    urunAdet = json['urunAdet'];
    kargoUcreti = json['kargoUcreti'];
    kargoSuresi = json['kargoSuresi'];
    kargoDurum = json['kargoDurum'];
    kargoTitle = json['kargoTitle'];

    yorumadet = json['yorumadet'];
    puanlama = json['puanlama'];
  }
}
