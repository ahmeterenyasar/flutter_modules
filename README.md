# 🚀 Flutter Öğrenim Notları

Flutter öğrenirken edindiğim bilgileri modüler klasörler altında düzenliyorum. Her bölüm `details` etiketiyle aşağı/açılır şekilde listelenmiştir.

---

<details>
  <summary>📁 Flutter 101</summary>

### 📘 Bu klasörde öğrendiğim konular:

* Widget lifecycle
* Hot reload vs hot restart
* MaterialApp vs CupertinoApp
* Stateless vs Stateful

### 📝 Notlar:

* `MaterialApp` Android için, `CupertinoApp` iOS görünümünde uygulamalar için uygundur.

---

  <details>
    <summary>📄 Text ve Style</summary>

```
**Text & TextStyle**

- `Text`: Ekrana yazı basan temel widget.
- `TextStyle`: Yazıyla ilgili attribute'ların (fontSize, color, fontWeight, letterSpacing vb.) ayarlanması için kullanılır.

**Neden `Theme.of(context)` Kullanılır?**

- Her `Text` widget'ına ayrı ayrı `TextStyle` vermek yerine uygulama için bir `Theme` tanımlanır.
- Tema üzerinden (`Theme.of(context).textTheme`) ortak stiller çağrılır; böylece tek bir yerden değişiklik yaptığında uygulama genelindeki text stilleri güncellenir.
```

  </details>

---

  <details>
    <summary>📄 Değişkenler (final vs const)</summary>

````
**Final ve Const arasındaki fark**

- `final`: Bir değişkene değer atamasının **bir kez** yapılabileceğini ve bu atamanın **runtime**'da (çalışma zamanında) gerçekleşeceğini belirtir.
- `const`: Değerin **compile time** (derleme zamanında) belli olduğu sabitler için kullanılır.

**Örnek:**
```dart
final DateTime currentTime = DateTime.now();
// Zaman runtime’da atanır

const double gravity = 9.81;
// Sabit değişken compile time’da belirlenir
```
````

  </details>

---

  <details>
    <summary>📄 Layout Widget'ları</summary>

```
**SizedBox**
- Belirli bir boyutta kutu oluşturmak veya boşluk bırakmak için kullanılır.

**Container**
- Kutu widget'ıdır. Görsel düzenleme (padding, margin, color, border, width, height vb.) için kullanılır.
- İçerisine **sadece bir tane** `child` widget alır.

**Column**
- Layout widget'tır; içindeki `children[]` listesindeki widget'ları **dikey** olarak sıralar.
- `Column`'un kendisinde padding/margin yoktur; bu amaçla `Container` veya `Padding` widget'ları kullanılır.

**Kullanım Mantığı**
- Eğer bütün grubu tek bir kutu gibi görmek istiyorsan → `Container` dışta, `Column` içte.
- Eğer her öğeyi ayrı ayrı kutulamak istiyorsan → `Column` dışta, `Container` içte.

**EdgeInsets**
- Padding (iç boşluk) ve Margin (dış boşluk) değerlerini ayarlamak için kullanılır (`EdgeInsets.all()`, `EdgeInsets.symmetric()`, `EdgeInsets.only()` vb.).
```

  </details>

---

  <details>
    <summary>📄 Scaffold</summary>

````
Bir sayfanın iskeleti `Scaffold` ile oluşturulur. Beginner seviyesinde bilmen gereken ana parçalar:

- **appBar** → Üst bar, genelde `title` ve `actions` butonlarını içerir.
  ```dart
  appBar: AppBar(
    title: Text("Ana Sayfa"),
    actions: [IconButton(icon: Icon(Icons.search), onPressed: () {})],
  )
  ```

- **drawer** → Soldan açılan kaydırmalı menü (hamburger menü).
  ```dart
  drawer: Drawer(
    child: ListView(
      children: [DrawerHeader(child: Text("Menü")), ListTile(title: Text("Profil"))],
    ),
  )
  ```

- **body** → Sayfanın ana içerik alanı. Genelde `Column`, `Row`, `ListView`, `Center` gibi widget'lar içinde düzenlenir.

- **floatingActionButton** → Sağ alt köşede duran dairesel buton; genelde ana/önemli aksiyonlar için kullanılır.
  ```dart
  floatingActionButton: FloatingActionButton(
    onPressed: () {},
    child: Icon(Icons.add),
  )
  ```

- **bottomNavigationBar** → Sayfanın alt kısmında sabit duran menü çubuğu; genelde 2–5 sayfa arasında geçişler için kullanılır.
````

  </details>

---

  <details>
    <summary>📄 Button Types</summary>

```
**FloatingActionButton**
- Dairesel, genelde sağ alt köşede yer alır. Uygulamanın en önemli aksiyonları için kullanılır (ör. yeni öğe ekle).

**ElevatedButton**
- Dolgu (filled) ve gölgeli bir butondur. Ana aksiyonlar için uygundur (ör. Kaydet, Gönder).

**IconButton**
- Sadece ikon içeren küçük butonlardır. AppBar veya kart köşelerinde sık kullanılır.

**OutlinedButton**
- Çerçeveli ve içi boş görünümlü butondur. İkincil eylemler için uygundur (ör. Vazgeç).

**InkWell**
- Herhangi bir widget'ı tıklanabilir hale getirir ve tıklama sırasında ripple (mürekkep) efektini sağlar. Kartlar veya resimler için idealdir.
```

  </details>

---

</details>

---

<details>
  <summary>📁 Flutter 202</summary>


</details>

---
