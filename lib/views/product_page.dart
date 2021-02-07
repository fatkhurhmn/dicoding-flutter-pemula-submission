import 'package:dinggo_id/models/kategori.dart';
import 'package:dinggo_id/models/product_data.dart';
import 'package:dinggo_id/views/detail_page.dart';
import 'package:flutter/material.dart';
import 'package:dinggo_id/main.dart';
import 'package:intl/intl.dart';

class ProductPage extends StatelessWidget {
  final int kategoriKode;
  final Categori categori;
  ProductPage(this.categori, this.kategoriKode);

  @override
  Widget build(BuildContext context) {
    final double lebarCard = (MediaQuery.of(context).size.width / 2) - 16;
    final double tinggiCard =
        ((MediaQuery.of(context).size.width / 2) - 16) * (5 / 4);
    return Scaffold(
      backgroundColor: primaryColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SafeArea(
            child: Stack(
              children: [
                SizedBox(
                  height: 54,
                  child: Center(
                    child: Text(
                      categori.nama,
                      style: myTextStyle.copyWith(
                        fontSize: 23,
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                SizedBox(
                  height: 54,
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(35),
                topLeft: Radius.circular(35),
              ),
              child: Container(
                padding: EdgeInsets.only(
                  left: 6,
                  right: 6,
                ),
                color: bgColor,
                child: GridView.count(
                  childAspectRatio: 4 / 5,
                  crossAxisCount: 2,
                  children: List<Widget>.generate(
                    productData[kategoriKode].length,
                    (index) {
                      int rating = productData[kategoriKode][index].rating;
                      return Container(
                        margin: EdgeInsets.all(1),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(16),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetailPage(
                                      productData[kategoriKode][index]),
                                ),
                              );
                            },
                            child: Column(
                              children: [
                                Container(
                                  height: tinggiCard * 0.65,
                                  width: lebarCard,
                                  decoration: BoxDecoration(
                                    color: loadingColor,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(16),
                                      topRight: Radius.circular(16),
                                    ),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(16),
                                      topRight: Radius.circular(16),
                                    ),
                                    child: Image(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(
                                          productData[kategoriKode][index]
                                              .urlImage),
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(8),
                                  height: tinggiCard * 0.35,
                                  width: lebarCard,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            width: (lebarCard / 2),
                                            child: Text(
                                              productData[kategoriKode][index]
                                                  .nama,
                                              style: myTextStyle.copyWith(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 13,
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 2,
                                            ),
                                          ),
                                          Text(
                                            "Stock " +
                                                productData[kategoriKode][index]
                                                    .stok
                                                    .toString(),
                                            style: myTextStyle.copyWith(
                                              fontSize: 12,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            NumberFormat.currency(
                                              locale: 'id',
                                              decimalDigits: 0,
                                              symbol: "Rp",
                                            ).format(productData[kategoriKode]
                                                    [index]
                                                .harga),
                                            style: myTextStyle.copyWith(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 13,
                                              color: priceColor,
                                            ),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: List<Widget>.generate(
                                              5,
                                              (index) {
                                                return (index >= rating)
                                                    ? Icon(
                                                        Icons.star_outline,
                                                        size: 12,
                                                        color:
                                                            Colors.yellow[600],
                                                      )
                                                    : Icon(
                                                        Icons.star_rate,
                                                        size: 12,
                                                        color:
                                                            Colors.yellow[600],
                                                      );
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

var productData = [
  //dapur
  [
    ProductData(
      nama: "Oxone Panci Presto Aluminium",
      harga: 199000,
      urlImage:
          "https://ecs7.tokopedia.net/img/cache/900/VqbcmM/2020/11/6/430d3c82-7a50-4c14-8110-3d60ef6efc3b.jpg",
      stok: 12,
      rating: 3,
      deskripsi:
          "Panci Presto OXONE OX-2004\n\nSpesifikasi :\n- Kapasitas 4L\n- Diameter Kurang Lebih 20 Cm\n- Berbahan Aluminium\n- Ringan dan Awet (Anti Karat)\n- Dapat memasak dengan cepat\n- Pegangan Kayu",
    ),
    ProductData(
      nama: "Nicole's Wooden Spoon",
      harga: 45000,
      urlImage:
          "https://ecs7.tokopedia.net/img/cache/900/product-1/2019/8/6/5116808/5116808_161e1f47-32ff-4f13-9ee4-a663e874f94b_1080_1080",
      stok: 7,
      rating: 5,
      deskripsi:
          "Nicole's Wooden Spoon (Mini) - 3 pcs\n\nSpec : Panjang 10 cm, Isi 3 pcs\n\nWhat better way to be eco-friendly? What better way to buy Indonesian wood those have been sustainable harvested? Nicole's solid wood is the answer. We use natural oils and waxes as the most eco-friendly of wood finishes. Wood is easy to care for, naturally anti-bacterial, and grows more beautiful over time",
    ),
    ProductData(
      nama: "Gelas Mug Keramik",
      harga: 13000,
      urlImage:
          "https://ecs7.tokopedia.net/img/cache/900/VqbcmM/2021/1/19/499a2bed-f247-426f-9913-ad251c91cbbb.jpg",
      stok: 54,
      rating: 5,
      deskripsi:
          "Gelas Mug Keramik 11oz 300ml Hitam Polos \n[PENTING] Untuk menjaga kenyaman bersama kami sarankan untuk membeli extra bubble wrapping, di karenkan barang adalah pecah belah.\n\nContoh:\n1 Gelas + 1 orderan Tambahan Bubble Wrap\n5 Gelas + 5 orderan Tambahan Bubble Wrap\nBaru akan kami proses",
    ),
    ProductData(
      nama: "Piring Lontong Vicenza P131",
      harga: 175000,
      urlImage:
          "https://ecs7.tokopedia.net/img/cache/900/product-1/2017/9/11/2378734/2378734_b90ce9fa-1818-48ef-b5f9-ba204a7db143",
      stok: 81,
      rating: 4,
      deskripsi:
          "Dinner Plate 9\" P131 (1 lusin) Motif PADI Color, PIRING VICENZA\n\nPermukaan yang begitu halus dihias dengan motif Vicenza. Praktis dan mudah dibersihkan setelah digunakan. Produk ini menjadi bagian yang tidak terpisahkan dengan rutinitas harian Anda ketika makan bersama keluarga tercinta.\n\nP x L x T (cm) : 27 x 27 x 18\nDigunakan untuk :\nSiomay, lontong sayur\nKue atau makanan kering\nTerdiri dari :\n12 buah piring",
    ),
    ProductData(
      nama: "Wajan Kuali Penggorengan Alumunium",
      harga: 189000,
      urlImage:
          "https://ecs7.tokopedia.net/img/cache/900/product-1/2020/6/28/486268244/486268244_05a41728-f8d5-4300-9ba9-9f4ae5a7a152_1560_1560.jpg",
      stok: 20,
      rating: 5,
      deskripsi:
          "MEREK\n1. Bintang = merek bintang\n2. Jempol= merek jempol\n3. Edea = merek edea\n4. Biasa = merek bebas atau tanpa merek\n\nWajan Tradisional no 12\nDiameter sekitar 29 - 30 cm\nTinggi / Kedalaman : 8 cm\nVolume : 3,5 liter (perkiraan)\nBerat : 330 gram",
    ),
    ProductData(
      nama: "Kompor Gas Progas Miyako",
      harga: 89000,
      urlImage:
          "https://ecs7.tokopedia.net/img/cache/900/VqbcmM/2021/1/18/aa825c50-5171-4248-9f3f-99bb3ae1345d.jpg",
      stok: 24,
      rating: 4,
      deskripsi:
          "Kelebihan dari kompor ini :\nApi berwarna biru\nlebih hemat dari yang lainnya\ntidak memerlukan pengeluaran gas yang terlalu besar\npraktis\nready stok",
    ),
    ProductData(
      nama: "Baskom Lion Star",
      harga: 8500,
      urlImage:
          "https://ecs7.tokopedia.net/img/cache/900/VqbcmM/2020/10/16/b575d98d-8bfa-4086-aa44-cdc2be09d138.jpg",
      stok: 31,
      rating: 2,
      deskripsi:
          "Diameter : 23.5 cm\nTinggi : 8.5 cm\n\nContact No : 085772091460 | 085780179460 (WA)",
    ),
    ProductData(
      nama: "Pisau Victorinox",
      harga: 72000,
      urlImage:
          "https://ecs7.tokopedia.net/img/cache/900/product-1/2020/5/28/68022609/68022609_f56a1d73-b07a-4ec2-b18f-a7396dabc77f_889_889",
      stok: 68,
      rating: 3,
      deskripsi:
          "Pisau 5.0701 Victorinox Red Paring Knife 10 cm (20,5 cm)\n\nUkuran :\nPanjang bilah / mata sayat : 10,2 cm ( tepi lurus/polos - melengkug -lancip )\nPanjang keseluruhan : 20,5 cm\nBahan Pegangan : Polypropylene (PP)\nBerat : 25 gram\nEstimasi pengiriman : 50 gram\n\nParing knife merupakan pisau berukuran kecil dengan panjang hanya 10 sampai 17 cm saja. Sesuai dengan namanya yang berarti pisau kupas, pisau yang menyerupai chef's knife berukuran mini ini memang digunakan untuk mengupas kulit buah dan sayur. Selain itu, paring knife juga dapat digunakan untuk menyayat udang serta membuat hiasan buah dan sayur.",
    ),
  ],
  //elektronik
  [
    ProductData(
      nama: "Redmi Note 9 Pro",
      harga: 2700000,
      urlImage:
          "https://selular.id/wp-content/uploads/2020/06/1592218594921_Redmi-note-9-Pro-16.jpg",
      stok: 2,
      rating: 5,
      deskripsi:
          "DISPLAY Type IPS LCD capacitive touchscreen, 16M colors\nSize 6.67 inches, 107.4 cm2 (~84.5% screen-to-body ratio)\nResolution 1080 x 2400 pixels, 20:9 ratio (~395 ppi density)\nProtection Corning Gorilla Glass 5\nPLATFORM OS Android 10, MIUI 11\nChipset Qualcomm SM7125 Snapdragon 720G (8 nm)\nCPU Octa-core (2x2.3 GHz Kryo 465 Gold & 6x1.8 GHz Kryo 465 Silver)\nGPU Adreno 618\nMEMORY Card slot microSDXC (dedicated slot)\nInternal 64GB 6GB RAM\nUFS 2.1\nMAIN CAMERA Quad 64 MP, f/1.9, 26mm (wide), 1/1.72, 0.8µm, PDAF\n8 MP, f/2.2, 13mm (ultrawide), 1/4.0, 1.12µm\n5 MP, f/2.4, (macro), AF\n2 MP, f/2.4, (depth)\nFeatures LED flash, HDR, panorama\nVideo 4K@30fps, 1080p@30/60/120fps, 720p@960fps\nSELFIE CAMERA Single 16 MP, f/2.5, (wide), 1/3.1 1.0µm\nFeatures HDR, panorama\nVideo 1080p@30/120fps\nSOUND Loudspeaker Yes\n3.5mm jack Yes\nCOMMS WLAN Wi-Fi 802.11 a/b/g/n/ac, dual-band, Wi-Fi Direct, hotspot\nBluetooth 5.0, A2DP, LE\nGPS Yes, with A-GPS, GLONASS, GALILEO, BDS\nNFC Yes\nInfrared port Yes\nRadio FM radio, recording\nUSB 2.0, Type-C 1.0 reversible connector\nFEATURES Sensors Fingerprint (side-mounted), accelerometer, gyro, proximity, compass\nBATTERY Non-removable Li-Po 5020 mAh battery",
    ),
    ProductData(
      nama: "GoPro Hero 6",
      harga: 4100000,
      urlImage:
          "https://www.sulselsatu.com/wp-content/uploads/2017/10/gopro-hero6.jpg",
      stok: 9,
      rating: 2,
      deskripsi:
          "ISI DALAM BOX :\n- HERO6 Black Camera\n- The Frame\n- Rechargeable Battery\n- Mounting Buckle\n- Curved + Flat Adhesive Mounts\n- USB Cable\n\nQUICK OVERVIEW :\nSupportVideo4K60 / 2.7K120 / 1080p240\nResolusi Foto 12MP Photos pada 30 fps\nLensa Galss Ultra Wide Angle\nWaterproof hingga kedalaman 10 meter\nVoice ControlRear Touchscreen\nWi-Fi untuk Remote Monitoring dan Control\nInterval Capture untuk Time-Lapse\nLinear Video Mode untuk memperbaiki distorsi\nsudah termasuk Flat dan Curved Adhesive Mount\n\nGoPro HERO 6 Black dengan dibekali Prosesor GP1 yang optimal,GoPro HERO6 dapat menghasilkan frame rate yang lebih tinggi dalam resolusi HD 4K, 2.7K, dan 1080p. Dimana model sebelumnya maksimal dengan 30 fps dalam 4K, HERO6 Black dapat memaksimalkannya dengan 60 fps untuk rendering smooth motion atau slow motion dalam timelines dengan frame rate lebih lambat. Tugas intensif prosesor yang lainnya seperti image stabilization, juga telah diperbaiki di HERO 6. ",
    ),
    ProductData(
      nama: "Kipas Angin Arashi",
      harga: 72000,
      urlImage:
          "https://ecs7.tokopedia.net/img/cache/900/product-1/2019/7/22/34642491/34642491_8576c166-7636-4fb8-a6d9-d73db555d089_700_700",
      stok: 20,
      rating: 4,
      deskripsi:
          "Kipas angin meja ARASHI GENERAL- Ukuran kipas 8 inchi\n- TIdak bising\n- Bisa putar kiri kanan, bisa di tundukkan\n- Dengan 2 tingkat kecepatan putaran kipas\n- 25 Watt 220V - AC / 50 HzCocok untuk di ruang kerja, meja belajar , dllNOTE:\n- Barang pesanan anda akan kami cek terlebih dahulu sebelum dikirim",
    ),
    ProductData(
      nama: "Headphone JBL E55BT",
      harga: 58000,
      urlImage:
          "https://ecs7.tokopedia.net/img/cache/700/product-1/2020/8/3/batch-upload/batch-upload_9dba2e7d-717f-49c1-9466-e9577cc64cf7.jpeg",
      stok: 36,
      rating: 3,
      deskripsi:
          "Model: E55BT Quincy Edition\n\nColor classification:\ngray, pink , Black , Blue\n\nHeadphone material: plastic + metal\nPlug diameter: 3.5mm\nHeadphone output source: portable audio and video\nPackage type: Official standard\nHeadphone Category: Mobile phone headset HIFI headset\nWith or without microphone: with wheat\nWearing method: wearing ear protection\nHeadphone type: Wireless\nHeadphone plug type: L-bend\nWhether wire control: yes\nCompatible platforms: ANDROID iOS\nApplicable music type: vocal female pop style\nSensitivity: 102dB/mW\nFrequency response range: 20-22000Hz",
    ),
    ProductData(
      nama: "TV Sony 4K Brivia",
      harga: 7400000,
      urlImage:
          "https://ecs7.tokopedia.net/img/cache/900/VqbcmM/2021/1/25/535ba9f7-0d91-4508-b7b8-540f2940b771.jpg",
      stok: 40,
      rating: 4,
      deskripsi:
          "Fitur Utama :\n- Available in 108 cm (43\")|123 cm (49\")|139 cm (55\")|164 cm (65\")\n- Triluminos Display\n- 4K X-Reality™ PRO\n- Bass Reflex Speaker\n- Android TV™\n- Slim blade stand\n- Narrow Bezel\n\nSpesifikasi :\n- OPERATING SYSTEM : Android™\n- DISPLAY RESOLUTION : 3840x2160\n- CHROMECAST BUILT-IN : Yes\n- BLUETOOTH PROFILE SUPPORT : Version 4.2;HID (mouse/keyboard connectivity)/HOGP (Low Energy device connectivity)/SPP(Serial Port Profile) - BELUM AUDIO BLUETOOTH -\n- APPLE AIRPLAY : No\n- MOTION ENHANCER (NATIVE HZ) : Motionflow™ XR 200 (Native 50Hz)\n- PICTURE PROCESSOR : 4K Processor X1™\n- CLARITY ENHANCEMENT : 4K X-Reality™ PRO\n- COLOUR ENHANCEMENT : Live Colour™ Technology - TRILUMINOS™ Display\n- HDMI : 3\n- USB : 2",
    ),
    ProductData(
      nama: "Keyborad Vortex VX5",
      harga: 355000,
      urlImage: "https://cf.shopee.co.id/file/56e9a8b518dafdd4bef4aaa95f2f9bdc",
      stok: 11,
      rating: 5,
      deskripsi:
          "VortexSeries Mechanical Keyboard VX5 (61 Keys)\n- RGB Programable Lightning\n- Removeable Outemu Switch\n- Full Keys Anti Ghosting\n- 50 Million Clicks Lifetime\n- Removeable Cable\n- Free Keycaps & Switch Puller\n- Software available in our website www.vortexseries.net\n- Garansi 1 Tahun VortexSeries\nDimensi 29*10cm",
    ),
    ProductData(
      nama: "Msi Modern 14",
      harga: 11890000,
      urlImage:
          "https://www.yangcanggih.com/wp-content/uploads/2020/12/MSI-Modern-14-B10R-Bluestone-1.jpg",
      stok: 12,
      rating: 4,
      deskripsi:
          "MSI Modern 14 B10RBSW [9S7-14D112-247] i5-10210U 8GB 512GB MX350 2GB 14\" W10 - Blue Stone\n\nSpesifikasi:\nProcessor Onboard : Intel® Core™ i5-10210U Processor (6M Cache, up to 4.10 GHz)\nMemori Standar : 8GB DDR4\nTipe Grafis : nVidia GeForce® MX350 2GB GDDR5\nUkuran Layar : 14\" FHD (1920*1080), IPS-Level 60Hz 72%NTSC Thin Bezel, close to 100%sRGB\nHard Disk : 512 GB NVMe PCIe SSD\nKeyboard : Backlight Keyboard (Single-Color, White)\nKamera : HD type (30fps@720p)\nWireless Network : Intel Wireless-AC 9560 (2*2 a/c) + BT5\n\nInterfaces :\n1x Type-C USB3.2 Gen1\n2x Type-A USB3.2 Gen1\n1x SD (XC/HC)\n1x (4K @ 30Hz) HDMI\n1 Mic-in/Headphone-out Combo Jack\n\n\nSistem Operasi : Windows 10 Home\nBatteray : 3 cell , 52Whr\nDimension : 322 x 222 x 15.9 mm\nBerat : 1.18KG\nColour : Blue Stone",
    ),
    ProductData(
      nama: "Blender Sharp EM-121-BK",
      harga: 299000,
      urlImage:
          "https://ecs7.tokopedia.net/img/cache/900/VqbcmM/2020/11/16/b6966685-e172-44bb-8e4c-3b32bfe2c49a.jpg",
      stok: 9,
      rating: 5,
      deskripsi:
          "Blender SHARP EM-121-BK\n\nSpesifikasi :\n- Daya Listrik : 350 Watt\n- Including Dry Mill set\n- Terdapat 3 Fungsi Kecepatan\n- Kapasitas Jar Besar : 1.25 Liter\n- Kapasitas Jar Bumbu : 50 Gram\n- Bahan Gelas : Plastik Mika\n- Garansi Resmi SHARP 1 Tahun\n\nSharp EM-121BK - Blender 1.25 Liter 350 Watt Black tampilan desain berkelas dengan balutan warna hitam elegan, membuat dapur menjadi tampak lebih mewah. Sharp Blender 1.25 Liter 350 Watt Black - EM121BK memiliki bahan material yang terbuat dari stainless steel yang kuat.",
    ),
    ProductData(
      nama: "Lampu Philips 18 Watt",
      harga: 35000,
      urlImage:
          "https://ecs7.tokopedia.net/img/cache/900/product-1/2020/3/16/7973854/7973854_d7708d90-ac9f-47b9-95a0-0fd83082c213_1224_1224.jpg",
      stok: 25,
      rating: 5,
      deskripsi:
          "Merk : Philips\nTipe : Essential\nWarna : Putih\nWatt : 18 watt\nFitting : E27\nVoltage : 220-240 V",
    ),
    ProductData(
      nama: "Cokike JBL Bose",
      harga: 290000,
      urlImage:
          "https://ecs7.tokopedia.net/img/cache/900/product-1/2019/8/3/44762655/44762655_89fa2f05-adf2-4809-80dd-ea5db0399291_700_700",
      stok: 29,
      rating: 3,
      deskripsi:
          "Product Type: Mini Pocket Speaker\nInterface: Micro USB port, MicroSD Card port.\nBluetooth Version: Bluetooth 3.0\nSupport Profiles: A2DP/AVRCP/HFP/HSP\nOperation Distance: Up to 10m (Free Space)\nAudio System: 2.0 Channel\nMax Micro SD Card Memory: Up to 32GB\nOutput Power: 4W * 2\nImpedance: 4\nSensitivity: 85dB\nFrequency Response: 90Hz18KHz\nSignal and Noise Ratio (SNR): 70dB\nOutput Distortion Rate: 0.5%\nBattery Capacity: Built-in 3.7V / 2200mAh Li-ion battery\nMusic Play Time: 5.08.0 hours (Depends on the volume level)\nTalk Time: Up to 8 hours\nCharge Time: 3.5 hours (Depends on charger or charge cable)\nCharging Port: Micro USB port, DC5V",
    ),
    ProductData(
      nama: "AC Sharp Split",
      harga: 3290000,
      urlImage:
          "https://ecs7.tokopedia.net/img/cache/900/VqbcmM/2020/12/18/dfa9c604-381c-4c72-8f3b-c85c8b72a468.jpg",
      stok: 4,
      rating: 5,
      deskripsi:
          "GARANSI RESMI SHARP INDONESIA 1 TAHUN SPAREPART 10 TAHUN KOMPRESOR\n\nSPESIFIKASI:\n1. KAPASITAS : 2.64 KW / 9.000 Btu/h\n2. CATU DAYA : 1 PHASE, 220 V, 50 Hz\n3. ARUS KERJA : 4 A\n4. KONSUMSI DAYA : 800 W\n5. DIMENSI INDOOR : 877 x 292 x 222\n6. DIMENSI OUTDOOR : 598 x 495 x 265\n7. BERAT INDOOR : 9 Kg\n8. BERAT OUTDOOR : 20 Kg\n9. COANDA\n10. JETSTREAM\n11. PIPA 1/4\" 3/8\"",
    ),
  ],
  //Fashion
  [
    ProductData(
      nama: "Baju Kemeja Batik Pria",
      harga: 75000,
      urlImage:
          "https://ecs7.tokopedia.net/img/cache/900/product-1/2018/9/3/3853096/3853096_657cbbbd-9b82-420b-8bb9-861b8c0bf64e_960_960.jpg",
      stok: 8,
      rating: 5,
      deskripsi:
          "Tampil Mewah dengan baju Batik PEKALONGAN.\n*REAL PICT\n*JANGAN SAMAKAN DGN PRODUK SEBELAH.\n*HARGA MENENTUKAN KUALITAS PRODUK.\n\nTERSEDIA SIZE: M-L-XL-XXL\n>Proses pembuatan dengan TEKNIK MODERN YANG SUDAH TERUJI KUALITASNYA.\nDan pewarnaan yg sudah MATANG.\nmenjadikan KUALITAS WARNA TIDAK LUNTUR Dan AWET.\n\n>>>Produk yg kami jual 100% ORIGINAL. Yang Mana kualitas PRODUK Original adalah yg terbaik.\n\nTerbuat dari kain Katun Berkualitas BAIK, TIDAK MUDAH KUSUT DAN TIDAK LEPEK.\nBuat Acara Resmi Atupun Non Resmi Masih Tetap Oke & Elegan\n>>>SERAT HALUS\n>>>Nyaman Dipakai (Tidak Panas)\n>>>Kualitas Tinggi\n>>>Harga Terbaik\n>>>Belanja Mudah & Aman\n\n\"BUAT APA BELI YG MURAHAN KALAU ADA YG LEBIH BAIK DAN BERMUTU\"\n(PEMBELI YANG CERDAS)\n\nMelayani pesanan untuk SERAGAM.",
    ),
    ProductData(
      nama: "Jam Tangan Jims Honey 8123",
      harga: 53000,
      urlImage:
          "https://ecs7.tokopedia.net/img/cache/900/product-1/2020/3/2/1371624/1371624_75afe3d3-254b-4f28-bf83-aad790869735_960_960.jpg",
      stok: 156,
      rating: 3,
      deskripsi:
          "JAM TANGAN ELEGAN CUMA 60 RIBUAN! Hanya Jimshoney yang bisa kasih deal seperti ini\n.\nDapatkan jam tangan best seller 8123 dari Jimshoney hanya IDR 60.000 (normal price IDR 258.000) - wow that's more than 70% off. Dari tanggal 2-9 Maret 2020 atau selama persediaan masih ada\n.\nJam tangan 8123 yang elegan nan menawan, dengan ornamen berlian pada angka jam tangan\n.\nMemiliki design yang sleek dan minimalis, cocok untuk #JHLadies yang memiliki jiwa aktif dan dinamis\n.\nIt's been 6 years and you're still and always deserve the best! The best product, the best price and now you get the BEST DEAL! Ladies, it's now or never! Stock jam tangan 8123 ini SUPER DUPER, LIMITED! so, buy now or cry later ;)",
    ),
    ProductData(
      nama: "Dress Jeans Wanita",
      harga: 100000,
      urlImage:
          "https://ecs7.tokopedia.net/img/cache/900/product-1/2020/5/16/26342226/26342226_772dcb1a-691d-496c-a8bd-83d1f10298ad_1280_1280",
      stok: 9,
      rating: 5,
      deskripsi:
          "Dress Jeans Wanita Jumbo Bordir Kancing\n\nLD 118CM\nPJ 98CM\n\n• Gambar Hanya referensi, kemiripan barang dengan gambar 90-95%\n• Barang READY STOCK (Jika habis akan di restock ulang)\n• Tolong Chat dulu untuk menanyakan Ready Stock dan Warna.Terima Kasih.",
    ),
    ProductData(
      nama: "Jaket Hodie Zipper Polos",
      harga: 50000,
      urlImage:
          "https://ecs7.tokopedia.net/img/cache/900/VqbcmM/2020/10/27/45af3711-7f8a-40a0-a499-cabc95730b54.jpg",
      stok: 31,
      rating: 5,
      deskripsi:
          "Bahannya adem dipakai tidak panas.\nTersedia berbagai varian warna dan size.\n\nukuran;\n*XL= pjg 70 cm x lingkar dada 116 cm\n*XXL= pjg 71 cm x lingkar dada 118cm\n*XXXL= pjg 72cm x lingkar dada 122cm\nToleransi penyusutan bahan-/+2 cm\nAda Resleting,kantong depan dan topi bertali\n\nWarna yg tersedia:\n*Hitam\n*Biru Dongker\n*Merah maron\n*abu misty\n*Benthur\n*Merah cabe\n*oren\n*merah cabe\n*army\n*kuning",
    ),
    ProductData(
      nama: "Sandal Rumah Pink",
      harga: 35000,
      urlImage:
          "https://ecs7.tokopedia.net/img/cache/900/VqbcmM/2020/9/19/c00abcb9-da12-432f-911b-52d53b1edc4d.jpg",
      stok: 523,
      rating: 4,
      deskripsi:
          "Sandal anti slip yang cocok untuk di rumah dengan motif klasik, cocok untuk semua usia. Warna cantik dan bagus, bahan lembut, nyaman di pakai.\n\nTersedia 5 warna:\nMerah muda (Pink)\nBiru (Blue)\nKrim (Cream)\nAbu abu (Grey)\nAbu abu gelap (Dark Grey)\n\n\nNOTE: Ukuran: ± 2 cm : Tiap orang bentuk kaki nya berbeda, kami sarankan beli satu size diatas.\nS (37/38) 25cm\nM (39/40) 26 cm\nL (42/43)27cm\nXL (44/45) 28cm",
    ),
    ProductData(
      nama: "Sepatu Nike Air Jordan",
      harga: 1199000,
      urlImage:
          "https://ecs7.tokopedia.net/img/cache/900/VqbcmM/2020/10/1/ec119a0f-2462-43c5-be79-fa5563348ff6.jpg",
      stok: 12,
      rating: 5,
      deskripsi:
          "Nike Air Jordan 1 Low Black Toe readystock!\n\nAvailable size :\n36 EUR - 5.5US - 22.5 cm\n37.5 EUR - 6.5 US - 23.5 cm\n38 EUR - 7 US - 24 cm\n39 EUR - 8 US - 25 cm\n40 EUR - 7 US - 25 cm\n41 EUR - 8 US - 26 cm\n42 EUR - 8.5 US - 26.5 cm\n43 EUR - 9.5 US - 27.5 cm\n44 EUR - 10 US - 28 cm\n45 EUR - 11 US - 29 cm\n46 EUR - 12 US - 30 cm",
    ),
    ProductData(
      nama: "Celana Joger Pria Pants",
      harga: 43000,
      urlImage:
          "https://ecs7.tokopedia.net/img/cache/900/product-1/2020/3/10/1819856/1819856_3f8ef007-c8e9-4ee4-8a53-fd0046991b2a_1024_1024",
      stok: 331,
      rating: 5,
      deskripsi:
          "Nyaman digunakan saat gym , olahraga , santai maupun jalan jalan kemana pun\n\nBahan : Babyterry (bahan nyaman dan lembut)\n- Model : jogger Panjang\n- memakai RIb/karet di kaki\n- memakai tali pinggang\n\nUkuran M fit L (28-33)\n- Panjang : 89cm\n- Ukuran : allsize fit L (lebar pinggang 33cm melar ke 50cm)\n- real pict 100%\n\nUkuran XL fit XXL (34-36)\nLingkar Pinggang +- 79cm fit to 110cm (atau setara size 33 - 36)\nPanjang celana +- 97 cm\nLingkar Paha +- 62 cm\nLingkar betis +- 51 cm",
    ),
    ProductData(
      nama: "Syal Batik Cap Satung",
      harga: 35000,
      urlImage:
          "https://ecs7.tokopedia.net/img/cache/900/attachment/2019/3/27/155366870352084/155366870352084_58925222-5f8c-4ed1-882c-d9fc8f1e5d0f.png",
      stok: 216,
      rating: 4,
      deskripsi:
          "Batik cap Scarf\nUkuran 130cmx35cm\nBahan kain santung (jatuh spt paris)\nRp 35.000\nBeli grosir bisa warna sama tetapi motif acak.",
    ),
    ProductData(
      nama: "Dasi Kupu Wedding Houseofcuff",
      harga: 69000,
      urlImage:
          "https://ecs7.tokopedia.net/img/cache/900/product-1/2016/6/4/3425805/3425805_3be32385-835c-4e2e-963d-445dd5c561e8.jpg",
      stok: 1034,
      rating: 5,
      deskripsi:
          "Dasi Kupu-Kupu / Bow Tie :\n\nBahan : Satin Polyester (High Quality)\nMotif : Kotak kotak kecil\nJenis pengait : menggunakan kaitan, dapat diatur besar kecil lingkaran lehernya\nPackaging : mendapatkan kotak mika Houseofcuff.com",
    ),
  ],
  //Furniture
  [
    ProductData(
      nama: "Meja Pajangan",
      harga: 73000,
      urlImage:
          "https://ecs7.tokopedia.net/img/cache/900/product-1/2019/8/14/1976333/1976333_1c10b991-b8d3-4562-9523-df201a369ea1_700_700.jpg",
      stok: 2,
      rating: 5,
      deskripsi:
          "Coffee Table dengan bentuk persegi terbuat dari Kayu Wpc memberikan kesan elegan dan minimalis pada dekorasi rumah anda dengan harga yang terjangkau, dapat menemani waktu santai anda dan dilengkapi dengan rak untuk menyimpan koran atau majalah\n\nProduk berkualitas buatan Mesin, bukan produk buatan tangan sehingga terjamin akurasi dan juga furnishing yang jauh lebih rapi sehingga membuat ruangan rumah anda lebih indah terlihat.\n\nTIDAK TERMASUK PAJANGAN\n\nSize: 36cm*24cm* tinggi50cm (Detail lihat gambar)\n\nHarga Di Atas 1 Pcs\nBerat Satuan: 1700 Gram\nKode : A554",
    ),
    ProductData(
      nama: "Almari Pakaian Rakit DIY",
      harga: 209000,
      urlImage:
          "https://ecs7.tokopedia.net/img/cache/900/product-1/2018/7/19/230898479/230898479_1cad821c-0f3c-4068-96f1-213635b1c708_700_700.jpg",
      stok: 12,
      rating: 5,
      deskripsi:
          "[ Model dirakit sendiri , kita berikan petunjuk penggunaan. MUDAH 100%! ]\n\nMaterial : Pipa Besi + Kain Non Wooven fabric\nPenutup : Non Wooven fabric\nSize : 103x43x165 cm",
    ),
    ProductData(
      nama: "Kursi Hirosima",
      harga: 1186000,
      urlImage:
          "https://ecs7.tokopedia.net/img/cache/900/VqbcmM/2020/11/26/01078aa8-588c-4c8a-843f-91e61367a20b.jpg",
      stok: 58,
      rating: 3,
      deskripsi:
          "\nSPESIFIKASI\n* Material : kayu jati\n* Finishing : Natural\n* Busa : menyesuaikan\n* Packing : Fomisite dan kardus.",
    ),
    ProductData(
      nama: "Sofa L Davinci",
      harga: 1799000,
      urlImage:
          "https://ecs7.tokopedia.net/img/cache/900/attachment/2020/3/18/158450522937724/158450522937724_e924861f-3804-4623-88b7-579cd1bb4bb7.png",
      stok: 22,
      rating: 5,
      deskripsi:
          "SOFA L DAVINCI BNYK PILIHAN WARNA PLUS MEJA JUGA :)\n\nUkuran\n3 dudukan 200x80x75\ndudukan puff 90x70x65\nMeja 70x40x45",
    ),
    ProductData(
      nama: "Kasur Lipat Bahan Oscar",
      harga: 245000,
      urlImage:
          "https://ecs7.tokopedia.net/img/cache/900/VqbcmM/2021/1/14/250a8582-6ce7-4c8c-80a2-7c96fe206ca9.jpg",
      stok: 884,
      rating: 4,
      deskripsi:
          "Produk:Kasur lipat orthopedic 120x185-190x4 cm\n\nMARI PEDULI KESEHATAN !\nRe-born Tech khusus memproduksi produk kasur/kasurlipat/matras/travel bed untuk MENSUPPORT KESEHATAN TULANG BELAKANG/ ORTHOPEDIC yang sangat dianjurkan untuk BAYI,BALITA,DEWASA SAMPAI LANSIA.",
    ),
    ProductData(
      nama: "Rak Serbaguna",
      harga: 45000,
      urlImage:
          "https://ecs7.tokopedia.net/img/cache/900/product-1/2019/4/26/33002412/33002412_9b33fd01-91d5-4ed4-904f-5a75afb97038_1242_1242",
      stok: 367,
      rating: 4,
      deskripsi:
          "Size : 40 x 28x 122 cm\nBahan : Non woven, sejenis kain plastik dengan rangka dari bahan plastik. Bahan non woven kuat untuk menampung barang berat.\nMotif : type 2 (Biru Polkadot)\n\nRak portable serbaguna 5 Lapis 4 ruang, untuk merapikan buku pelajaran anak agar tersusun rapi dan mudah dicari, untuk tempat majalah, dokumen kantor atau perlengkapan rumah dan dapur.\n\nTerdiri dari 5 Lapis 4 ruang, mudah dibongkar pasang. Bagi yang kerjanya sering pindah lokasi sangat cocok memakai rak ini, tidak perlu beli rak baru tiap pindah lokasi baru, cukup bongkar rak dan simpan di dalam dus kemasan, sangat portable untuk dibawa.",
    ),
    ProductData(
      nama: "Kursi Goyang",
      harga: 2700000,
      urlImage:
          "https://ecs7.tokopedia.net/img/cache/900/product-1/2020/7/12/1012229966/1012229966_007ef944-6937-4376-a368-8d3018391290_736_736.jpg",
      stok: 45,
      rating: 5,
      deskripsi:
          "PSPINDO CUSHION JEPARA\n\nFURNITURE DENGAN BAHAN BERKUALITAS\n\nSpesisfikasi:\nBahan Kayu jati TPK perhutani\nFinishing melamine spray awet merata (pilih warna)\nFabric jok(pilih warna)\nDesain menarik Unik kombinasi modern\nBisa custom desain dan ukuran",
    ),
    ProductData(
      nama: "Meja Lipat Lesehan",
      harga: 350000,
      urlImage:
          "https://ecs7.tokopedia.net/img/cache/900/product-1/2020/9/20/52631259/52631259_6b911dcc-a5cb-4476-9421-39e340d7f823_985_985",
      stok: 161,
      rating: 4,
      deskripsi:
          "Kayu Meranti sudah terkenal kualitasnya, serat Halus dan Kuat, sering digunakan untuk bahan baku furniture export. Kayu Meranti adalah salah satu jenis kayu andalan Indonesia yang terdapat di iklim tropis katulistiwa Indonesia dan sudah tidak asing lagi karna dari jaman nenek moyang kita sampai sekarang bahkan di export Kayu Meranti digunakan untuk Furniture,Kusen,Pintu,dll\n\nCocok untuk makan lesehan bersama 4 orang\n\nCocok untuk meja kerja komputer, laptop lengkap dengan printer\n\nKonstruksi KUAT dan KOKOH dan TEBAL, bisa tahan beban orang dewasa berdiri atau duduk diatas meja.\n\n* UKURAN MEJA : 90cm x 60cm x 33cm Tinggi\n* UKURAN DILIPAT : 90cm x 60cm x 6.5cm Tinggi\n* Finishing : POLITUR VERNIS CLEAR, HALUS DAN LICIN\n* Warna : NATURAL SERAT KAYU MASIH KELIHATAN TDK MATI SEPERTI DI CAT\n* Treatment Kayu : Oven Kering & Coating",
    ),
  ],
  //kecantikan
  [
    ProductData(
      nama: "Ikat Karet Rambut",
      harga: 8900,
      urlImage:
          "https://ecs7.tokopedia.net/img/cache/900/VqbcmM/2020/11/10/1c14eba8-2ebb-4ec4-b725-0a9ad06cdb6b.jpg",
      stok: 110,
      rating: 5,
      deskripsi:
          "IK01 Ikat Rambut Korea I Can Swim isi 100 pcs Warna Warni\n\nIkat rambut ini terdiri dari 100 pcs, sehingga harga per pcs sangat sangat murah…..\n\nCocok buat berbagai model rambut, dengan warna warna menarik, sehingga membuat yang memakainya tampak cantik dan menarik.\n\nWarna dalam 1 packing campur.",
    ),
    ProductData(
      nama: "Inai Kuku / Henna Kuku",
      harga: 30000,
      urlImage:
          "https://ecs7.tokopedia.net/img/cache/900/VqbcmM/2020/11/25/4aeafb15-2237-4aa7-adf4-e8f73a8482c3.jpg",
      stok: 74,
      rating: 3,
      deskripsi:
          "Inai kuku (pewarna kuku halal) yang sangat mudah diaplikasikan pada kuku anda. Mempercantik kuku sehingga anda tidak perlu repot pergi keluar dgn biaya yang mahal. Apalagi saat kondisi pandemi seperti ini dengan harga terjangkau tampilan kuku tetap cantik.\n\nSangat cocok juga digunakan bagi para Henna Artist untuk mewarnai kuku para klien dan membuat tampilan henna semakin indah.\n\nTersedia 2 varian warna :\n- Beauty Red\n- Beauty Maroon\n\nFREE PACKING BUBBLE WRAP.\n\n- Sah untuk sholat karena menyerap air tidak menghalangi air wudhu.\n- Warna merata dan bisa bertahan 1-3 bulan.\n- Proses memudarnya mengikuti tumbuhnya kuku.\n- Mudah diaplikasikan dan harga hemat terjangkau.",
    ),
    ProductData(
      nama: "Hydro Oxy 2.0 Spray",
      harga: 35000,
      urlImage:
          "https://ecs7.tokopedia.net/img/cache/900/VqbcmM/2021/1/19/686fa1e6-67bc-4334-ba6b-778b49babebe.jpg",
      stok: 10,
      rating: 4,
      deskripsi:
          "NETTO: 30Ml (Bisa digunakan sampai 35 hari)\n\nCara penggunaan semprotan:\nBuang Nafas terlebih dahulu lalu semprotkan HYDRO di mulut sambil menghirup udara lewat mulut agar sampai ke bagian tenggorokkan.\nFungsi dari semprotan ini untuk pencegahan : 2 x 6 spray ( pagi/siang - malam ) untuk pengobatan : 6 x 6 spray ( pagi - siang - malam setiap 2 jam sekali)\n\nKomposisi :\nAqua, Hydrogen Peroxide, PEG40 Hydrogenated Castor Oil, Peppermint (Mentha Piperita Oil), Eucalyptus Globulus Leaf Oil.",
    ),
    ProductData(
      nama: "Bioaqua BlackMask",
      harga: 10500,
      urlImage:
          "https://ecs7.tokopedia.net/img/cache/900/product-1/2018/2/28/0/0_c90cdb6c-c9de-4473-a478-bd4290128543_700_700.jpg",
      stok: 16,
      rating: 5,
      deskripsi:
          "BIOAQUA blackhead remover mask ORIGINAL\n* ada segel\n* ada barcode\n* ada expire date\nNetto : 60 gr\n\nCara penggunaan:\n- Oleskan ke wajah dan ratakan perlahan ke seluruh bagian wajah dan tunggu selama 20 - 30 menit\n- Setelah kering, kupaskan secara perlahan dari arah luar wajah ke dalam - Gunakan 1-2 kali seminggu setelah membersihkan wajah\n\nFungsi : Mengangkat sel kulit mati dan kotoran pori2. Menyempurnakan dan menutrisi kulit wajah, serta membuat kulit wajah anda lebih kencang dan bersinar.",
    ),
    ProductData(
      nama: "O.TWO.O Blush On",
      harga: 9000,
      urlImage:
          "https://ecs7.tokopedia.net/img/cache/900/product-1/2019/7/29/12968248/12968248_9cc5d785-3e50-49dd-8ce5-c00ab7e0f3ac_1280_1280",
      stok: 129,
      rating: 4,
      deskripsi:
          "Untuk blush on ini merupakan salah satu produk terbaik dari o.two.o. Beberapa beautyvlogger Indonesia seperti Rachel Goddard juga pernah me-review produk ini, dan memang benar kalau produk ini tidak kalah bagus dengan blush on dari brand ternama lain. Sangat mudah untuk di blend, dan tidak menggumpal di muka.",
    ),
    ProductData(
      nama: "Nano Spray",
      harga: 16500,
      urlImage:
          "https://ecs7.tokopedia.net/img/cache/900/VqbcmM/2020/9/25/c14da5c2-09b6-4172-9260-4db0fd59d6da.jpg",
      stok: 51,
      rating: 3,
      deskripsi:
          "MINI NANO SPRAY RECHARGABLE ini tidak akan menimbulkan efek samping apapun ( kecuali diisi dengan air yang kurang bersih) . NANO SPRAY bisa juga diisi ulang dengan skincare seperti toner / spray water yang besifat alami.\n\nWARNA : RANDOM (tidak bisa pilih)\nDi dalam kotak nano spray juga terdapat kabel USB\nNano spray perlu di cas tiga jam sebelum digunakan.\nKapasitas = 30 ml\n\nManfaat dari NANO SRAY :\n-mengencangkan kulit\nmengecilkan pori - pori wajah\n-melembabkan kulit\n-membantu mencegah penuaan dini\n-mencerahkan wajah & membantu menyembuhkan kulit sensitif.\HAYO NI, setelah ngebaca manfaatnya, buat kamu yang kulitnya sensitif, cape krn kerja seharian boleh banget !!\nDan untuk kalian yang pengen awet muda, mana nihh? Belanja yu!! ",
    ),
    ProductData(
      nama: "The Simplicity Matte Lip Color",
      harga: 41300,
      urlImage:
          "https://ecs7.tokopedia.net/img/cache/900/VqbcmM/2021/1/6/6bf2e408-82f1-4e76-a2c4-34c3c64ac705.jpg",
      stok: 99,
      rating: 4,
      deskripsi:
          "The Simplicity Matte Lip adalah Lip cream matte bertekstur lembut dan memiliki pigmentasi tinggi dengan aplikator runcing untuk hasil akhir yang lebih maksimal.\n\nSelling Point:\n1. Transferproof\nLip cream dengan formula yang tidak mudah transfer sehingga tampilan bibir tetap cantik sepanjang hari.\n2. High Intense Color\nMemiliki pigmentasi tinggi yang mampu menutup garis-garis halus di bibir dalam sekali poles.\n3. All-day Light Wear\nTerasa ringan dan memberikan kenyamanan sepanjang hari.\n\nNetto : 4.5 gr\nWarna :\n01 Sensational\n02 Sweet\n03 I Love It\n04 High Five\n05 Nice One\n06 Marvelous",
    ),
    ProductData(
      nama: "Pittura Nail Polish",
      harga: 13900,
      urlImage:
          "https://ecs7.tokopedia.net/img/cache/900/VqbcmM/2020/12/25/0fda8d35-5d91-4268-bad4-61d92d614be1.jpg",
      stok: 73,
      rating: 5,
      deskripsi:
          "Miniso Official Product\nPittura Nail Polish,S09\n\nNet - 11ml\n\nMERK ASLI MINISO ^^",
    ),
  ],
  //Makanan dan Minuman
  [
    ProductData(
      nama: "Biji Kopi Arabica Mandheling",
      harga: 130000,
      urlImage:
          "https://ecs7.tokopedia.net/img/cache/900/VqbcmM/2020/11/19/511f568f-8706-467a-8422-76be83d59814.png",
      stok: 98,
      rating: 5,
      deskripsi:
          "Biji Kopi Full Arabica Roasted Single Origin Commercial Grade for Business tanpa basa basi Enak dan Murah!!\nBeans ini di develop untuk bisnis!! Very Reccomended!\n\nOrigin: Mandheling 100% Arabica Sumatra\nProcess: Semi Washed\nGrade: 2 (Grade Komersil)\nRoast Profile: Medium Dark for Espresso (Bukan goreng gosong yah!)\nRecommended for: Classic Espresso Based / Kopi Susu (Jamin ENAK!!)\nPackaging 1kg\nFlavour notes on Milk Products:\n- Bold Body\n- Cocoa Milk\n- Biscuit",
    ),
    ProductData(
      nama: "Robo Arborio Rice",
      harga: 99000,
      urlImage:
          "https://ecs7.tokopedia.net/img/cache/900/product-1/2020/7/29/4612208/4612208_467d5094-fb93-4a88-a80f-687bbe41fc19_2048_2048",
      stok: 132,
      rating: 4,
      deskripsi:
          "Arborio Rice merupakan jenis beras yang digunakan untuk memasak menu Risotto. Arborio rice mempunyai bentuk yang kecil, dan ketika dimasak memiliki tekstur yang creamy, padat dan kenyal.\n\nBerat bersih = 1 KG\nPenyimpanan = Suhu ruang dan sejuk.",
    ),
    ProductData(
      nama: "Bigreen Leaf Brand",
      harga: 36500,
      urlImage:
          "https://ecs7.tokopedia.net/img/cache/900/attachment/2020/2/11/158135559608617/158135559608617_389fe8da-b6be-4aa9-bc94-582d83ccb450.png",
      stok: 316,
      rating: 5,
      deskripsi:
          "BIGREEN LEAF BRAND / SPECIAL TEA\n\nTeh dalam kemasan yang bermanfaat :\n\n1. Menurunkan berat badan\n2. Mengatasi Sembelit / susah BAB\n\nKemasan box isi 16 kantong teh celup\n\nAnjuran pemakaian :\n\nMinumlah 1-2 kali sehari , 1/2 jam setelah makan atau malam menjelang tidur.\nSeduh 1 kantong teh dengan air mendidih dan diamkan selama 3 menit.",
    ),
    ProductData(
      nama: "Gery Chocolatos Grande",
      harga: 20500,
      urlImage:
          "https://ecs7.tokopedia.net/img/cache/900/VqbcmM/2020/10/21/4871567a-a1bf-41f2-b48e-fab4e27bdea6.jpg",
      stok: 226,
      rating: 3,
      deskripsi:
          "Gery Chocolatos Grande -16 g (WCG8R) By Garudafood\n\nJUAL Per Showbox.\n1 Showbox isi 20 Pcs",
    ),
    ProductData(
      nama: "Teri Kacang Balado",
      harga: 26000,
      urlImage:
          "https://ecs7.tokopedia.net/img/cache/900/product-1/2019/3/13/2764843/2764843_ee9103b9-f5e9-4f94-b3c5-4dd6b7cfc1c5_1000_1000.jpg",
      stok: 63,
      rating: 4,
      deskripsi:
          "RASA MANIS PEDAS *relatif sedikit asin (TERI KUALITAS GRADE AAA TIDAK BEGITU ASIN).\n\nTeri kacang Balado\nBERAT BERSIH 120 GR - berat pengiriman 150gr. (packing dll)\n\nPILIHAN PACKING\nPACKING PLASTIK VAKUM BENING - Rp 26.000.-\nPACKING PLASTIK VAKUM BENING + POUCH MERAH - Rp. 29.500.\nDiolah dari teri Medan / teri nasi pilihan. ",
    ),
    ProductData(
      nama: "Bumbu Ireng Khas Madura",
      harga: 25000,
      urlImage:
          "https://ecs7.tokopedia.net/img/cache/900/product-1/2020/8/28/1134400445/1134400445_683fcb29-cdbd-490a-b8cd-db5c50c77a57_700_700.jpg",
      stok: 95,
      rating: 4,
      deskripsi:
          "Bumbu Ireng Khas Madura Ning Niniek\n\nNETTO 130 GRAM\nSiapa yang disini suka makan Bebek Goreng Madura dengan Bumbu Hitam alias Bumbu Ireng nya?\n\nPasti kan ketagihan banget sama bumbu irengnya, rasa gurihnya bikin napsu makan nambah berkali-kali. Dicocol dengan nasi hangatpun enak.\n\nNAH! Ning Niniek si ahlinya sambal, kali ini meracik Bumbu Ireng lho. Asli rasanya enaaaaaaak banget! Meskipun dalam kemasan tidak menghilangkan rasa asli bumbu ireng bebek madura lho. Wajib coba",
    ),
    ProductData(
      nama: "Sempio",
      harga: 37500,
      urlImage:
          "https://ecs7.tokopedia.net/img/cache/900/VqbcmM/2020/11/17/e021996d-6bc9-4a52-bdf3-72ef8c21e90e.jpg",
      stok: 119,
      rating: 5,
      deskripsi:
          "Sempio - Mi Tipis / Misua / Mee Sua / Misoa\n\nKategori = Produk kering - Disarankan memesan bubblewrap tambahan agar pengiriman aman\n\nMisua / Mee sua memiliki tekstur yang kurus dan merupakan yang aman dan sehat untuk dikonsumsi. ",
    ),
    ProductData(
      nama: "Susu Carnation Kental Manis",
      harga: 8900,
      urlImage:
          "https://ecs7.tokopedia.net/img/cache/900/VqbcmM/2020/9/11/c7efcdb5-6218-4b4a-8b3a-dc45ccb07f13.jpg",
      stok: 6,
      rating: 4,
      deskripsi:
          "Susu Kental Manis Nestlé CARNATION 370gr. Terbaik untuk tukang kue dan martabak. Wangi susu yang enak dan tidak terlalu manis.",
    ),
    ProductData(
      nama: "Jamu Hioko Shitake",
      harga: 25000,
      urlImage:
          "https://ecs7.tokopedia.net/img/cache/900/attachment/2020/8/15/-1/-1_d8f207c1-8906-4db0-ab7e-f4a4d465da94.jpg",
      stok: 44,
      rating: 3,
      deskripsi: "Ukuran / size :4-6.\nEXP 2022",
    ),
    ProductData(
      nama: "WRP Active Coco",
      harga: 18900,
      urlImage:
          "https://ecs7.tokopedia.net/img/cache/900/VqbcmM/2021/1/26/bd0c0f40-cfcf-479e-899f-6fc2605c0296.jpg",
      stok: 150,
      rating: 4,
      deskripsi:
          "WRP Coco Splash mengandung air kelapa serta vitamin C dan anti oksidan yang dapat membantu melembabkan kulit dan juga mengandung L-Carnitine sebagai fat burner yang membantu meningkatkan pembakaran lemak menjadi energi.\n\nYakin masih cari minuman lain untuk menemani aktivitas kamu?\n\nExpired Date: Januari 2022\n\nPenyajian & penggunaan:\nWRP Coco Splash bisa dikonsumsi siapa saja, kapan saja dan dimana saja.\n\nMinuman Kelapa - Sari Kelapa - Air Kelapa Alami - Coconut Drink - Kelapa - Minuman Vitamin C - Coconut Water",
    ),
    ProductData(
      nama: "Roti Sobek Japanese",
      harga: 50000,
      urlImage:
          "https://ecs7.tokopedia.net/img/cache/900/VqbcmM/2020/9/8/ce3ef60a-cb87-48c2-8414-a3ab0b744a52.jpg",
      stok: 61,
      rating: 4,
      deskripsi:
          "Japanese Milk Bun Unicorn - Roti Sobek Unicorn yang lembut, wangi, dan memiliki warna pastel yang sangat menarik.\n\nTanpa Telur dan Less Sugar! Cocok untuk yang tidak suka manis dan jaga kesehatan.\n\nUkuran 18 x 18 cm. Lengkap dengan kraft box yang unik dan menarik. Cocok untuk sebagai hadiah atau souvenir.\n\n1 paket terdiri dari 1 roti Unicorn + 2 dipping / butter spread. (Tolong pilih 2 rasa dari list dibawah ini dan tuliskan ke note). Tanpa note akan dikirimkan dengan rasa favorite: hazelnut dan mocca.\n\n✔️ choco\n✔️ peanut butter\n✔️ mocca\n✔️ taro\n✔️ lemon butter\n✔️ cheezy cheese\n✔️ salted caramel",
    ),
  ],
  //olahraga
  [
    ProductData(
      nama: "Raket Voltric 10 DG",
      harga: 230000,
      urlImage:
          "https://ecs7.tokopedia.net/img/cache/900/attachment/2019/5/6/155713098659725/155713098659725_7e4dbfbf-e5a4-41c1-b8f3-be6d4cce66b5.png",
      stok: 69,
      rating: 4,
      deskripsi:
          "Yonex Voltric 10DG SpecificationsFrame MaterialSuper-high elasticity carbon, high elasticity carbon fiber, Tungsten\nShaft MaterialHigh Elasticity Carbon\nFlexStiff\nWeight88g +/- 2 (3U-G5)\nLength675mm +/- 2\nMax Tension35 lbs\nBalance Point305mm +/- 3 (Head Heavy)\nGrommets76\nColorRed\nMade inTaiwan",
    ),
    ProductData(
      nama: "Bola Kaki Sepak Adidas Starlancer Club",
      harga: 139000,
      urlImage:
          "https://ecs7.tokopedia.net/img/cache/900/VqbcmM/2020/11/23/a1d0aa0a-9551-4099-b696-b9797b2b72ab.jpg",
      stok: 78,
      rating: 5,
      deskripsi:
          "Brand New With Plastic\n\n-Menonjol dengan grafis bergaya sapuan kuas\n-Dijahit dengan mesin untuk ketahanan yang kokoh.\n-Kandung kemih butil berarti Anda akan menghabiskan lebih sedikit waktu untuk memompanya dan lebih banyak waktu untuk bermain bola.\n-100% penutup TPU\n-Standart sepak bola klub\n-Kandung kemih butil untuk retensi udara terbaik",
    ),
    ProductData(
      nama: "Bola Basket Molten GG7X Grade",
      harga: 180000,
      urlImage:
          "https://ecs7.tokopedia.net/img/cache/900/VqbcmM/2020/8/11/0026f7e3-c951-4406-a4c5-f579f302c993.jpg",
      stok: 58,
      rating: 4,
      deskripsi:
          "Bola basket MOLTEN GG7X\nBola terbuat dari KULIT PU. Bahan empuk dan tebal.dijamin tidak mudah Terlupas kulitnya dan lengket di tangan\nIMPORT THAILAND BUKAN LOKAL !!\nMade in thailand.\nDapat di pakai baik indoor maupun outdoor. Biasa dgunakan untuk sekolah atau pertandingan olahraga.\n99% ORIGINAL!!! ",
    ),
    ProductData(
      nama: "Bet Pingpong Donic Schildkrot Sensation",
      harga: 299000,
      urlImage:
          "https://ecs7.tokopedia.net/img/cache/900/product-1/2020/2/1/616829306/616829306_8665c73d-f2af-418f-9023-ddc6b0f21be3_2048_2048.jpg",
      stok: 84,
      rating: 5,
      deskripsi:
          "Sensation line recommended by top players! Untuk pemain All Round.\n\nWood: Tactic (5T)\nHandle: ASG-Handle, concave\nRubber: Avantgarde\nSponge: 1,8mm\n\nSpeed 70\nSpin 70\nControl 70",
    ),
    ProductData(
      nama: "Peluit Molten",
      harga: 110000,
      urlImage:
          "https://ecs7.tokopedia.net/img/cache/900/product-1/2017/5/11/88832/88832_7f4ccb53-d08e-417a-98d1-1362b60b4e07_480_480.jpg",
      stok: 884,
      rating: 4,
      deskripsi:
          "BERI KETERAGAN WARNA KETIKA ORDER , KALO GAK ADA KETERANGAN KAMI KIRIM RANDOM!\n\nDOLFIN F\nReferee Whistle for FOOTBALL, SOCCER\nBest for Smaller & Quieter Audience, Standard Loudness (Easy to Blow)\nTuned for Open Air Stadium\nPowerful sound which penetrates through a stadium in the most effective way possible\n4.15kHz&3.67kHz, 4 octaves",
    ),
    ProductData(
      nama: "Sepeda Lipat Gunung Bicystar",
      harga: 2990000,
      urlImage:
          "https://ecs7.tokopedia.net/img/cache/900/VqbcmM/2020/10/9/0bd61820-abfe-4602-9bc0-d2af49c029c8.png",
      stok: 90,
      rating: 5,
      deskripsi:
          "Jenis.Sepeda gunung lipat dewasa\n*Bahan rangka/Frame.Highcarbon steel\n*Suspensi type.Pegas\n*Sistem Rem. Double Rem Cakram\n*Kursi.MTB\n*Front Derailler.\n*Ukuran Ban.26 Inch\n*Material Pelek.Alluminium Alloy (Double)\n*Gigi Percepatan.21 Speed\n*Berat.18Kg\n*Merk BICYSTAR\n*Warna Merah, Kuning, Putih, Hitam\n*Barang diterima kondisi uda dirakit 85%",
    ),
    ProductData(
      nama: "Burbel Dumbel 10Kg",
      harga: 100000,
      urlImage:
          "https://ecs7.tokopedia.net/img/cache/700/product-1/2020/7/24/3600122/3600122_490cb5d1-3ca1-4dc0-b6a1-09f6ee249146_700_700",
      stok: 101,
      rating: 3,
      deskripsi:
          "Barbel Dumbell 10kg Plastik\nJuga Ready 1kg, 2kg, 3kg, 4kg, 5kg, 6kg, 7kg, 8kg, 9kg, 10kg\nJangan Kuatir Barang Always Ready Banyak Silahkan Langsung Diorder Gan..!!! :)",
    ),
    ProductData(
      nama: "Net Voli Molten Original",
      harga: 165000,
      urlImage:
          "https://ecs7.tokopedia.net/img/cache/900/product-1/2020/11/5/7729823/7729823_cfa68c0f-58f8-43ca-b178-66300b0d630b.jpg",
      stok: 21,
      rating: 5,
      deskripsi:
          "-NET VOLI\n-MEREK MOLTEN\n-UKURAN 9x1 meter\n-UKURAN TALI 2MM, LUBANG 10CM",
    ),
  ],
];
