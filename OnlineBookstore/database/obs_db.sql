-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 03 Haz 2023, 16:08:07
-- Sunucu sürümü: 10.4.21-MariaDB
-- PHP Sürümü: 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `obs_db`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `admin`
--

CREATE TABLE `admin` (
  `name` varchar(20) CHARACTER SET utf8mb4 NOT NULL,
  `pass` varchar(40) CHARACTER SET utf8mb4 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Tablo döküm verisi `admin`
--

INSERT INTO `admin` (`name`, `pass`) VALUES
('admin', 'f865b53623b121fd34ee5426c792e5c33af8c227');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `books`
--

CREATE TABLE `books` (
  `book_isbn` varchar(20) CHARACTER SET utf8mb4 NOT NULL,
  `book_title` varchar(60) CHARACTER SET utf8mb4 DEFAULT NULL,
  `book_author` varchar(60) CHARACTER SET utf8mb4 DEFAULT NULL,
  `book_image` varchar(70) CHARACTER SET utf8mb4 DEFAULT NULL,
  `book_descr` text CHARACTER SET utf8mb4 DEFAULT NULL,
  `book_price` decimal(6,2) NOT NULL,
  `categoryid` int(10) UNSIGNED NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Tablo döküm verisi `books`
--

INSERT INTO `books` (`book_isbn`, `book_title`, `book_author`, `book_image`, `book_descr`, `book_price`, `categoryid`, `created_at`) VALUES
('9786050321739', 'Krallığı Öldürmek', 'Alexandra Christo', 'kralligi-oldurmek.jpg', 'Prenses Lira, siren kraliyetinin taht vârisi. Aynı zamanda da en ölüm saçan siren. On yedi prensin kalbini söküp almış bir siren olmasından dolayı bütün denizler önünde saygıyla eğilir. Ta ki kaderin cilvesi onu kendi dünyalarından birini öldürmeye mecbur bırakıncaya kadar…<br><br>\r\nDenizler Kraliçesi kızını cezalandırmak için onu en nefret ettikleri yaratığa, yani insana dönüştürür. Sihirli şarkısı da kendisinden alınan Lira’nın, Denizler Kraliçesi’ne Prens Elian’ın kalbini götürmek için kış gündönümüne kadar vakti vardır, yoksa sonsuza dek insan olarak kalacaktır.<br><br>\r\nDünyanın en güçlü krallığının vârisi olsa da Prens Elian’ın evim dediği tek yer okyanustur. Siren avlamak onun için nahoş bir hobiden ziyade bir görev aşkıdır.<br><br>\r\nBoğulmak üzere olan bir kızı okyanustan kurtardığında onun hiç de göründüğü gibi biri olmadığını anlayacak mıdır? Kız, tüm siren türünü sonsuza dek yok edecek planın en önemli kısmını çözmesinde ona yardım edeceğine dair söz verir. Fakat Elian ona güvenebilecek midir?<br><br>\r\nVe Prens Elian insanlığın en büyük düşmanını yok etmek için kaç anlaşma yapmak, bu uğurda neleri feda etmek zorunda kalacaktır?', '54.50', 6, '2023-05-18 00:45:23'),
('9786051736938', 'Bülbülü Öldürmek', 'Harper Lee', 'bulbulu_oldurmek.jpg', '“İstediğin kadar saksağan vur vurabilirsen, ama unutma, bülbülü öldürmek günahtır.”<br><br>\r\n\r\nTüm zamanların en sevilen hikâyelerinden biri olan, kırktan fazla dile çevrilen, Oscar ödüllü bir sinema filmi için temel oluşturan ve yirminci yüzyılın en iyi romanlardan biri seçilen Pulitzer ödüllü Bülbülü Öldürmek, Amerika’nın acımasız bir önyargı ile zehirlenmiş güneyinde geçen, sürükleyici, yürek burkan ve dikkat çekici bir büyüme hikâyesi. Büyüleyici güzellikler ve vahşi eşitsizlikler dünyasında haksız yere korkunç bir suçla suçlanan bir “zenci”yi savunmak için her şeyi riske atan bir adamın hikâyesi çocuk kahramanın gözünden anlatılıyor.<br><br>\r\n\r\nŞefkat dolu, dramatik ve düşündürücü Bülbülü Öldürmek okurları insan doğasının köklerine; masumiyet ve deneyime, nezaket ve zulme, sevgi ve nefrete, mizah ve pathosa götürüyor. Harper Lee\'nin her zaman basit bir aşk hikâyesi olarak gördüğü romanı bugün Amerikan edebiyatının bir şaheseri olarak kabul ediliyor.<br><br>\r\n\r\n“Lee estetiğin arkasına sığınmayı reddediyor. Kalemi öyle güzel, güçlü, ölçülü ki zor konuları doğrudan ele almak zorunda olmamasına rağmen Bülbülü Öldürmek’te tam olarak bunu yapmış.” <br><br>\r\n\r\n Chimamanda Ngozi Adichie<br><br>\r\n\r\n \r\n“Yaşama sevinciyle dolu, dokunaklı ve nadiren rastlayacağınız türden bir roman.”  <br><br>\r\n\r\nTruman Capote', '92.55', 1, '2023-05-18 01:36:04'),
('9786053606116', 'Satranç', 'Stefan Zweig', 'satranc.png', 'Satranç kitabında New York’tan Buenos Aires’e yolculuk yapan bir deniz vapurunda yaşananlar anlatılmaktadır. Gemideki yolculardan biri satranç şampiyonu Mirko Czentovic’dir ve yolcular bu şampiyonu partiye davet etmiştir. Mirko Czentovic, bu gemide ilk kez kendisini zorlayabilecek bir rakiple yani Dr. B. ile karşılaşmıştır. Dr. B. , Gestapo tarafından sorgulanmış ve hiçliğe mahkûm edilerek işkence görmüş birisidir. Sorgulandığı günlerden birinde bir montun cebinde satranç kitabı bulmuş ve çalmıştır. Tüm kitabı okumuş, kitaptaki oyunları hayal ederek oynamış ve bu sayede yaşama tutunmuştur. Zamanla tüm oyunları ezberleyen Dr. B. , kafasında yeni partiler icat etmeye başlamış ve sinir krizi geçirene kadar kendine karşı satranç oynamaya başlamıştır. Hapisten çıktıktan sonra bindiği deniz vapurunda Czentovic ile yaptığı müsabakada da kriz geçirmektedir.<br><br>\r\nSatranç kitabı Stefan Zweig’ın edebiyata vedası olarak kabul edilmektedir. Otobiyografik özelliklere sahip olan eserde psikolojik çıkmazlar ve Nazi barbarlığı gibi birçok konu işlenmektedir. “İnsan Zweig’ı övmeye nereden başlasa bilemiyor.” diyen İskoçyalı yazar Ali Smith, “Satranç” kitabı için \"Ürkünç derecede heyecan verici, mest edici bir eser.\" yorumunu yapmıştır.', '12.00', 3, '2023-05-18 00:14:07'),
('9786053607038', 'İnsan Neyle Yaşar?', 'Lev Nikolayeviç Tolstoy', 'insan-neyle-yasar.png', 'Lev Nikolayeviç Tolstoy (1828-1910): Anna Karenina, Savaş ve Barış, Kreutzer Sonat ve Diriliş’in büyük yazarı, yaşamının son otuz yılında kendini insan, aile, din, devlet, toplum, özgürlük, boyun eğme, başkaldırma, sanat ve estetik konularında kuramsal çalışmalara verdi. Bu dönemde yazdığı öykülerde yıllarca üzerinde düşündüğü insanlık sorunlarını edebi bir kurgu içinde ele aldı. Tolstoy, insan sevgisi ve inanç konularını ustalığının bütün inceliğiyle işlerken, \"İnsan Neyle Yaşar?\" ile gerçek hayatı yansıtan tabloların içinde yeni bir ahlak anlayışını ortaya koydu.', '15.60', 3, '2023-05-18 00:17:26'),
('9786053609322', 'Dönüşüm', 'Franz Kafka', 'donusum.png', 'Franz Kafka’nın en bilinen eserlerinden olan Dönüşüm öyküsünün ana karakteri Gregor Samsa’dır. İşini sevmese de aile borçlarından dolayı çalışmak zorunda olan Samsa, gezici bir pazarlamacıdır. Bir sabah uyandığında yatağında kendisini bir böceğe dönüşmüş olarak bulmuştur.<br><br>\r\nBir böceğe dönüştüğü için yataktan bile çıkamayan Gregor Samsa’nın ailesi onun işe gitmediğini fark edince odasının önüne gelmiştir. Bu şekilde aile Samsa’nın böceğe dönüştüğünü öğrenmiştir. Gregor Samsa’nın işe gitmediğini öğrenen firma temsilcisi de Samsa’nın ailesiyle birlikte yaşadığı eve gelmiştir.<br><br>\r\nGregor Samsa’nın böceğe dönüşmesinden sonra onunla ilgilenen, yemek getiren tek kişi kız kardeşi Grete’dir. Bir süre ailesi Gregor Samsa’nın bu durumundan iyice rahatsız olan ailesi ondan kurtulmak istemiştir.', '13.20', 3, '2023-05-18 00:20:52'),
('9786053752004', 'Frankenstein', 'Mary Sheley', 'frankenstein.jpg', 'Ah! Hiçbir ölümlü o görüntünün dehşetine dayanamazdı. Hayat verilmiş bir mumya dahi o ucube kadar iğrenç olamazdı... Hayal kırıklıklarının en acısını duyuyordum.<br><br>\r\nMary Wollstonecreaft Shelley 1797 Ağustos’unda Londra’da doğan Mary Shelley, filozof William Godwin ile eşi radikal feminist yazar Mary Wollstonecraft’ın tek kızıdır. Annesi doğumdan sonra hemen ölmüş ve Mary, babası ile ikinci eşi tarafından büyütülmüştür. Çocukluğunun büyük bölümünü okuyarak, hikâyeler yazarak ve düşler kurarak geçiren Mary, 1814’de Percy Bysshe Shelley’ye âşık oldu. Evli bir adamla ilişki kurduğu için babası tarafından tepkiyle karşılanan Mary, 1814 yılında kendi üvey kızkardeşi Jane Clairmont ve Shelley ile birlikte kaçtı. Parasızlık onları Londra’ya dönmeye zorlayana kadar kıtayı haftalarca dolaştılar. Ancak Shelley’nin eşi Harriet’in 1816’da ölümüyle evlenebildiler.<br><br>\r\nFrankenstein’ın düşüncesi Mary’ye 1816 yazının yarı uyanık bir kâbusunda geldi. Kocası Mary’yi öyküsünü geliştirmesi için destekledi ve Frankenstein 1818 başlarında yayımlandı. Percy Bysshe Shelley’nin bir deniz kazasında ölmesinin ardından Mary, 1823’de, ölüm tarihi olan 1851 yılına kadar profesyonel yazar olarak yaşamına devam edeceği İngiltere’ye döndü. Daha çok Frankenstein ile anılan Mary Shelley ayrıca, Lodore, Falkner, Perkin Warbeck ve insanlığın yavaş yavaş yok oluşunu inceleyen futurist romanı The Last Man’i de içeren romanların yazarıdır.', '35.00', 4, '2023-05-18 00:32:26'),
('9786053753902', 'Marslı', 'Andy Weir', 'marsli.jpg', 'Goodreads okurlarına göre 2014’ün En İyi Bilim Kurgu Romanı!<br>\r\nAltı gün önce, Mark Watney Mars’a ayak basan ilk insanlardan biriydi. Şimdi ise, orada ölmesi neredeyse kesin.<br><br>\r\n\"Çok uzun zamandan beri okuduğum en iyi kitap. Zeki, eğlenceli ve gerilim dolu. Marslı, bir romandan isteyebileceğiniz her şeye sahip.\"<br><br>\r\n- Hugh Howey, Wool serisinin yazarı<br><br>\r\n\"Sürükleyici… Defoe’nun Robinson Crusoe’su sanki daha zeki biri tarafından yazılmış gibi.\"<br><br>\r\n- Larry Niven, Hugo, Nebula  ve Locus ödüllü Halka Dünya  romanının yazarı<br><br>\r\n\"Bu kitap tam da benim gibi okuyucuların seveceği türden.\"<br><br>\r\n- John Scalzi, Yaşlı Adamın Savaşı serisinin Hugo ve  Locus ödüllü yazarı<br><br>\r\n\"Andy Weir’in yazdığı Marslı şimdiye kadar okuduğum en iyi bilimsel bilimkurgu romanı. Bu romanı –başka bir kitap hakkında  hiç böyle bir şey söylemedim– edebi anlamda da elden bırakmak  mümkün değil.\"<br><br>\r\n- Dan Simmons, Hugo ödüllü Hyperion serisinin yazarı<br><br>\r\n\"Marslı aklımı başımdan aldı!\"<br><br>\r\n- Ernest Cline, Başlat romanının yazarı<br><br>\r\n\"Aksiyon ve uzay macerasının kusursuz bir karışımı.\"<br><br>\r\n- Library Journal<br><br>', '87.50', 2, '2023-05-18 00:05:35'),
('9786053754794', 'Dune', 'Frank Herbert', 'dune.jpg', '\"Yüzüklerin Efendisi dışında bu kitapla kıyaslanacak başka bir kitap yok.\"<br>\r\n-Arthur C. Clarke-<br><br>\r\n\r\n\"Güçlü, inandırıcı ve usta işi.\"<br>\r\n-Robert A. Heinlein-<br><br>\r\n\r\n\"Modern bilimkurgunun mihenk taşlarından biri.\"<br>\r\n-Chicago Tribune-<br><br>\r\n\r\nEn İyi Roman kategorisinde Hugo Ödülü<br>\r\nEn İyi Roman kategorisinde Nebula Ödülü<br><br>\r\n\r\nOkurlar tarafından 20. yüzyılın en iyi bilimkurgu yapıtı seçilen Dune serisi, yepyeni kapakları ve gözden geçirilmiş çevirileriyle 50. yılında İthaki\'de.<br><br>\r\n\r\nModern edebiyatın en epik mesih anlatılarından biri sayılan Dune, genç Paul Atreides\'in hikâyesini anlatır. Atreides\'in ailesi, evrendeki en önemli ve en değerli madde olan melanj \'baharatının\' tek kaynağı olarak bilinen Arrakis gezegeninin kontrolünü kabul etmiştir. İmpatorluğun güçleri Arrakis\'in kontrolü için birbirlerinin boğazına sarılırken, politika, din, ekoloji, teknoloji ve insani duyguların çok katmanlı, karmaşık etkileşiminden benzersiz bir hikâye doğacaktır.<br><br>\r\n\r\nFrank Herbert\'ın yarattığı evren, yıllar boyunca milyonlarca okurun zihninde gerçekliğini kabul ettirdi ve bugün de ayakta.<br><br>\r\n\r\nİyi bir bilimkurgu ve iyi bir edebiyat yapıtı okumak isteyen herkesin yolu Dune serisinde birleşiyor… İthaki\'nin yepyeni \"Bilimkurgu Klasikleri\" dizisi Dune efsanesiyle başlıyor…<br><br>', '111.60', 1, '2023-05-18 01:44:45'),
('9786053757597', 'Değiştirilmiş Karbon', 'Richard K. Morgan', 'degistirilmis-karbon.jpg', 'PHILIP K. DICK EN İYİ ROMAN ÖDÜLÜ<br><br>\r\n25. yüzyıl. İnsanlık BM’nin gözetimi altında tüm galakside hüküm sürmekte. Irk, inanç ve sınıf farklılıklarının hâlâ devam ettiği bu dönemde teknolojideki yükseliş hayatı âdeta baştan tanımladı. Bir insanın bilinci depolanarak yeni bir bedene (ya da “kılıf”a) kolayca indirilebilir hale geldi ve ölüm olgusu, ekrandaki bir bip sesine indirgendi.<br><br>\r\nEski bir asker ve BM elçisi olan Takeshi Kovacs daha önce de öldürülmesine rağmen son ölümü bilhassa acı vericiydi. Evinden 180 ışık yılı uzakta, eski adıyla San Francisco, yeni adıyla Bay City’de yeni bir bedende uyanan Kovacs kendini, “varoluş”u alınıp satılır şeyler olarak gören bir topluma göre bile karanlık ve büyük ölçekli bir komplonun tam merkezinde buldu. Dünyanın en güçlü insanlarından biri olan Laurens Bancroft bir ölümün sırrını açığa çıkarmak için Kovacs’ı tutmuştu: Kendi ölümünün.<br><br>\r\nBlade Runner ve Neuromancer gibi eserlerin izinden giden siberpunk türündeki Değiştirilmiş Karbon, son zamanların en dikkat çeken bilimkurgu-distopya romanlarından biri.', '94.50', 4, '2023-05-18 00:35:05'),
('9786055420956', 'Suç Detayda Saklıdır - Sherlock Holmes', 'Sir Arthur Conan Doyle', 'suc-detayda-saklidir.jpg', 'Bir kadının sezgileri bazen en mantıklı çıkarımlardan bile daha değerli olabilir. Karmaşık beyinleriyle art arda sıraladıkları senaryoları mutlaka dikkate alın. Bunlar sizi hiç tahmin etmediğiniz sonuçlara ulaştırdığında haklı olduğumu anlayacaksınız.<br>\r\n\r\n- Sherlock Holmes<br>\r\n\r\nDünyaca ünlü dedektif Sherlock Holmes, kendine özgü karakteri ve yaşadığı birbirinden farklı maceralarıyla yıllardır okurları etkisi altında tutmaya devam ediyor. Toplam 56 çarpıcı hikâyeden oluşan serinin ilgiyle karşılanan ilk kitabı Akıl Oyunlarının Gölgesi’nden sonra, serinin ikinci kitabı Suç Detayda Saklıdır’ın bitmesini istemeyeceksiniz.', '29.90', 5, '2023-05-18 01:19:54'),
('9786059232234', 'Schindler\' in Listesi', 'Thomas Keneally', 'schindlerin_listesi.jpg', 'Uluslararası bir başarı elde ederek pek çok dile çevrilen, Booker Ödülü ve Los Angeles Times Kitap Ödülü gibi birden çok ödüle layık görülen, Steven Spielberg tarafından sinemaya uyarlanıp dünya çapında milyonlarca izleyiciyle buluşan, 12 dalda Oscar adaylığı, 7 dalda da Oscar ödülü bulunan, Thomas Keneally\'nin Schindler\'in Listesi adlı eseri Nazi işgali altında Polonya\'da yaşayan Yahudileri kurtarmak için hayatını riske atıp, SS birliğine kafa tutan ve onları zekâsı ile alt edip, bir şefkat meleğine dönüşen Oskar Schindler\'in hikâyesini anlatıyor. Bu olağanüstü anlatının gerçek olaylara dayanması okurlara unutulmaz bir deneyimin kapılarını aralıyor.<br><br>\r\n\r\n\"Müthiş bir hikâye… Burada anlatılan hakikat, hayal gücünün icat edebileceği her şeyden çok daha güçlü.\"<br>\r\n-Newsweek-<br><br>\r\n\r\n\"Olağanüstü bir öykü… Takdir edilesi bir başarı.\"<br>\r\n-New York Review of Books-<br><br>\r\n\r\n\"İnsan ruhunun gelişimini ustaca betimleyen bir anlatı.\"<br>\r\n-Los Angeles Times-<br><br>\r\n\r\n\"Kahramanca bir savaş hikâyesi. Nazizm\'in saçtığı dehşetle tek başına savaşan bir adamın anısına dikilebilecek en güzel anıt.\"<br>\r\n-Simon Wiesenthal-', '89.40', 1, '2023-05-18 01:42:01'),
('9786257650328', 'Vakıf’ın Sınırı', 'Isaac Asimov', 'vakifin-siniri.jpg', 'Hugo ve Locus En İyİ Roman Ödülü<br><br>\r\n1941 yılında genç bir biliminsanı ve yazar olarak Isaac Asimov, Edward Gibbon’ın yazdığı Roma İmparatorluğu’nun Gerileyiş ve Çöküş Tarihi’nden etkilenerek çağının çok ötesinde bir destan yazdı: Galaktik İmparatorluk’un çöküşü ve feodalizmin dönüşü, İkinci Galaktik İmparatorluk dönemindeki güvenli ortamdan geçmişe bakan bir bakış açısıyla anlatıldı. İşte bu süreç sonucunda \"Tarih tahmin edilebilir mi?\", \"Toplum nasıl yönetilmeli?\" ya da \"İmparatorluklar neden yükselir ve çöker?\" gibi soruları sormaktan çekinmeyen destansı Vakıf Serisi ortaya çıktı.<br><br>\r\nBirinci Vakıf ve İkinci Vakıf arasındaki acı savaş nihayet sona ermişti. Birinci Vakıf’ın biliminsanları savaştan galip çıkmış ve Hari Seldon’ın eski İmparatorluk’un kalıntılarından yeni bir imparatorluk kurma planına geri dönmüşlerdi. Fakat İkinci Vakıf’ın yok edilmediği ve intikam almak için hazırlandığına dair söylentiler her geçen gün artıyordu. Birinci Vakıf’tan sürgün edilmiş Encümen üyesi Golan Trevize ve tarihçi Janov Pelorat zoraki ve tehlikeli bir yolculuğa çıkacaktı. Amaçları İkinci Vakıf’ın hâlâ var olduğunu ortaya çıkarmak ve insan ırkının doğduğu mitik gezegeni bulmaktı, yani Dünya’yı.<br><br>\r\nYayımlanış tarihine göre: 4. kitap / Kronolojiye göre: 6. kitap', '105.00', 4, '2023-05-18 00:27:00'),
('9789750802942', 'Harry Potter ve Felsefe Taşı - 1', 'J. K. Rowling', 'harry-potter-ve-felsefe-tasi.jpg', '“Harry, elleri titreyerek zarfı çevirince mor balmumundan bir mühür gördü; bir arma – koca bir ‘H’ harfinin çevresinde bir aslan, bir kartal, bir porsuk, bir de yılan.”<br><br>\r\nHARRY POTTER sıradan bir çocuk olduğunu sanırken, bir baykuşun getirdiği mektupla yaşamı değişir: Başvurmadığı halde Hogwarts Cadılık ve Büyücülük Okulu’na kabul edilmiştir. Burada birbirinden ilginç dersler alır, iki arkadaşıyla birlikte maceradan maceraya koşar. Yaşayarak öğrendikleri sayesinde küçük yaşta becerikli bir büyücü olup çıkar.', '48.75', 2, '2023-05-17 23:59:39'),
('9789750825927', 'Benim Adım Kırmızı', 'Orhan Pamuk', 'kırmızı.jpg', 'Yeni Türk edebiyatının dünya çapında en çok okunan ve sevilen romanı Benim Adım Kırmızı, Orhan Pamuk’un tema ve olay örgüsü bakımından en pozitif romanı olarak tanımlanıyor. Zengin anlatım gücü ve usta tekniğiyle yerli edebiyatın en başarılı isimleri arasında yer alan Pamuk, Benim Adım Kırmızı’da Türk romanının temel konularından biri olan Doğu-Batı medeniyetlerinin kapsamlı bir karşılaştırmasını yapıyor.<br><br>\r\n\r\nYayımlanmasını takip eden süreçte Fransa ve İtalya’da “yılın kitabı” seçilen Benim Adım Kırmızı, yazarın en çok dile çevrilen eseri olarak farklı kitleleri ortak beğenide bir araya getiriyor. Okurlarıyla ilk olarak 1998 yılında buluşan eser, yazara Uluslararası IMPAC Dublin Ödülü’nü de kazandırmış olmasıyla edebiyat alanında Türkiye’nin en önemli değerleri arasında yer alıyor.<br><br>\r\n\r\n16. Yüzyılda Bir İstanbul Turuna Çıkmaya Hazır Mısınız?<br><br>\r\n\r\nBenim Adım Kırmızı, 16’ncı yüzyılın sonlarındaki İstanbul yaşamını konu ediniyor. Kitaptaki olaylar, 1591 yılının bir kış gününde başlıyor. Romanın başkahramanı ise evli ve iki çocuk annesi olan, Şeküre adındaki güzel bir kadın olarak okur karşısına çıkıyor. Kocasının savaşa katılması üzerine iki çocuğu ve babası ile birlikte yaşayan Şeküre, artık hayatında kendisine arkadaşlık edecek başka birinin olmasını diliyor. Bu esnada da kocasının kardeşi Hasan ve kendi kuzeni Kara arasında gelgitli bir ruh hali içinde sürükleniyor. <br><br>\r\n\r\nŞeküre’nin babası Zarif Efendi, bir nakkaş olup geçimini saraydan istenen işlerle sağlıyor. Ve bir gün padişah, ona bir kitap vererek bu eserin gizlice işlenmesini istiyor. Döneme göre sakıncalı bir iş olan bu görev, çok geçmeden Zarif Efendi’nin ölümüyle sonuçlanıyor. Babasının bir düşmanlık katline kurban gitmesi üzerine Şeküre, çocuklarıyla beraber kuzeni Kara’nın evine yerleşiyor. Ancak babasını Kara’nın öldürdüğünü zannederek ona düşmanca bir tavır takınıyor. Bir süre sonra, babasının Kara değil de hiç beklemediği biri tarafından öldürüldüğünü öğreniyor.', '108.80', 1, '2023-05-18 01:50:53'),
('9789750833496', 'On İkiye Bir Var', 'Haldun Taner', 'on_ikiye-bir_var.jpg', 'Türk edebiyatının ve tiyatrosunun büyük ustası Haldun Taner\'in bu ay bir kitabı daha YKY raflarında yerini alıyor. Haldun Taner, hayata bakışındaki derin ve keskin gözlem gücü, insanı ele alışındaki olgunluk ve incelik, durumları ortaya koyuşundaki kültürel zenginlik, anlatımındaki sağlam yapı ve mizahın imbiğinden geçen ışıltılı üslubuyla klasikleşmiş bir yazarımız.<br><br>\r\n\r\nYKY, doğumunun 100. yılında Haldun Taner kitaplarını yeni bir editörlükle ve özel kapaklarla ayrı ayrı yayımlıyor. İşte bu ayın kitabı: On İkiye Bir Var (öykü).<br><br>\r\n\r\nHaldun Taner\'in 1954\'te yayımladığı iki öykü kitabından biri olan On İkiye Bir Var, 1955 yılında verilmeye başlanan Sait Faik Hikâye Armağanı\'nı alan ilk kitaptı. Kitaptaki \"On İkiye Bir Var\" öyküsü İsviçre\'deki Atlantis Yayınevi\'nin düzenlediği Zaman Üstüne Öyküler yarışmasında ödül almıştı. Behçet Necatigil\'in deyişiyle, yazar \"dil ve anlatış ustalığını, mizah yönünü, ruh tahlillerindeki başarısını\" bu kitabında da sürdürdü.<br><br>\r\n\r\nOn İkiye Bir Var, Ayak, İznikli Leylek, Bayanlar 00, 45 Marka Seksapil, Sahib-i Seyf ü Kalem, Artırma adlı öykülerden oluşan On İkiye Bir Var, yıllar sonra tekrar ayrı bir kitap olarak okuruyla buluşuyor.', '23.80', 1, '2023-05-18 02:00:09'),
('9789750842719', 'Fantastik Canavarlar Nelerdir, Nerede Bulunurlar?', 'J. K. Rowling', 'fantastik-canavarlar-nelerdir-nerede-bulunurlar.jpg', 'Hogwarts Cadılık ve Büyücülük Okulu ders kitaplarından Fantastik Canavarlar Nelerdir, Nerede Bulunurlar? ilk kez yayımlanmasından itibaren büyücüler dünyasının sihirli yaratıklarını tanımak için olmazsa olmaz rehberlerden biri oldu. <br><br>\r\n\r\nBu yeni genişletilmiş baskı ünlü Büyüzoolog Newt Scamander’ın 1920’de New York’ta Uluslararası Büyücülük Sırları Tüzüğü’nün ciddi şekilde ihlaline ilişkin meydana gelen olaylara ışık tutacak önsözünü içeriyor, üstelik daha önce hiçbir kitapta yer almayan Kuzey Amerika kıtasına özgü altı yeni canavarla birlikte.<br><br>\r\n\r\n\"Bu kitabın satışından elde edilecek kazanç Comic Relief’e ve J.K. Rowling’in uluslararası hayır kurumu Lumos’a gidecek, bu da bir büyücünün gücünün çok ötesinde bir sihir yapacakları anlamına geliyor. Bu, elinizi cebinize atmak için yeterli bir neden değilse, tek dileğim, bir gün bir Mantikor’un saldırısına uğradığınızda yoldan geçen büyücülerin sizden daha hayırseverce davranmasıdır.\"<br><br>\r\n\r\n- Albus Dumbledore', '94.25', 6, '2023-05-18 00:48:28'),
('9789752111929', 'Kayıp Sembol', 'Dan Brown', 'kayip-sembol.jpg', 'Dan Brown; Da Vinci Şifresi, Melekler ve Şeytanlar’dan sonra Kayıp Sembol’de insanlığın yüzyıllardır beklediği bir gerçeğin peşinde... Harvard Simgebilim Profesörü Robert Langdon, Kongre Binası’nda konferans vermesi için yakın bir arkadaşından davet alır. Ancak, Washington’a varır varmaz oldukça garip bir durumla karşı karşıya kalan profesör, kendini korkunç bir oyunun ortasında bulur. Kongre Binası’na bırakılmış olan bir sembolün -yakın arkadaşı Peter Solomon’ın kesik eli- varlığını haber veren bir telefon, Langdon’ı hiç de yabancısı olmadığı bir dünyaya davet etmektedir. Antikçağlarda kullanılan bu sembolik çağrı, daveti alan kişiyi ezoterik bilgeliğin hüküm sürdüğü, çok eskilerde kalmış kayıp bir dünyaya sürükleyecektir. Sonu belli olmayan bu mistik daveti arkadaşını kurtarmak için kabul eden Langdon, bir anda masonik sırların, saklı kalmış tarihin ve o güne dek görmediği yerlerin gizli dünyasında inanılmaz bir gerçekle yüzleşmek zorunda kalır. Artık cevaplanması gereken sorular vardır: İnsanlığın Altın Çağı, açılmaması gereken bir kapının aralığından sırlarıyla birlikte yok mu olacak, yoksa hikmetin ışığında tüm soruların cevapları mı bulunacaktır?...', '116.25', 5, '2023-05-18 01:22:49'),
('9789752733732', 'Hobbit', 'J. R. R. Tolkien', 'hobbit.jpg', 'İngiliz Dilbilim Profesörü ve roman yazarı J.R.R. Tolkien’ın olağanüstü bir titizlikle kurguladığı Orta-Dünya adlı fantastik/mitolojik bir evrende geçen Hobbit, yazarın bu evrende geçen masalları çocuklarına anlatmaya başlamasıyla bir kitap haline gelmiştir.<br><br>\r\nHobbit adlı eserin üzerine kurulduğu Orta-Dünya büyülü, çeşitli ırklara ve dillere sahip epik bir dünyadır. Bu dünyada İnsanlar, Cüceler, Elfler, Büyücüler, Ejderhalar, Goblinler ve Orklar yaşamaktadır. Cüceler, dağların kalbinde yaşayan kudretli, madenci bir halktır. Korkunç ve altına susamış şeytanî ejderha Smaug, Erebor adlı Cüce Kenti’ne saldırır ve burada yaşayan Cüce halkın başına korkunç felaketler getirir.<br>\r\nAnavatanlarından kaçıp sürgün hayatı yaşamak zorunda kalan Erebor Tahtı’nın Varisi Thorin Meşekalkan ve kuzenleri, Gandalf adında bir büyücünün yardımıyla anavatanlarını ejderha Smaug’dan kurtarmak için olağanüstü bir plan yaparlar. Bu planda oynayacağı rol son derece önemli bir hal alacak Hobbit Bilbo Baggins’in kapısını çalarlar ve Bilbo, hiç beklemediği bir anda, destansı bir maceraya dahil olmak zorunda kalır.<br><br>\r\nPeter Jackson tarafından üçleme olarak sinemaya uyarlanan eser, yayımlandığı tarihte büyük bir ilgi görmüştür ve olumlu yorumlar alarak çok kısa zamanda kült eser mertebesine erişmiştir.<br><br>\r\nHobbit, edebiyat çevrelerince büyük saygı gören Yüzüklerin Efendisi üçlemesinin başlangıcını anlatmasıyla da önemli bir yere sahiptir.', '84.00', 2, '2023-05-18 00:08:33'),
('9789754051520', 'Hayvan Mezarlığı Gecenin Pençesi', 'Stephen King', 'hayvan-mezarligi-gecenin-pencesi.jpg', 'Bu eseri beyazperdeye de aktarıldı. Film, bütün dünyada yankılar yaratmaya devam ediyor.Dr. Louis Creed ve ailesi eski kızılderili mezarlığındaki ruhların gazabına uğramışlardı...<br><br>\r\n\r\nBunun elbette nedenleri olmalıydı!...<br><br>\r\n\r\nStephen King okurlarını, doğaüstü olaylarla bezenmiş heyecanların doruğuna götürüyor.', '86.25', 5, '2023-05-18 01:24:45'),
('9789754587029', 'Gurur ve Önyargı', 'Jane Austen', 'gurur-ve-onyarg.png', 'Jane Austen (1775-1817): Sadece kırk iki yıllık, gözden uzak ve sade yaşantısına karşın yazdıklarıyla \"roman tarihinin ilk büyük (ve sahici) kültü\" olmayı başaran bir 19. yüzyıl romancısıdır. Sayısız TV ve sinema uyarlamalarının yanısıra tüm \"satış / okunma\" anketlerinin de gösterdiği üzere, yazarın 1813’de yayınlanan ikinci romanı Gurur ve Önyargı tüm zamanların en sevilen romanlarının başında gelir. Bu da, sanırız, Austen’in, dünyanın pek çok yerinde geleneklerin kadına biçtiği \"en iyi gelecek\" rolüyle kadınların aşklarını seçme hakkı arasındaki gerilimi \"mizah, zeka ve sevecenlik\"le yansıtmasından kaynaklanmaktadır. Hamdi Koç (1963): İstanbul Üniversitesi İngiliz Dili ve Edebiyatı Bölümü`nü bitirdi. Hokka dergisinin yayın kurulunda bulundu. 1992`de Çocuk Ölümü Şarkıları`ndan başlayarak hemen her yapıtıyla dikkat çeken Hamdi Koç`un o tarihten bu yana beş romanı yayımlandı. Eserlerini çevirdiği yazarlar arasında Shakespeare, Faulkner, Beckett ve Joyce yer alıyor.', '40.00', 2, '2023-05-17 23:36:08'),
('9789754589023', 'Suç ve Ceza', 'Fyodor Mihayloviç Dostoyevski', 'suc-ve-ceza.png', 'Fyodor Mihayloviç Dostoyevski (1821-1881): İlk romanı İnsancıklar 1846`da yayımlandı. Ünlü eleştirmen V. Belinski bu eser üzerine Dostoyevski’den geleceğin büyük yazarı olarak söz etti. Ancak daha sonra yayımlanan öykü ve romanları, çağımızda edebiyat klasikleri arasında yer alsa da, o dönemde fazla ilgi görmedi.<br><br>\r\nYazar 1849`da 1.Nikolay`ın baskıcı rejimine muhalif Petraşevski grubunun üyesi olduğu gerekçesiyle tutuklandı.Kurşuna dizilmek üzereyken cezası sürgün ve zorunlu askerliğe çevrildi.Cezasını tamamlayıp Sibirya`dan döndükten sonra Petersburg`da Vremya dergisini çıkarmaya başladı, yazdığı romanlarla tekrar eski ününe kavuştu.Suç ve Ceza Dostoyevski`nin bütün dünyada en çok okunan başyapıtıdır.', '52.00', 3, '2023-05-18 00:23:01'),
('9789944824644', 'Kralların Çarpışması 1', 'George R. R. Martin', 'krallarin-carpismasi.jpg', 'Buz ve Ateşin Şarkısı II<br><br>\r\n\r\nKrallar çarpışırken tüm diyar titrer...<br><br>\r\n\r\nGeorge R. R. Martin, Taht Oyunları`nın sabırsızlıkla beklenen devam kitabı Kralların Çarpışması`nda okuyucuları eşsiz hayal gücüyle buluşturuyor. Büyü, intikam ve savaşla dolu, eşi benzeri görülmemiş bir dünyanın kapıları açılırken büyük bir serüven başlıyor.<br><br>\r\n\r\nAlev ve kan rengine bürünmüş bir kuyruklu yıldız, gökyüzünü baştan başa kaplamıştır. Ejderha Kayası`nın kadim kalesinden, Kışyarı`nın haşin topraklarına kadar korkunç bir keşmekeş hâkimdir. Altı güç, Demir Taht`ı ve parçalanmış Yedi Krallık`ı ele geçirmek için kıyametvari bir savaşa hazırlanmaktadır. Gecenin karanlığında ölüler yürümekte, kardeş kardeşi katletmektedir. Bir akıl şövalyesi, tehlike saçan bir büyücü kadını zehirlemek peşindedir. Bir prenses, öksüz oğlan kılığında dolaşmakta; Ay Dağları`nın vahşi adamları, yağma için inmektedir. Kardeş katli, zillet, simya ve kıyımla ilerleyen bu macerada zafer, kılıcı ve kanı en soğuk olanların dahi olabilir...<br><br>\r\n\r\n\"Martin, birinci ciltteki vaadini fazlasıyla yerine getiriyor ve yazılmış en iyi fantastik eser olmaya aday serisine devam ediyor.\"<br><br>\r\n\r\n-The Denver Post<br><br>\r\n\r\n\"George Martin kesinlikle destansı fantastik edebiyatın yeni ustalarından.\"<br><br>\r\n\r\n-Katharine Kerr<br><br>\r\n\r\n\"Kendisinden her zaman en iyi işleri beklediğim George R. R. Martin beni asla şaşırtmıyor.\"<br><br>\r\n\r\n-Robert Jordan<br><br>\r\n\r\n\"Muhteşem bir öykü, muhteşem bir tarihi fantastik yapıt! Göz kamaştırıcı.\"<br><br>\r\n\r\n-Anne McCaffrey<br><br>\r\n\r\n\"Muhtemelen gelmiş geçmiş en iyi epik fantastik eser.\"<br><br>\r\n\r\n-Marion Zimmer Bradley', '116.00', 6, '2023-05-18 01:13:20');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `category`
--

CREATE TABLE `category` (
  `categoryid` int(11) NOT NULL,
  `category_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Tablo döküm verisi `category`
--

INSERT INTO `category` (`categoryid`, `category_name`) VALUES
(1, 'Ödüllü Kitaplar'),
(2, 'Filme Uyarlanan Kitaplar'),
(3, 'Klasikler'),
(4, 'Bilim Kurgu'),
(5, 'Aksiyon - Macera'),
(6, 'Fantastik');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `customers`
--

CREATE TABLE `customers` (
  `customerid` int(10) UNSIGNED NOT NULL,
  `name` varchar(60) CHARACTER SET utf8mb4 NOT NULL,
  `address` varchar(80) CHARACTER SET utf8mb4 NOT NULL,
  `city` varchar(30) CHARACTER SET utf8mb4 NOT NULL,
  `zip_code` varchar(10) CHARACTER SET utf8mb4 NOT NULL,
  `country` varchar(60) CHARACTER SET utf8mb4 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Tablo döküm verisi `customers`
--

INSERT INTO `customers` (`customerid`, `name`, `address`, `city`, `zip_code`, `country`) VALUES
(15, 'Seminay', 'Bahçelievler', 'İstanbul', '1234', 'Türkiye'),
(16, 'Seminay İnaz', 'Bakırköy', 'İstanbul', '34197', 'Türkiye'),
(18, 'Duru Yılmaz', 'Bakırköy', 'İstanbul', '34145', 'Türkiye');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `orders`
--

CREATE TABLE `orders` (
  `orderid` int(10) UNSIGNED NOT NULL,
  `customerid` int(10) UNSIGNED NOT NULL,
  `amount` decimal(6,2) DEFAULT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `ship_name` char(60) CHARACTER SET utf8mb4 NOT NULL,
  `ship_address` char(80) CHARACTER SET utf8mb4 NOT NULL,
  `ship_city` char(30) CHARACTER SET utf8mb4 NOT NULL,
  `ship_zip_code` char(10) CHARACTER SET utf8mb4 NOT NULL,
  `ship_country` char(20) CHARACTER SET utf8mb4 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Tablo döküm verisi `orders`
--

INSERT INTO `orders` (`orderid`, `customerid`, `amount`, `date`, `ship_name`, `ship_address`, `ship_city`, `ship_zip_code`, `ship_country`) VALUES
(14, 12, '147.05', '2023-05-23 19:55:12', 'Seminay', 'sample', 'ist', '123', 'tr'),
(15, 13, '54.50', '2023-05-24 17:19:06', 'Seminay İnaz', 'Bahçelievler', 'İstanbul', '34197', 'Türkiye'),
(16, 13, '43.20', '2023-05-24 17:22:46', 'Seminay İnaz', 'Bahçelievler', 'İstanbul', '34197', 'Türkiye'),
(17, 13, '144.55', '2023-05-24 19:21:03', 'Seminay İnaz', 'Bahçelievler', 'İstanbul', '34197', 'Türkiye'),
(18, 14, '290.10', '2023-05-25 17:27:11', 'Seminay İnaz', 'Bahçelievler', 'ist', '34197', 'Türkiye'),
(19, 15, '12.00', '2023-05-25 17:33:27', 'Seminay', 'Bahçelievler', 'İstanbul', '1234', 'Türkiye'),
(20, 16, '92.55', '2023-05-25 17:41:07', 'Seminay İnaz', 'Bakırköy', 'İstanbul', '34197', 'Türkiye'),
(22, 18, '89.40', '2023-05-25 18:18:37', 'Duru Yılmaz', 'Bakırköy', 'İstanbul', '34145', 'Türkiye');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `order_items`
--

CREATE TABLE `order_items` (
  `orderid` int(10) UNSIGNED NOT NULL,
  `book_isbn` varchar(20) CHARACTER SET utf8mb4 NOT NULL,
  `item_price` decimal(6,2) NOT NULL,
  `quantity` tinyint(3) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Tablo döküm verisi `order_items`
--

INSERT INTO `order_items` (`orderid`, `book_isbn`, `item_price`, `quantity`) VALUES
(1, '978-1-118-94924-5', '20.00', 1),
(1, '978-1-44937-019-0', '20.00', 1),
(1, '978-1-49192-706-9', '20.00', 1),
(2, '978-1-118-94924-5', '20.00', 1),
(2, '978-1-44937-019-0', '20.00', 1),
(2, '978-1-49192-706-9', '20.00', 1),
(3, '978-0-321-94786-4', '20.00', 1),
(1, '978-1-49192-706-9', '20.00', 1),
(5, '978-1-4571-0402-2', '20.00', 2),
(5, '978-1-44937-075-6', '20.00', 1),
(5, '978-0-321-94786-4', '20.00', 1),
(6, '978-1-4571-0402-2', '20.00', 10),
(6, '978-1-44937-075-6', '20.00', 1),
(7, '978-0-7303-1484-4', '20.00', 1),
(8, '978-1-1180-2669-4', '20.00', 1),
(9, '978-1-44937-019-0', '20.00', 4),
(10, '64568', '1200.00', 1),
(11, '978-1-484216-40-8', '20.00', 1),
(11, '978-0-321-94786-4', '20.00', 1),
(12, '123', '20.00', 1),
(12, '978-1-484216-40-8', '20.00', 1),
(12, '978-0-321-94786-4', '20.00', 2),
(14, '9786051736938', '92.55', 1),
(14, '9786050321739', '54.50', 1),
(15, '9786050321739', '54.50', 1),
(15, '9786053606116', '12.00', 1),
(15, '9786053607038', '15.60', 2),
(15, '9786051736938', '92.55', 1),
(15, '9789754589023', '52.00', 1),
(18, '9786051736938', '92.55', 2),
(18, '9786257650328', '105.00', 1),
(19, '9786053606116', '12.00', 1),
(20, '9786051736938', '92.55', 1),
(21, '9789750833496', '23.80', 1),
(21, '9789750825927', '108.80', 1),
(22, '9786059232234', '89.40', 1);

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`name`,`pass`);

--
-- Tablo için indeksler `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`book_isbn`);

--
-- Tablo için indeksler `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`categoryid`);

--
-- Tablo için indeksler `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customerid`);

--
-- Tablo için indeksler `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`orderid`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `category`
--
ALTER TABLE `category`
  MODIFY `categoryid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Tablo için AUTO_INCREMENT değeri `customers`
--
ALTER TABLE `customers`
  MODIFY `customerid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- Tablo için AUTO_INCREMENT değeri `orders`
--
ALTER TABLE `orders`
  MODIFY `orderid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
