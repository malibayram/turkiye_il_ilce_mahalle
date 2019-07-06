# turkiye_il_ilce_mahalle

Turkiye Il Ilce Koy Mahalle veritabanina bagli olarak adres secme flutter paketi

Flutter paketini kullanmak icin
- [pub.dev sitesinden alabilirsiniz](https://pub.dev/packages/turkiye_il_ilce_mahalle)

## How to use
Adres getir paketini asagidaki sekilde kullanabilirsiniz.

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
        title: Text("Adres Secimi"),
      ),
      body: Container(
        child: AdresGetir(
          il: (il) {
            _il = il;
            print("il secimi tamamlandi: $il");
          },
          ilce: (ilce) {
            _ilce = ilce;
            print("il secimi tamamlandi: $ilce");
          },
          koy: (koy) {
            _koy = koy;
            print("il secimi tamamlandi: $koy");
          },
          mahalle: (mahalle) {
            _mahalle = mahalle;
            print("il secimi tamamlandi: $mahalle");
          },
        ),
      ),
    );
  }
}
 ```

AdresGetir widget seklinde projenizin herhangi bir yerinde kullanabilirsiniz
