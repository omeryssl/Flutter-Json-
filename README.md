Kullanılan Paketler:

http: API ile HTTP istekleri yapmak için kullanılır. Open Library gibi harici servislere istek göndermek ve veri alışverişi yapmak için gereklidir.

flutter_bloc: Uygulama durum yönetimi için kullanılır. Özellikle arama sonuçlarının yönetimi ve kullanıcı etkileşimlerine göre arayüz güncellemeleri yapmak için kullanılır.

flutter_svg: SVG dosyalarını görüntülemek için kullanılır. Kitap kapaklarının SVG formatında olması durumunda bu paket kullanılarak gösterilir.

cached_network_image: İndirilen kitap kapaklarını önbelleğe almak için kullanılır. Böylece aynı kapaklar tekrar tekrar indirilmez ve uygulamanın performansı artırılır.

Bu paketler, uygulamanın kullanıcı dostu arayüzünü yönetmek, veri alışverişini sağlamak ve performansını optimize etmek için kullanılmıştır.



Uygulama İşleyişi:

Kitap Arama: Kullanıcılar arama kutusuna bir kitap adı girer. Uygulama, Open Library API'sını kullanarak bu kriterlere uygun kitapları arar.

Sonuçların Listelenmesi: API'den gelen veriler kullanıcı arayüzünde listelenir. Her bir kitap için başlık, yazar, yayın tarihi gibi temel bilgiler gösterilir.

Detaylara Erişim: Kullanıcılar her bir kitabın listelenen bilgilerine tıklayarak daha fazla detaya erişebilir. Detaylar arasında kitabın açıklaması, kapak resmi, yayıncı bilgileri gibi detaylı bilgiler yer alır.

Kitap Seçimi: Kullanıcılar istedikleri bir kitabı seçebilir ve bu kitaba ait detayları inceleyebilir.

Sayfalama ve Sınırsız Sonuçlar: Arama sonuçları sayfalama ile yönetilir, bu sayede kullanıcılar çok sayıda sonuç arasında gezinebilir. Uygulama sınırsız kitap sayısını destekler, bu nedenle büyük veri setlerini yönetebilir.
