# turkiye_il_ilce_mahalle

Türkiye İl İlçe Köy Mahalle veritabanına bağlı olarak adres seçme flutter paketi

Flutter packetini kullanmak için
- [pub.dev sitesinden alabilirsiniz](https://pub.dev/packages/turkiye_il_ilce_mahalle)

## How to use
Adres getir paketini aşağıdaki şekilde kullanabilirsiniz.

```dart
class _OrnekState extends State<Ornek> {
  String _il;
  String _ilce;
  String _koy;
  String _mahalle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Adres Seçimi"),
      ),
      body: Container(
        child: AdresGetir(
          il: (il) {
            _il = il;
            print("il seçimi tamamlandı: $il");
          },
          ilce: (ilce) {
            _ilce = ilce;
            print("il seçimi tamamlandı: $ilce");
          },
          koy: (koy) {
            _koy = koy;
            print("il seçimi tamamlandı: $koy");
          },
          mahalle: (mahalle) {
            _mahalle = mahalle;
            print("il seçimi tamamlandı: $mahalle");
          },
        ),
      ),
    );
  }
}
 ```

Container widget şeklinde projenizin herhangi bir yerinde kullanabilirsiniz
