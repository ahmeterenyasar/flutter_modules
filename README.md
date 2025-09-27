# 🚀 Flutter Öğrenim Notları

Flutter öğrenirken edindiğim bilgileri modüler klasörler altında düzenliyorum. Her bölüm `details` etiketiyle açılır/kapanır şekilde listelenmiştir.

---

<details>
<summary>📁 Flutter 101</summary>

---

<details>
<summary>📄 Text ve Style</summary>

**Text & TextStyle**

- **Text**: Ekrana yazı basan temel widget.
- **TextStyle**: Yazıyla ilgili özelliklerin (fontSize, color, fontWeight, letterSpacing vb.) ayarlanması için kullanılır.

**Neden `Theme.of(context)` Kullanılır?**

- Her `Text` widget'ına ayrı ayrı `TextStyle` vermek yerine uygulama için bir `Theme` tanımlanır.
- Tema üzerinden (`Theme.of(context).textTheme`) ortak stiller çağrılır, böylece tek bir yerden değişiklik yaptığında uygulama genelindeki text stilleri güncellenir.

</details>

---

<details>
<summary>📄 final vs const</summary>

**Final ve Const arasındaki fark**

- **`final`**: Bir değişkene değer atamasının **bir kez** yapılabileceğini ve bu atamanın **runtime**'da gerçekleşeceğini belirtir.
- **`const`**: Değerin **compile time** belli olduğu sabitler için kullanılır.

**Örnek:**
```dart
// Zaman runtime'da atanır
final DateTime currentTime = DateTime.now();

// Sabit değişken compile time'da belirlenir
const double gravity = 9.81;
```

**Ne Zaman Hangisini Kullanmalı:**
- API'den gelen veriler, kullanıcı girdileri → `final`
- Matematiksel sabitler, renk kodları → `const`

</details>

---

<details>
<summary>📄 Layout Widget'ları</summary>

**SizedBox**
- Belirli bir boyutta kutu oluşturmak veya boşluk bırakmak için kullanılır.

**Container**
- Kutu widget'ıdır. Görsel düzenleme (padding, margin, color, border, width, height vb.) için kullanılır.
- İçerisine **sadece bir tane** `child` widget alır.

**Column**
- Layout widget'ıdır; içindeki `children[]` listesindeki widget'ları **dikey** olarak sıralar.
- `Column`'un kendisinde padding/margin yoktur; bu amaçla `Container` veya `Padding` widget'ları kullanılır.

**Kullanım Mantığı**
- Eğer bütün grubu tek bir kutu gibi görmek istiyorsan → `Container` dışta, `Column` içte.
- Eğer her öğeyi ayrı ayrı kutulamak istiyorsan → `Column` dışta, `Container` içte.

**EdgeInsets**
- Padding (iç boşluk) ve Margin (dış boşluk) değerlerini ayarlamak için kullanılır.
- Çeşitleri:
  - `EdgeInsets.all(16)` → Her yönden 16 piksel
  - `EdgeInsets.symmetric(horizontal: 20, vertical: 10)` → Yatayda 20, dikeyde 10
  - `EdgeInsets.only(top: 8, left: 16)` → Sadece üstten 8, soldan 16

</details>

---

<details>
<summary>📄 Scaffold</summary>

Bir sayfanın iskeleti `Scaffold` ile oluşturulur. Beginner seviyesinde bilmen gereken ana parçalar:

**appBar** → Üst bar, genelde `title` ve `actions` butonlarını içerir.

**drawer** → Soldan açılan kaydırmalı menü.

**body** → Sayfanın ana içerik alanı.

**floatingActionButton** → Sağ alt köşede duran dairesel buton; genelde ana/önemli aksiyonlar için kullanılır.

**bottomNavigationBar** → Sayfanın alt kısmında sabit duran menü çubuğu; genelde 2–5 sayfa arasında geçişler için kullanılır.

</details>

---

<details>
<summary>📄 Button Types</summary>

**FloatingActionButton**
- Dairesel, genelde sağ alt köşede yer alır.
- Uygulamanın en önemli aksiyonları için kullanılır (ör. yeni öğe ekle).
- Material Design'ın önemli bir parçasıdır.

**ElevatedButton**
- Dolgu (filled) ve gölgeli bir butondur.
- Ana aksiyonlar için uygundur (ör. Kaydet, Gönder).

**IconButton**
- Sadece ikon içeren küçük butonlardır.
- AppBar veya kart köşelerinde sık kullanılır.
- Minimum touch target size'a sahiptir.

**OutlinedButton**
- Çerçeveli ve içi boş görünümlü butondur.
- İkincil eylemler için uygundur (ör. Vazgeç, İptal).

**InkWell**
- Herhangi bir widget'ı tıklanabilir hale getirir.
- Tıklama sırasında ripple (mürekkep) efektini sağlar.
- Kartlar, resimler veya custom widget'lar için idealdir.

</details>

</details>

---

<details>
<summary>📁 Flutter 202</summary>

<details>
<summary>📄 State Management</summary>

*İçerik yakında eklenecek...*

</details>

</details>

---
