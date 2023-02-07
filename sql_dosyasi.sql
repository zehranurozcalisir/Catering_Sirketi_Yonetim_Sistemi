-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1:3306
-- Üretim Zamanı: 18 May 2022, 10:48:57
-- Sunucu sürümü: 5.7.31
-- PHP Sürümü: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `restoran`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `aylar`
--

DROP TABLE IF EXISTS `aylar`;
CREATE TABLE IF NOT EXISTS `aylar` (
  `ay_id` int(11) NOT NULL,
  `ay` varchar(255) COLLATE utf8_turkish_ci NOT NULL,
  PRIMARY KEY (`ay_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `aylar`
--

INSERT INTO `aylar` (`ay_id`, `ay`) VALUES
(1, 'Ocak'),
(2, 'Şubat'),
(3, 'Mart'),
(4, 'Nisan'),
(5, 'Mayıs'),
(6, 'Haziran'),
(7, 'Temmuz'),
(8, 'Ağustos'),
(9, 'Eylül'),
(10, 'Ekim'),
(11, 'Kasım'),
(12, 'Aralık');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `calisanlar`
--

DROP TABLE IF EXISTS `calisanlar`;
CREATE TABLE IF NOT EXISTS `calisanlar` (
  `tc_no` bigint(13) NOT NULL,
  `calisan_ad` varchar(255) COLLATE utf8_turkish_ci NOT NULL,
  `calisan_soyad` varchar(255) COLLATE utf8_turkish_ci NOT NULL,
  `calisan_tel_no` varchar(20) COLLATE utf8_turkish_ci NOT NULL,
  `sirket_id` int(5) NOT NULL,
  PRIMARY KEY (`tc_no`),
  KEY `sirket_id` (`sirket_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `calisanlar`
--

INSERT INTO `calisanlar` (`tc_no`, `calisan_ad`, `calisan_soyad`, `calisan_tel_no`, `sirket_id`) VALUES
(6547854758, 'Ahmet', 'Sezer', '05365487587', 12),
(7485478596, 'Recep Ali', 'Akdoğan', '05365478569', 10),
(12547854698, 'Senem', 'Aksevim', '05468547584', 6),
(15478596548, 'Özde', 'Adıgüzel', '05478547858', 14),
(26548574584, 'Fatma Özlem', 'Acar', '05365487458', 15),
(35987415256, 'Ayşegül', 'Başar', '05478549874', 2),
(36547587458, 'Ecem Hatice', 'Akova', '05478546321', 7),
(51254763258, 'Emre', 'Binbay', '65875412548', 1),
(51478965425, 'Ömer Buğra', 'Akbaş', '05478547854', 3),
(54758745896, 'Berker', 'Akküt', '05325487458', 8),
(54785478569, 'Kutlu', 'Alkan', '05425487836', 4),
(54785478596, 'İclal', 'Akkoyun', '05478547587', 9),
(54785496548, 'Rafi', 'Akaş', '05354758745', 11),
(54875425485, 'Cihan', 'Akarpınar', '05365478545', 13),
(65187954254, 'Bedirhan', 'Akşamoğlu', '05451265487', 5);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `degerlendirme`
--

DROP TABLE IF EXISTS `degerlendirme`;
CREATE TABLE IF NOT EXISTS `degerlendirme` (
  `degerlendirme_id` int(11) NOT NULL,
  `siparis_no` int(11) DEFAULT NULL,
  `hız` int(11) DEFAULT NULL,
  `lezzet` int(11) DEFAULT NULL,
  `servis` int(11) DEFAULT NULL,
  `yorum` varchar(255) COLLATE utf8_turkish_ci DEFAULT NULL,
  PRIMARY KEY (`degerlendirme_id`),
  KEY `menu_no` (`siparis_no`),
  KEY `puan` (`hız`),
  KEY `lezzet` (`lezzet`),
  KEY `servis` (`servis`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `degerlendirme`
--

INSERT INTO `degerlendirme` (`degerlendirme_id`, `siparis_no`, `hız`, `lezzet`, `servis`, `yorum`) VALUES
(1, 10, 4, 10, 10, 'Yemeklerin lezzet ve servisi harikaydı sadece biraz geç geldi '),
(2, 102, 5, 9, 9, 'Ufak bir gecikme yaşansa da gayet lezzetliydi yemekleri beğendik'),
(3, 59, 4, 5, 10, 'Yemekler Harikaydı'),
(4, 85, 3, 10, 10, 'Her şey harikaydı gerçekten çok beğendik'),
(5, 37, 1, 10, 10, 'Lezzet ve servis harikaydı ama hız için aynı şeyi söyleyemeyeceğim gerçekten hiç gelmeyecek sandık'),
(6, 72, 4, 9, 9, 'Muhteşemdi tam anlamıyla doyduğumuzu hissettik '),
(7, 54, 3, 10, 7, 'Yemekler güzeldi ama servis biraz daha iyileştirilebilir'),
(8, 99, 3, 10, 3, 'Yemekler hemen ulaştı ama servis için daha özenli olunabilir'),
(9, 47, 3, 9, 8, 'Her şey istediğimiz gibiydi ama keşke peçete de yollasalarmış '),
(10, 6, 3, 10, 10, 'Hız, lezzet, servis hepsi çok iyiydi'),
(11, 135, 4, 10, 10, 'Yemekler güzeldi herkese övgüyle bahsettim'),
(12, 26, 4, 8, 10, 'Yemeklerin tadı harikaydı ama hız konusunda biraz üzüldük'),
(13, 33, 3, 4, 4, 'Porsiyonlar küçüktü doyurucu olmadı'),
(14, 80, 5, 7, 3, 'Yemekler hemen ulaştı ama servis için daha özenli davranılabilir'),
(15, 114, 5, 9, 9, 'Ufak bir gecikme yaşansa da gayet lezzetliydi yemekleri beğendik'),
(16, 39, 4, 7, 4, 'Porsiyonlar küçüktü doymadık'),
(17, 113, 3, 9, 8, 'Gayet lezzetliydi yemekleri beğendik ama hız sorununa çözüm bulunmalı'),
(18, 146, 3, 10, 10, 'Yemekler güzeldi herkese övgüyle bahsettim'),
(19, 95, 1, 8, 4, 'Yemekler hemen ulaştı ama servis biraz özensizdi'),
(20, 107, 6, 10, 9, 'Lezzet gayet iyiydi hız idare eder'),
(21, 120, 4, 10, 10, 'Yemeklerin lezzeti harikaydı çok memnun kaldık'),
(22, 127, 1, 10, 10, 'Tam anlamıyla mükemmeldi'),
(23, 53, 6, 7, 7, 'Daha güzel olabilirdi'),
(24, 54, 4, 9, 8, 'Gayet güzeldi beğendim'),
(25, 81, 3, 10, 10, 'Harbiden mükemmeldi bayıldık'),
(26, 115, 3, 7, 7, 'Hız Çok Kötüydü'),
(27, 132, 3, 9, 7, 'Yemek biraz geç geldi fakat tadı çok güzeldi'),
(28, 20, 2, 4, 5, 'Çok geç geldi. Yemekler soğuktu.'),
(29, 4, 5, 7, 6, 'Biraz geç geldi fakat yemek soğuk olmasına rağmen çok güzeldi'),
(30, 49, 3, 10, 9, 'Yemeklerin tadı çok güzeldi. '),
(31, 91, 2, 4, 4, 'Yemekler çok soğuk ve geç geldi. '),
(32, 12, 3, 7, 9, 'Lezzet konusunda biraz daha geliştirilebilir'),
(33, 23, 3, 5, 7, 'Çok yavaştı'),
(34, 28, 4, 10, 10, 'Hız hariç her şey mükemmeldi'),
(35, 76, 8, 10, 10, 'Her şeyiyle güzeldi'),
(36, 65, 6, 8, 8, 'Biraz geç geldi ama sorun olmadı'),
(37, 17, 3, 7, 7, 'Geç geldiği için soğumuş olmalı '),
(38, 129, 6, 8, 8, 'Yemekler fena değildi'),
(39, 18, 10, 10, 10, 'Harikaydı çok beğendik'),
(40, 136, 10, 10, 10, 'Daha iyi olamazdı'),
(41, 139, 10, 7, 9, 'Gayet hızlıydı ama daha lezzetli olabilir'),
(42, 55, 10, 7, 10, 'Daha lezzetli olmasını isterdim'),
(43, 82, 10, 9, 10, 'Her şey mükemmeldi'),
(44, 29, 4, 9, 10, 'Daha hızlı olmasını beklerdik'),
(45, 2, 4, 8, 8, 'Daha hızlı olmasını beklerdik'),
(46, 134, 8, 8, 8, 'Gayet iyiydi'),
(47, 34, 10, 10, 10, 'Mükemmeldi çok memnun kaldık'),
(48, 16, 10, 10, 10, 'Her şey tam istediğimiz gibiydi'),
(49, 35, 9, 9, 9, 'Baya güzle ve hızlıydı'),
(50, 9, 7, 7, 7, 'Fena değildi ama daha iyi olabilir'),
(51, 22, 9, 9, 10, 'Gayet güzeldi'),
(52, 89, 4, 8, 8, 'Hız konusunda üzüldük'),
(53, 32, 10, 6, 6, 'Biraz yavandı ama hızı iyiydi'),
(54, 40, 10, 10, 10, 'Her şey çok güzeldi'),
(55, 70, 9, 9, 9, 'Baya güzeldi memnun kaldım'),
(56, 106, 10, 8, 8, 'Hemen geldi memnun kaldım'),
(57, 51, 10, 10, 10, 'Harikaydı'),
(58, 56, 10, 10, 10, 'Çok beğendim'),
(59, 31, 4, 7, 7, 'Yemekler soğumuştu'),
(60, 38, 9, 7, 7, 'daha iyi olmasını bekliyordum'),
(61, 108, 8, 10, 10, 'Gayet güzeldi'),
(62, 84, 10, 7, 7, 'Lezzetinde bir eksiklik vardı'),
(63, 87, 10, 10, 10, 'Aşırı beğendim'),
(64, 43, 6, 10, 10, 'Hız daha iyi olabilir ama lezzeti yerindeydi'),
(65, 64, 6, 10, 10, 'Hızı geliştirilmeli'),
(66, 8, 10, 9, 9, 'Gayet güzeldi'),
(67, 14, 8, 8, 8, 'Memnun kaldım'),
(68, 138, 7, 10, 9, 'Güzeldi'),
(69, 25, 10, 8, 9, 'Güzeldi beğendim'),
(70, 1, 10, 10, 10, 'Her şey çok güzeldi'),
(71, 11, 7, 7, 7, 'Daha güzel beklerdim'),
(72, 46, 7, 9, 8, 'Biraz yavaştı ama güzel'),
(73, 57, 10, 10, 10, 'Mükemmel'),
(87, 65, 7, 7, 5, 'ş');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `fatura`
--

DROP TABLE IF EXISTS `fatura`;
CREATE TABLE IF NOT EXISTS `fatura` (
  `siparis_id` varchar(5) COLLATE utf8_turkish_ci NOT NULL,
  `sirket_ad` varchar(255) COLLATE utf8_turkish_ci NOT NULL,
  `ücret` int(50) NOT NULL,
  `odeme_turu` varchar(255) COLLATE utf8_turkish_ci NOT NULL,
  `fatura_tarihi` date NOT NULL,
  `ay_id` int(11) NOT NULL,
  KEY `ay_id` (`ay_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `fatura`
--

INSERT INTO `fatura` (`siparis_id`, `sirket_ad`, `ücret`, `odeme_turu`, `fatura_tarihi`, `ay_id`) VALUES
('1', 'LAZERİZMİR METAL KESİM VE İŞLEME TEKNOLOJİLERİ MAKİNA İMALAT SAN. VE TİC. LTD. ŞTİ. ESB ŞUBESİ', 840, 'Kart', '2021-12-15', 0),
('2', 'KORSİNİ-SAF AMBALAJ SANAYİ VE TİCARET A.Ş. EGE SERBEST BÖLGE ŞUBESİ', 990, 'Nakit', '2021-12-16', 0),
('3', 'MECALAC İŞ MAKİNALARI SANAYİ VE TİCARET LTD. ŞTİ.', 325, 'Kart', '2021-12-16', 0),
('4', 'OZ OPTICS A.Ş.', 728, 'Kart', '2021-12-16', 0),
('5', 'PFW HAVACILIK SAN. VE DIŞ TİC. LTD.ŞTİ.', 585, 'Nakit', '2021-12-16', 0),
('6', 'ROPİX GİYİM SANAYİ LTD. ŞTİ.	', 800, 'Nakit', '2021-12-16', 0),
('7', 'LAZERİZMİR METAL KESİM VE İŞLEME TEKNOLOJİLERİ MAKİNA İMALAT SAN. VE TİC. LTD. ŞTİ. ESB ŞUBESİ', 1350, 'Nakit', '2021-12-16', 0),
('8', 'LAZERİZMİR METAL KESİM VE İŞLEME TEKNOLOJİLERİ MAKİNA İMALAT SAN. VE TİC. LTD. ŞTİ. ESB ŞUBESİ', 1400, 'Nakit', '2021-12-16', 0),
('9', 'LAZERİZMİR METAL KESİM VE İŞLEME TEKNOLOJİLERİ MAKİNA İMALAT SAN. VE TİC. LTD. ŞTİ. ESB ŞUBESİ', 952, 'Nakit', '2021-12-20', 0),
('10', 'LAZERİZMİR METAL KESİM VE İŞLEME TEKNOLOJİLERİ MAKİNA İMALAT SAN. VE TİC. LTD. ŞTİ. ESB ŞUBESİ', 784, 'Nakit', '2021-12-20', 0),
('11', 'LAZERİZMİR METAL KESİM VE İŞLEME TEKNOLOJİLERİ MAKİNA İMALAT SAN. VE TİC. LTD. ŞTİ. ESB ŞUBESİ', 1064, 'Nakit', '2021-12-20', 0),
('12', 'LAZERİZMİR METAL KESİM VE İŞLEME TEKNOLOJİLERİ MAKİNA İMALAT SAN. VE TİC. LTD. ŞTİ. ESB ŞUBESİ', 952, 'Nakit', '2021-12-20', 0),
('13', 'LAZERİZMİR METAL KESİM VE İŞLEME TEKNOLOJİLERİ MAKİNA İMALAT SAN. VE TİC. LTD. ŞTİ. ESB ŞUBESİ', 1232, 'Nakit', '2021-12-20', 0),
('1', 'KORSİNİ-SAF AMBALAJ SANAYİ VE TİCARET A.Ş. EGE SERBEST BÖLGE ŞUBESİ', 510, 'Kart', '2021-12-22', 0),
('2', 'LAZERİZMİR METAL KESİM VE İŞLEME TEKNOLOJİLERİ MAKİNA İMALAT SAN. VE TİC. LTD. ŞTİ. ESB ŞUBESİ', 540, 'Nakit', '2021-12-22', 0),
('3', 'MECALAC İŞ MAKİNALARI SANAYİ VE TİCARET LTD. ŞTİ.', 630, 'Nakit', '2021-12-22', 0),
('4', 'OZ OPTICS A.Ş.', 1326, 'Nakit', '2021-12-22', 0),
('1', 'KORSİNİ-SAF AMBALAJ SANAYİ VE TİCARET A.Ş. EGE SERBEST BÖLGE ŞUBESİ', 490, 'Kart', '2021-12-22', 0),
('2', 'KORSİNİ-SAF AMBALAJ SANAYİ VE TİCARET A.Ş. EGE SERBEST BÖLGE ŞUBESİ', 455, 'Kart', '2021-12-22', 0),
('3', 'KORSİNİ-SAF AMBALAJ SANAYİ VE TİCARET A.Ş. EGE SERBEST BÖLGE ŞUBESİ', 665, 'Kart', '2021-12-22', 0),
('4', 'KORSİNİ-SAF AMBALAJ SANAYİ VE TİCARET A.Ş. EGE SERBEST BÖLGE ŞUBESİ', 595, 'Kart', '2021-12-22', 0),
('5', 'KORSİNİ-SAF AMBALAJ SANAYİ VE TİCARET A.Ş. EGE SERBEST BÖLGE ŞUBESİ', 525, 'Kart', '2021-12-22', 0),
('6', 'KORSİNİ-SAF AMBALAJ SANAYİ VE TİCARET A.Ş. EGE SERBEST BÖLGE ŞUBESİ', 770, 'Kart', '2021-12-22', 0),
('7', 'KORSİNİ-SAF AMBALAJ SANAYİ VE TİCARET A.Ş. EGE SERBEST BÖLGE ŞUBESİ', 455, 'Kart', '2021-12-22', 0),
('8', 'KORSİNİ-SAF AMBALAJ SANAYİ VE TİCARET A.Ş. EGE SERBEST BÖLGE ŞUBESİ', 875, 'Kart', '2021-12-22', 0),
('9', 'KORSİNİ-SAF AMBALAJ SANAYİ VE TİCARET A.Ş. EGE SERBEST BÖLGE ŞUBESİ', 700, 'Kart', '2021-12-22', 0),
('10', 'KORSİNİ-SAF AMBALAJ SANAYİ VE TİCARET A.Ş. EGE SERBEST BÖLGE ŞUBESİ', 665, 'Kart', '2021-12-22', 0),
('11', 'KORSİNİ-SAF AMBALAJ SANAYİ VE TİCARET A.Ş. EGE SERBEST BÖLGE ŞUBESİ', 490, 'Kart', '2021-12-22', 0),
('12', 'KORSİNİ-SAF AMBALAJ SANAYİ VE TİCARET A.Ş. EGE SERBEST BÖLGE ŞUBESİ', 455, 'Kart', '2021-12-22', 0),
('13', 'KORSİNİ-SAF AMBALAJ SANAYİ VE TİCARET A.Ş. EGE SERBEST BÖLGE ŞUBESİ', 700, 'Kart', '2021-12-22', 0),
('14', 'KORSİNİ-SAF AMBALAJ SANAYİ VE TİCARET A.Ş. EGE SERBEST BÖLGE ŞUBESİ', 875, 'Kart', '2021-12-22', 0),
('15', 'KORSİNİ-SAF AMBALAJ SANAYİ VE TİCARET A.Ş. EGE SERBEST BÖLGE ŞUBESİ', 700, 'Kart', '2021-12-22', 0),
('16', 'KORSİNİ-SAF AMBALAJ SANAYİ VE TİCARET A.Ş. EGE SERBEST BÖLGE ŞUBESİ', 665, 'Kart', '2021-12-22', 0),
('17', 'KORSİNİ-SAF AMBALAJ SANAYİ VE TİCARET A.Ş. EGE SERBEST BÖLGE ŞUBESİ', 525, 'Kart', '2021-12-22', 0),
('18', 'KORSİNİ-SAF AMBALAJ SANAYİ VE TİCARET A.Ş. EGE SERBEST BÖLGE ŞUBESİ', 490, 'Kart', '2021-12-22', 0),
('19', 'KORSİNİ-SAF AMBALAJ SANAYİ VE TİCARET A.Ş. EGE SERBEST BÖLGE ŞUBESİ', 700, 'Kart', '2021-12-22', 0),
('20', 'KORSİNİ-SAF AMBALAJ SANAYİ VE TİCARET A.Ş. EGE SERBEST BÖLGE ŞUBESİ', 595, 'Kart', '2021-12-22', 0),
('21', 'KORSİNİ-SAF AMBALAJ SANAYİ VE TİCARET A.Ş. EGE SERBEST BÖLGE ŞUBESİ', 455, 'Kart', '2021-12-22', 0),
('22', 'KORSİNİ-SAF AMBALAJ SANAYİ VE TİCARET A.Ş. EGE SERBEST BÖLGE ŞUBESİ', 700, 'Kart', '2021-12-22', 0),
('23', 'KORSİNİ-SAF AMBALAJ SANAYİ VE TİCARET A.Ş. EGE SERBEST BÖLGE ŞUBESİ', 525, 'Kart', '2021-12-22', 0),
('24', 'KORSİNİ-SAF AMBALAJ SANAYİ VE TİCARET A.Ş. EGE SERBEST BÖLGE ŞUBESİ', 770, 'Kart', '2021-12-22', 0),
('25', 'KORSİNİ-SAF AMBALAJ SANAYİ VE TİCARET A.Ş. EGE SERBEST BÖLGE ŞUBESİ', 875, 'Kart', '2021-12-22', 0),
('26', 'KORSİNİ-SAF AMBALAJ SANAYİ VE TİCARET A.Ş. EGE SERBEST BÖLGE ŞUBESİ', 455, 'Kart', '2021-12-22', 0),
('27', 'KORSİNİ-SAF AMBALAJ SANAYİ VE TİCARET A.Ş. EGE SERBEST BÖLGE ŞUBESİ', 490, 'Kart', '2021-12-22', 0),
('28', 'KORSİNİ-SAF AMBALAJ SANAYİ VE TİCARET A.Ş. EGE SERBEST BÖLGE ŞUBESİ', 525, 'Kart', '2021-12-22', 0),
('29', 'KORSİNİ-SAF AMBALAJ SANAYİ VE TİCARET A.Ş. EGE SERBEST BÖLGE ŞUBESİ', 490, 'Kart', '2021-12-22', 0),
('30', 'KORSİNİ-SAF AMBALAJ SANAYİ VE TİCARET A.Ş. EGE SERBEST BÖLGE ŞUBESİ', 665, 'Kart', '2021-12-22', 0),
('31', 'LAZERİZMİR METAL KESİM VE İŞLEME TEKNOLOJİLERİ MAKİNA İMALAT SAN. VE TİC. LTD. ŞTİ. ESB ŞUBESİ', 924, 'Nakit', '2021-12-22', 0),
('32', 'LAZERİZMİR METAL KESİM VE İŞLEME TEKNOLOJİLERİ MAKİNA İMALAT SAN. VE TİC. LTD. ŞTİ. ESB ŞUBESİ', 714, 'Nakit', '2021-12-22', 0),
('33', 'LAZERİZMİR METAL KESİM VE İŞLEME TEKNOLOJİLERİ MAKİNA İMALAT SAN. VE TİC. LTD. ŞTİ. ESB ŞUBESİ', 588, 'Nakit', '2021-12-22', 0),
('34', 'LAZERİZMİR METAL KESİM VE İŞLEME TEKNOLOJİLERİ MAKİNA İMALAT SAN. VE TİC. LTD. ŞTİ. ESB ŞUBESİ', 798, 'Nakit', '2021-12-22', 0),
('35', 'LAZERİZMİR METAL KESİM VE İŞLEME TEKNOLOJİLERİ MAKİNA İMALAT SAN. VE TİC. LTD. ŞTİ. ESB ŞUBESİ', 840, 'Nakit', '2021-12-22', 0),
('36', 'LAZERİZMİR METAL KESİM VE İŞLEME TEKNOLOJİLERİ MAKİNA İMALAT SAN. VE TİC. LTD. ŞTİ. ESB ŞUBESİ', 924, 'Nakit', '2021-12-22', 0),
('37', 'LAZERİZMİR METAL KESİM VE İŞLEME TEKNOLOJİLERİ MAKİNA İMALAT SAN. VE TİC. LTD. ŞTİ. ESB ŞUBESİ', 546, 'Nakit', '2021-12-22', 0),
('38', 'LAZERİZMİR METAL KESİM VE İŞLEME TEKNOLOJİLERİ MAKİNA İMALAT SAN. VE TİC. LTD. ŞTİ. ESB ŞUBESİ', 924, 'Nakit', '2021-12-22', 0),
('39', 'LAZERİZMİR METAL KESİM VE İŞLEME TEKNOLOJİLERİ MAKİNA İMALAT SAN. VE TİC. LTD. ŞTİ. ESB ŞUBESİ', 924, 'Nakit', '2021-12-22', 0),
('40', 'LAZERİZMİR METAL KESİM VE İŞLEME TEKNOLOJİLERİ MAKİNA İMALAT SAN. VE TİC. LTD. ŞTİ. ESB ŞUBESİ', 714, 'Nakit', '2021-12-22', 0),
('41', 'LAZERİZMİR METAL KESİM VE İŞLEME TEKNOLOJİLERİ MAKİNA İMALAT SAN. VE TİC. LTD. ŞTİ. ESB ŞUBESİ', 798, 'Nakit', '2021-12-22', 0),
('42', 'LAZERİZMİR METAL KESİM VE İŞLEME TEKNOLOJİLERİ MAKİNA İMALAT SAN. VE TİC. LTD. ŞTİ. ESB ŞUBESİ', 714, 'Nakit', '2021-12-22', 0),
('43', 'LAZERİZMİR METAL KESİM VE İŞLEME TEKNOLOJİLERİ MAKİNA İMALAT SAN. VE TİC. LTD. ŞTİ. ESB ŞUBESİ', 924, 'Nakit', '2021-12-22', 0),
('44', 'LAZERİZMİR METAL KESİM VE İŞLEME TEKNOLOJİLERİ MAKİNA İMALAT SAN. VE TİC. LTD. ŞTİ. ESB ŞUBESİ', 588, 'Nakit', '2021-12-22', 0),
('45', 'LAZERİZMİR METAL KESİM VE İŞLEME TEKNOLOJİLERİ MAKİNA İMALAT SAN. VE TİC. LTD. ŞTİ. ESB ŞUBESİ', 840, 'Nakit', '2021-12-22', 0),
('46', 'LAZERİZMİR METAL KESİM VE İŞLEME TEKNOLOJİLERİ MAKİNA İMALAT SAN. VE TİC. LTD. ŞTİ. ESB ŞUBESİ', 924, 'Nakit', '2021-12-22', 0),
('47', 'LAZERİZMİR METAL KESİM VE İŞLEME TEKNOLOJİLERİ MAKİNA İMALAT SAN. VE TİC. LTD. ŞTİ. ESB ŞUBESİ', 840, 'Nakit', '2021-12-22', 0),
('48', 'LAZERİZMİR METAL KESİM VE İŞLEME TEKNOLOJİLERİ MAKİNA İMALAT SAN. VE TİC. LTD. ŞTİ. ESB ŞUBESİ', 630, 'Nakit', '2021-12-22', 0),
('49', 'LAZERİZMİR METAL KESİM VE İŞLEME TEKNOLOJİLERİ MAKİNA İMALAT SAN. VE TİC. LTD. ŞTİ. ESB ŞUBESİ', 714, 'Nakit', '2021-12-22', 0),
('50', 'LAZERİZMİR METAL KESİM VE İŞLEME TEKNOLOJİLERİ MAKİNA İMALAT SAN. VE TİC. LTD. ŞTİ. ESB ŞUBESİ', 798, 'Nakit', '2021-12-22', 0),
('51', 'LAZERİZMİR METAL KESİM VE İŞLEME TEKNOLOJİLERİ MAKİNA İMALAT SAN. VE TİC. LTD. ŞTİ. ESB ŞUBESİ', 714, 'Nakit', '2021-12-22', 0),
('52', 'LAZERİZMİR METAL KESİM VE İŞLEME TEKNOLOJİLERİ MAKİNA İMALAT SAN. VE TİC. LTD. ŞTİ. ESB ŞUBESİ', 840, 'Nakit', '2021-12-22', 0),
('53', 'LAZERİZMİR METAL KESİM VE İŞLEME TEKNOLOJİLERİ MAKİNA İMALAT SAN. VE TİC. LTD. ŞTİ. ESB ŞUBESİ', 924, 'Nakit', '2021-12-22', 0),
('54', 'LAZERİZMİR METAL KESİM VE İŞLEME TEKNOLOJİLERİ MAKİNA İMALAT SAN. VE TİC. LTD. ŞTİ. ESB ŞUBESİ', 798, 'Nakit', '2021-12-22', 0),
('55', 'LAZERİZMİR METAL KESİM VE İŞLEME TEKNOLOJİLERİ MAKİNA İMALAT SAN. VE TİC. LTD. ŞTİ. ESB ŞUBESİ', 588, 'Nakit', '2021-12-22', 0),
('56', 'LAZERİZMİR METAL KESİM VE İŞLEME TEKNOLOJİLERİ MAKİNA İMALAT SAN. VE TİC. LTD. ŞTİ. ESB ŞUBESİ', 714, 'Nakit', '2021-12-22', 0),
('57', 'LAZERİZMİR METAL KESİM VE İŞLEME TEKNOLOJİLERİ MAKİNA İMALAT SAN. VE TİC. LTD. ŞTİ. ESB ŞUBESİ', 924, 'Nakit', '2021-12-22', 0),
('58', 'LAZERİZMİR METAL KESİM VE İŞLEME TEKNOLOJİLERİ MAKİNA İMALAT SAN. VE TİC. LTD. ŞTİ. ESB ŞUBESİ', 588, 'Nakit', '2021-12-22', 0),
('59', 'LAZERİZMİR METAL KESİM VE İŞLEME TEKNOLOJİLERİ MAKİNA İMALAT SAN. VE TİC. LTD. ŞTİ. ESB ŞUBESİ', 924, 'Nakit', '2021-12-22', 0),
('60', 'LAZERİZMİR METAL KESİM VE İŞLEME TEKNOLOJİLERİ MAKİNA İMALAT SAN. VE TİC. LTD. ŞTİ. ESB ŞUBESİ', 1050, 'Nakit', '2021-12-22', 0),
('61', 'MECALAC İŞ MAKİNALARI SANAYİ VE TİCARET LTD. ŞTİ.', 960, 'Kart', '2021-12-22', 0),
('62', 'MECALAC İŞ MAKİNALARI SANAYİ VE TİCARET LTD. ŞTİ.', 672, 'Kart', '2021-12-22', 0),
('63', 'MECALAC İŞ MAKİNALARI SANAYİ VE TİCARET LTD. ŞTİ.', 1056, 'Kart', '2021-12-22', 0),
('64', 'MECALAC İŞ MAKİNALARI SANAYİ VE TİCARET LTD. ŞTİ.', 1200, 'Kart', '2021-12-22', 0),
('65', 'MECALAC İŞ MAKİNALARI SANAYİ VE TİCARET LTD. ŞTİ.', 720, 'Kart', '2021-12-22', 0),
('66', 'MECALAC İŞ MAKİNALARI SANAYİ VE TİCARET LTD. ŞTİ.', 1056, 'Kart', '2021-12-22', 0),
('67', 'MECALAC İŞ MAKİNALARI SANAYİ VE TİCARET LTD. ŞTİ.', 624, 'Kart', '2021-12-22', 0),
('68', 'MECALAC İŞ MAKİNALARI SANAYİ VE TİCARET LTD. ŞTİ.', 1200, 'Kart', '2021-12-22', 0),
('69', 'MECALAC İŞ MAKİNALARI SANAYİ VE TİCARET LTD. ŞTİ.', 912, 'Kart', '2021-12-22', 0),
('70', 'MECALAC İŞ MAKİNALARI SANAYİ VE TİCARET LTD. ŞTİ.', 816, 'Kart', '2021-12-22', 0),
('71', 'MECALAC İŞ MAKİNALARI SANAYİ VE TİCARET LTD. ŞTİ.', 672, 'Kart', '2021-12-22', 0),
('72', 'MECALAC İŞ MAKİNALARI SANAYİ VE TİCARET LTD. ŞTİ.', 960, 'Kart', '2021-12-22', 0),
('73', 'MECALAC İŞ MAKİNALARI SANAYİ VE TİCARET LTD. ŞTİ.', 912, 'Kart', '2021-12-22', 0),
('74', 'MECALAC İŞ MAKİNALARI SANAYİ VE TİCARET LTD. ŞTİ.', 672, 'Kart', '2021-12-22', 0),
('75', 'MECALAC İŞ MAKİNALARI SANAYİ VE TİCARET LTD. ŞTİ.', 1200, 'Kart', '2021-12-22', 0),
('76', 'MECALAC İŞ MAKİNALARI SANAYİ VE TİCARET LTD. ŞTİ.', 720, 'Kart', '2021-12-22', 0),
('77', 'MECALAC İŞ MAKİNALARI SANAYİ VE TİCARET LTD. ŞTİ.', 624, 'Kart', '2021-12-22', 0),
('78', 'MECALAC İŞ MAKİNALARI SANAYİ VE TİCARET LTD. ŞTİ.', 1056, 'Kart', '2021-12-22', 0),
('79', 'MECALAC İŞ MAKİNALARI SANAYİ VE TİCARET LTD. ŞTİ.', 1056, 'Kart', '2021-12-22', 0),
('80', 'MECALAC İŞ MAKİNALARI SANAYİ VE TİCARET LTD. ŞTİ.', 624, 'Kart', '2021-12-22', 0),
('81', 'MECALAC İŞ MAKİNALARI SANAYİ VE TİCARET LTD. ŞTİ.', 912, 'Kart', '2021-12-22', 0),
('82', 'MECALAC İŞ MAKİNALARI SANAYİ VE TİCARET LTD. ŞTİ.', 672, 'Kart', '2021-12-22', 0),
('83', 'MECALAC İŞ MAKİNALARI SANAYİ VE TİCARET LTD. ŞTİ.', 912, 'Kart', '2021-12-22', 0),
('84', 'MECALAC İŞ MAKİNALARI SANAYİ VE TİCARET LTD. ŞTİ.', 1056, 'Kart', '2021-12-22', 0),
('85', 'MECALAC İŞ MAKİNALARI SANAYİ VE TİCARET LTD. ŞTİ.', 912, 'Kart', '2021-12-22', 0),
('86', 'MECALAC İŞ MAKİNALARI SANAYİ VE TİCARET LTD. ŞTİ.', 1056, 'Kart', '2021-12-22', 0),
('87', 'MECALAC İŞ MAKİNALARI SANAYİ VE TİCARET LTD. ŞTİ.', 1056, 'Kart', '2021-12-22', 0),
('88', 'MECALAC İŞ MAKİNALARI SANAYİ VE TİCARET LTD. ŞTİ.', 1056, 'Kart', '2021-12-22', 0),
('89', 'MECALAC İŞ MAKİNALARI SANAYİ VE TİCARET LTD. ŞTİ.', 960, 'Kart', '2021-12-22', 0),
('90', 'MECALAC İŞ MAKİNALARI SANAYİ VE TİCARET LTD. ŞTİ.', 1056, 'Kart', '2021-12-22', 0),
('91', 'ORTOPRO TIBBİ ALETLER SANAYİ VE TİCARET A.Ş. E.S.B. ŞUBESİ', 629, 'Nakit', '2021-12-22', 0),
('92', 'ORTOPRO TIBBİ ALETLER SANAYİ VE TİCARET A.Ş. E.S.B. ŞUBESİ', 814, 'Nakit', '2021-12-22', 0),
('93', 'ORTOPRO TIBBİ ALETLER SANAYİ VE TİCARET A.Ş. E.S.B. ŞUBESİ', 629, 'Nakit', '2021-12-22', 0),
('94', 'ORTOPRO TIBBİ ALETLER SANAYİ VE TİCARET A.Ş. E.S.B. ŞUBESİ', 629, 'Nakit', '2021-12-22', 0),
('95', 'ORTOPRO TIBBİ ALETLER SANAYİ VE TİCARET A.Ş. E.S.B. ŞUBESİ', 555, 'Nakit', '2021-12-22', 0),
('96', 'ORTOPRO TIBBİ ALETLER SANAYİ VE TİCARET A.Ş. E.S.B. ŞUBESİ', 925, 'Nakit', '2021-12-22', 0),
('97', 'ORTOPRO TIBBİ ALETLER SANAYİ VE TİCARET A.Ş. E.S.B. ŞUBESİ', 703, 'Nakit', '2021-12-22', 0),
('98', 'ORTOPRO TIBBİ ALETLER SANAYİ VE TİCARET A.Ş. E.S.B. ŞUBESİ', 925, 'Nakit', '2021-12-22', 0),
('99', 'ORTOPRO TIBBİ ALETLER SANAYİ VE TİCARET A.Ş. E.S.B. ŞUBESİ', 703, 'Nakit', '2021-12-22', 0),
('100', 'ORTOPRO TIBBİ ALETLER SANAYİ VE TİCARET A.Ş. E.S.B. ŞUBESİ', 814, 'Nakit', '2021-12-22', 0),
('101', 'ORTOPRO TIBBİ ALETLER SANAYİ VE TİCARET A.Ş. E.S.B. ŞUBESİ', 925, 'Nakit', '2021-12-22', 0),
('102', 'ORTOPRO TIBBİ ALETLER SANAYİ VE TİCARET A.Ş. E.S.B. ŞUBESİ', 703, 'Nakit', '2021-12-22', 0),
('103', 'ORTOPRO TIBBİ ALETLER SANAYİ VE TİCARET A.Ş. E.S.B. ŞUBESİ', 518, 'Nakit', '2021-12-22', 0),
('104', 'ORTOPRO TIBBİ ALETLER SANAYİ VE TİCARET A.Ş. E.S.B. ŞUBESİ', 925, 'Nakit', '2021-12-22', 0),
('105', 'ORTOPRO TIBBİ ALETLER SANAYİ VE TİCARET A.Ş. E.S.B. ŞUBESİ', 518, 'Nakit', '2021-12-22', 0),
('106', 'ORTOPRO TIBBİ ALETLER SANAYİ VE TİCARET A.Ş. E.S.B. ŞUBESİ', 814, 'Nakit', '2021-12-22', 0),
('107', 'ORTOPRO TIBBİ ALETLER SANAYİ VE TİCARET A.Ş. E.S.B. ŞUBESİ', 481, 'Nakit', '2021-12-22', 0),
('108', 'ORTOPRO TIBBİ ALETLER SANAYİ VE TİCARET A.Ş. E.S.B. ŞUBESİ', 814, 'Nakit', '2021-12-22', 0),
('109', 'ORTOPRO TIBBİ ALETLER SANAYİ VE TİCARET A.Ş. E.S.B. ŞUBESİ', 481, 'Nakit', '2021-12-22', 0),
('110', 'ORTOPRO TIBBİ ALETLER SANAYİ VE TİCARET A.Ş. E.S.B. ŞUBESİ', 814, 'Nakit', '2021-12-22', 0),
('111', 'ORTOPRO TIBBİ ALETLER SANAYİ VE TİCARET A.Ş. E.S.B. ŞUBESİ', 518, 'Nakit', '2021-12-22', 0),
('112', 'ORTOPRO TIBBİ ALETLER SANAYİ VE TİCARET A.Ş. E.S.B. ŞUBESİ', 481, 'Nakit', '2021-12-22', 0),
('113', 'ORTOPRO TIBBİ ALETLER SANAYİ VE TİCARET A.Ş. E.S.B. ŞUBESİ', 703, 'Nakit', '2021-12-22', 0),
('114', 'ORTOPRO TIBBİ ALETLER SANAYİ VE TİCARET A.Ş. E.S.B. ŞUBESİ', 481, 'Nakit', '2021-12-22', 0),
('115', 'ORTOPRO TIBBİ ALETLER SANAYİ VE TİCARET A.Ş. E.S.B. ŞUBESİ', 629, 'Nakit', '2021-12-22', 0),
('116', 'ORTOPRO TIBBİ ALETLER SANAYİ VE TİCARET A.Ş. E.S.B. ŞUBESİ', 740, 'Nakit', '2021-12-23', 0),
('117', 'ORTOPRO TIBBİ ALETLER SANAYİ VE TİCARET A.Ş. E.S.B. ŞUBESİ', 629, 'Nakit', '2021-12-23', 0),
('118', 'ORTOPRO TIBBİ ALETLER SANAYİ VE TİCARET A.Ş. E.S.B. ŞUBESİ', 740, 'Nakit', '2021-12-23', 0),
('119', 'ORTOPRO TIBBİ ALETLER SANAYİ VE TİCARET A.Ş. E.S.B. ŞUBESİ', 518, 'Nakit', '2021-12-23', 0),
('120', 'ORTOPRO TIBBİ ALETLER SANAYİ VE TİCARET A.Ş. E.S.B. ŞUBESİ', 703, 'Nakit', '2021-12-23', 0),
('121', 'OZ OPTICS A.Ş.', 760, 'Kart', '2021-12-23', 0),
('122', 'OZ OPTICS A.Ş.', 880, 'Kart', '2021-12-23', 0),
('123', 'OZ OPTICS A.Ş.', 760, 'Kart', '2021-12-23', 0),
('124', 'OZ OPTICS A.Ş.', 880, 'Kart', '2021-12-23', 0),
('125', 'OZ OPTICS A.Ş.', 680, 'Kart', '2021-12-23', 0),
('126', 'OZ OPTICS A.Ş.', 1000, 'Kart', '2021-12-23', 0),
('127', 'OZ OPTICS A.Ş.', 520, 'Kart', '2021-12-23', 0),
('128', 'OZ OPTICS A.Ş.', 1000, 'Kart', '2021-12-23', 0),
('129', 'OZ OPTICS A.Ş.', 560, 'Kart', '2021-12-23', 0),
('130', 'OZ OPTICS A.Ş.', 520, 'Kart', '2021-12-23', 0),
('131', 'OZ OPTICS A.Ş.', 760, 'Kart', '2021-12-23', 0),
('132', 'OZ OPTICS A.Ş.', 680, 'Kart', '2021-12-23', 0),
('133', 'OZ OPTICS A.Ş.', 880, 'Kart', '2021-12-23', 0),
('134', 'OZ OPTICS A.Ş.', 520, 'Kart', '2021-12-23', 0),
('135', 'OZ OPTICS A.Ş.', 760, 'Kart', '2021-12-23', 0),
('136', 'OZ OPTICS A.Ş.', 560, 'Kart', '2021-12-23', 0),
('137', 'OZ OPTICS A.Ş.', 880, 'Kart', '2021-12-23', 0),
('138', 'OZ OPTICS A.Ş.', 1000, 'Kart', '2021-12-23', 0),
('139', 'OZ OPTICS A.Ş.', 560, 'Kart', '2021-12-23', 0),
('140', 'OZ OPTICS A.Ş.', 800, 'Kart', '2021-12-23', 0),
('141', 'OZ OPTICS A.Ş.', 880, 'Kart', '2021-12-23', 0),
('142', 'OZ OPTICS A.Ş.', 520, 'Kart', '2021-12-23', 0),
('143', 'OZ OPTICS A.Ş.', 520, 'Kart', '2021-12-23', 0),
('144', 'OZ OPTICS A.Ş.', 1000, 'Kart', '2021-12-23', 0),
('145', 'OZ OPTICS A.Ş.', 760, 'Kart', '2021-12-23', 0),
('146', 'OZ OPTICS A.Ş.', 1000, 'Kart', '2021-12-23', 0),
('147', 'OZ OPTICS A.Ş.', 680, 'Kart', '2021-12-23', 0),
('148', 'OZ OPTICS A.Ş.', 520, 'Kart', '2021-12-23', 0),
('149', 'OZ OPTICS A.Ş.', 880, 'Kart', '2021-12-23', 0),
('150', 'OZ OPTICS A.Ş.', 760, 'Kart', '2021-12-23', 0);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `gider`
--

DROP TABLE IF EXISTS `gider`;
CREATE TABLE IF NOT EXISTS `gider` (
  `gider_id` int(11) NOT NULL AUTO_INCREMENT,
  `gider_tur_id` int(11) NOT NULL,
  `gider_ucret` int(11) NOT NULL,
  `ay_id` int(11) NOT NULL,
  `gider_tarih` date NOT NULL,
  PRIMARY KEY (`gider_id`),
  KEY `gider_tur_id` (`gider_tur_id`),
  KEY `ay_idddd` (`ay_id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `gider`
--

INSERT INTO `gider` (`gider_id`, `gider_tur_id`, `gider_ucret`, `ay_id`, `gider_tarih`) VALUES
(2, 4, 4500, 6, '2021-06-15'),
(3, 2, 3600, 6, '2021-06-15'),
(4, 3, 4000, 6, '2021-06-15'),
(5, 5, 6000, 6, '2021-06-15'),
(6, 6, 7800, 6, '2021-12-15'),
(7, 1, 5600, 7, '2021-07-15'),
(8, 2, 5200, 7, '2021-07-15'),
(9, 3, 4700, 7, '2021-07-15'),
(10, 4, 4500, 7, '2021-07-15'),
(11, 5, 6000, 7, '2021-07-15'),
(12, 6, 9800, 7, '2021-07-15'),
(13, 1, 5200, 8, '2021-08-15'),
(14, 2, 7500, 8, '2021-08-15'),
(15, 3, 6500, 8, '2021-08-15'),
(16, 4, 4500, 8, '2021-08-15'),
(17, 5, 6000, 8, '2021-08-15'),
(18, 6, 5400, 8, '2021-08-15'),
(19, 1, 5800, 6, '2021-06-15'),
(20, 1, 4800, 9, '2021-09-15'),
(21, 2, 6800, 9, '2021-09-15'),
(22, 3, 4300, 9, '2021-09-15'),
(23, 4, 4500, 9, '2021-09-15'),
(24, 5, 6000, 9, '2021-09-15'),
(25, 6, 8400, 9, '2021-09-15'),
(26, 1, 4600, 10, '2021-10-15'),
(27, 2, 3500, 10, '2021-10-15'),
(28, 3, 2500, 10, '2021-10-15'),
(29, 4, 4500, 10, '2021-10-15'),
(30, 5, 6000, 10, '2021-10-15'),
(31, 6, 7800, 10, '2021-10-15'),
(32, 3, 4100, 11, '2021-11-15'),
(33, 4, 4500, 11, '2021-11-15'),
(34, 5, 6000, 11, '2021-11-15'),
(35, 6, 4800, 11, '2021-11-15'),
(36, 1, 5900, 11, '2021-11-15'),
(37, 2, 5400, 11, '2021-11-15');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `gider_tur`
--

DROP TABLE IF EXISTS `gider_tur`;
CREATE TABLE IF NOT EXISTS `gider_tur` (
  `gider_tur_id` int(11) NOT NULL,
  `gider_tur` varchar(255) COLLATE utf8_turkish_ci NOT NULL,
  PRIMARY KEY (`gider_tur_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `gider_tur`
--

INSERT INTO `gider_tur` (`gider_tur_id`, `gider_tur`) VALUES
(1, 'Fatura'),
(2, 'Yemek Malzemesi'),
(3, 'Dağıtım Giderleri'),
(4, 'Kira '),
(5, 'Çalışan Ücretleri'),
(6, 'Diğer');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `menu`
--

DROP TABLE IF EXISTS `menu`;
CREATE TABLE IF NOT EXISTS `menu` (
  `menu_no` int(5) NOT NULL AUTO_INCREMENT,
  `menu_ad` varchar(255) COLLATE utf8_turkish_ci NOT NULL,
  `fiyat` int(20) NOT NULL,
  PRIMARY KEY (`menu_no`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `menu`
--

INSERT INTO `menu` (`menu_no`, `menu_ad`, `fiyat`) VALUES
(1, 'Menü 1', 17),
(2, 'Menü 2 ', 15),
(3, 'Menü 3', 14),
(4, 'Menü 4', 13),
(5, 'Menü 5', 19),
(6, 'Menü 6', 20),
(7, 'Menü 7', 17),
(8, 'Menü 8', 22),
(9, 'Menü 9', 25),
(10, 'Menü 10', 22);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `odeme_turu`
--

DROP TABLE IF EXISTS `odeme_turu`;
CREATE TABLE IF NOT EXISTS `odeme_turu` (
  `odeme_turu_id` int(5) NOT NULL,
  `odeme_turu` varchar(11) COLLATE utf8_turkish_ci NOT NULL,
  PRIMARY KEY (`odeme_turu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `odeme_turu`
--

INSERT INTO `odeme_turu` (`odeme_turu_id`, `odeme_turu`) VALUES
(1, 'Nakit'),
(2, 'Kart');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `puan`
--

DROP TABLE IF EXISTS `puan`;
CREATE TABLE IF NOT EXISTS `puan` (
  `puan` int(11) NOT NULL,
  PRIMARY KEY (`puan`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `puan`
--

INSERT INTO `puan` (`puan`) VALUES
(1),
(2),
(3),
(4),
(5),
(6),
(7),
(8),
(9),
(10);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `saat`
--

DROP TABLE IF EXISTS `saat`;
CREATE TABLE IF NOT EXISTS `saat` (
  `saat` time NOT NULL,
  PRIMARY KEY (`saat`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `saat`
--

INSERT INTO `saat` (`saat`) VALUES
('02:00:00'),
('02:30:00'),
('03:00:00'),
('03:30:00'),
('04:00:00'),
('11:30:00'),
('12:00:00'),
('12:30:00'),
('13:00:00'),
('13:30:00'),
('19:00:00'),
('19:30:00'),
('20:00:00'),
('20:30:00');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `siparisler`
--

DROP TABLE IF EXISTS `siparisler`;
CREATE TABLE IF NOT EXISTS `siparisler` (
  `siparis_id` int(11) NOT NULL,
  `saat` time NOT NULL,
  `tarih` date NOT NULL,
  `sirket_id` int(5) NOT NULL,
  `menu_no` int(11) NOT NULL,
  `adet` int(11) NOT NULL,
  `odeme_turu_id` int(5) NOT NULL,
  `ay_id` int(11) NOT NULL,
  PRIMARY KEY (`siparis_id`,`menu_no`),
  KEY `saat` (`saat`),
  KEY `tarih` (`tarih`),
  KEY `odeme_turu_id` (`odeme_turu_id`),
  KEY `sirket_id` (`sirket_id`),
  KEY `menu_no` (`menu_no`),
  KEY `ay_id` (`ay_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `siparisler`
--

INSERT INTO `siparisler` (`siparis_id`, `saat`, `tarih`, `sirket_id`, `menu_no`, `adet`, `odeme_turu_id`, `ay_id`) VALUES
(1, '12:00:00', '2021-06-01', 15, 10, 35, 2, 6),
(2, '12:00:00', '2021-06-02', 15, 4, 35, 2, 6),
(3, '12:00:00', '2021-06-03', 15, 5, 35, 2, 6),
(4, '12:00:00', '2021-06-04', 15, 1, 35, 2, 6),
(5, '12:00:00', '2021-06-05', 15, 2, 35, 2, 6),
(6, '12:00:00', '2021-07-01', 15, 10, 25, 2, 7),
(7, '12:00:00', '2021-07-02', 15, 4, 30, 2, 7),
(8, '12:00:00', '2021-07-03', 15, 9, 25, 2, 7),
(9, '12:00:00', '2021-07-04', 15, 6, 30, 2, 7),
(10, '12:00:00', '2021-07-05', 15, 5, 30, 2, 7),
(11, '12:00:00', '2021-08-01', 15, 10, 35, 2, 8),
(12, '12:00:00', '2021-08-02', 15, 3, 35, 2, 8),
(13, '12:00:00', '2021-08-03', 15, 10, 35, 2, 8),
(14, '12:00:00', '2021-08-04', 15, 9, 35, 2, 8),
(15, '12:00:00', '2021-08-05', 15, 6, 35, 2, 8),
(16, '12:00:00', '2021-09-01', 15, 5, 35, 2, 9),
(17, '12:00:00', '2021-08-02', 15, 2, 35, 2, 8),
(18, '12:00:00', '2021-09-03', 15, 3, 35, 2, 9),
(19, '12:00:00', '2021-09-04', 15, 6, 35, 2, 9),
(20, '12:00:00', '2021-09-05', 15, 1, 35, 2, 9),
(21, '12:00:00', '2021-10-01', 15, 4, 35, 2, 10),
(22, '12:00:00', '2021-10-02', 15, 6, 35, 2, 10),
(23, '12:00:00', '2021-10-03', 15, 2, 35, 2, 10),
(24, '12:00:00', '2021-10-04', 15, 10, 35, 2, 10),
(25, '12:00:00', '2021-10-05', 15, 9, 35, 2, 10),
(26, '12:00:00', '2021-11-01', 15, 4, 35, 2, 11),
(27, '12:00:00', '2021-11-02', 15, 3, 35, 2, 11),
(28, '12:00:00', '2021-11-03', 15, 2, 35, 2, 11),
(29, '12:00:00', '2021-11-04', 15, 3, 35, 2, 11),
(30, '12:00:00', '2021-11-05', 15, 5, 35, 2, 11),
(31, '12:30:00', '2021-06-01', 14, 8, 42, 1, 6),
(32, '12:30:00', '2021-06-02', 14, 7, 42, 1, 6),
(33, '12:30:00', '2021-06-03', 14, 3, 42, 1, 6),
(34, '12:30:00', '2021-06-04', 14, 5, 42, 1, 6),
(35, '12:30:00', '2021-06-05', 14, 6, 42, 1, 6),
(36, '12:30:00', '2021-07-01', 14, 8, 42, 1, 7),
(37, '12:30:00', '2021-07-02', 14, 4, 42, 1, 7),
(38, '12:30:00', '2021-07-03', 14, 8, 42, 1, 7),
(39, '12:30:00', '2021-07-04', 14, 10, 42, 1, 7),
(40, '12:30:00', '2021-07-05', 14, 7, 42, 1, 7),
(41, '12:30:00', '2021-08-01', 14, 5, 42, 1, 8),
(42, '12:30:00', '2021-08-02', 14, 7, 42, 1, 8),
(43, '12:30:00', '2021-08-03', 14, 8, 42, 1, 8),
(44, '12:30:00', '2021-08-04', 14, 3, 42, 1, 8),
(45, '12:30:00', '2021-08-05', 14, 6, 42, 1, 8),
(46, '12:30:00', '2021-09-01', 14, 10, 42, 1, 9),
(47, '12:30:00', '2021-09-02', 14, 6, 42, 1, 9),
(48, '12:30:00', '2021-09-03', 14, 2, 42, 1, 10),
(49, '12:30:00', '2021-09-04', 14, 1, 42, 1, 11),
(50, '12:30:00', '2021-09-05', 14, 5, 42, 1, 9),
(51, '12:30:00', '2021-10-01', 14, 7, 42, 1, 10),
(52, '12:30:00', '2021-10-02', 14, 6, 42, 1, 10),
(53, '12:30:00', '2021-10-03', 14, 10, 42, 1, 10),
(54, '12:30:00', '2021-10-04', 14, 5, 42, 1, 10),
(55, '12:30:00', '2021-10-05', 14, 3, 42, 1, 10),
(56, '12:30:00', '2021-11-01', 14, 7, 42, 1, 11),
(57, '12:30:00', '2021-11-02', 14, 10, 42, 1, 11),
(58, '12:30:00', '2021-11-03', 14, 3, 42, 1, 11),
(59, '12:30:00', '2021-11-04', 14, 8, 42, 1, 11),
(60, '12:30:00', '2021-11-05', 14, 9, 42, 1, 11),
(61, '12:00:00', '2021-06-01', 13, 6, 37, 2, 6),
(62, '12:00:00', '2021-06-02', 13, 3, 36, 2, 6),
(63, '12:00:00', '2021-06-03', 13, 8, 36, 2, 6),
(64, '12:00:00', '2021-06-04', 13, 9, 37, 2, 6),
(65, '12:00:00', '2021-07-05', 13, 2, 37, 2, 7),
(66, '12:00:00', '2021-07-01', 13, 8, 48, 2, 7),
(67, '12:00:00', '2021-07-02', 13, 4, 48, 2, 7),
(68, '12:00:00', '2021-07-03', 13, 9, 48, 2, 7),
(69, '12:00:00', '2021-07-04', 13, 5, 48, 2, 7),
(70, '12:00:00', '2021-07-05', 13, 7, 48, 2, 7),
(71, '12:00:00', '2021-08-01', 13, 3, 35, 2, 8),
(72, '12:00:00', '2021-08-02', 13, 6, 32, 2, 8),
(73, '12:00:00', '2021-08-03', 13, 5, 30, 2, 8),
(74, '12:00:00', '2021-08-04', 13, 3, 37, 2, 8),
(75, '12:00:00', '2021-08-05', 13, 9, 33, 2, 8),
(76, '12:00:00', '2021-09-01', 13, 2, 48, 2, 9),
(77, '12:00:00', '2021-09-02', 13, 4, 35, 2, 9),
(78, '12:00:00', '2021-09-03', 13, 10, 30, 2, 9),
(79, '12:00:00', '2021-09-04', 13, 10, 35, 2, 9),
(80, '12:00:00', '2021-09-05', 13, 4, 35, 2, 9),
(81, '12:00:00', '2021-10-01', 13, 5, 48, 2, 10),
(82, '12:00:00', '2021-10-02', 13, 3, 48, 2, 10),
(83, '12:00:00', '2021-10-03', 13, 5, 48, 2, 10),
(84, '12:00:00', '2021-10-04', 13, 8, 48, 2, 10),
(85, '12:00:00', '2021-10-05', 13, 5, 48, 2, 10),
(86, '12:00:00', '2021-11-01', 13, 10, 48, 2, 11),
(87, '12:00:00', '2021-11-02', 13, 8, 48, 2, 11),
(88, '12:00:00', '2021-11-03', 13, 10, 48, 2, 11),
(89, '12:00:00', '2021-11-04', 13, 6, 48, 2, 11),
(90, '12:00:00', '2021-11-05', 13, 10, 48, 2, 11),
(91, '12:00:00', '2021-06-01', 12, 1, 37, 1, 7),
(92, '12:00:00', '2021-06-02', 12, 8, 37, 1, 6),
(93, '12:00:00', '2021-06-03', 12, 1, 37, 1, 6),
(94, '12:00:00', '2021-06-04', 12, 1, 37, 1, 6),
(95, '12:00:00', '2021-06-05', 12, 2, 37, 1, 6),
(96, '12:00:00', '2021-07-01', 12, 9, 37, 1, 7),
(97, '12:00:00', '2021-07-02', 12, 5, 37, 1, 7),
(98, '12:00:00', '2021-07-03', 12, 9, 37, 1, 7),
(99, '12:00:00', '2021-07-04', 12, 5, 37, 1, 7),
(100, '12:00:00', '2021-07-05', 12, 8, 37, 1, 7),
(101, '12:00:00', '2021-08-01', 12, 9, 37, 1, 8),
(102, '12:00:00', '2021-08-02', 12, 5, 37, 1, 8),
(103, '12:00:00', '2021-08-03', 12, 3, 37, 1, 8),
(104, '12:00:00', '2021-08-04', 12, 9, 37, 1, 8),
(105, '12:00:00', '2021-08-05', 12, 3, 37, 1, 8),
(106, '12:00:00', '2021-09-01', 12, 7, 37, 1, 9),
(107, '12:00:00', '2021-09-02', 12, 4, 37, 1, 9),
(108, '12:00:00', '2021-09-03', 12, 8, 37, 1, 9),
(109, '12:00:00', '2021-09-04', 12, 4, 37, 1, 9),
(110, '12:00:00', '2021-09-05', 12, 8, 37, 1, 9),
(111, '12:00:00', '2021-10-01', 12, 3, 37, 1, 10),
(112, '12:00:00', '2021-10-02', 12, 4, 37, 1, 10),
(113, '12:00:00', '2021-10-03', 12, 5, 37, 1, 10),
(114, '12:00:00', '2021-10-04', 12, 4, 37, 1, 10),
(115, '12:00:00', '2021-10-05', 12, 1, 37, 1, 10),
(116, '12:00:00', '2021-11-01', 12, 6, 37, 1, 11),
(117, '12:00:00', '2021-11-02', 12, 7, 37, 1, 11),
(118, '12:00:00', '2021-11-03', 12, 6, 37, 1, 11),
(119, '12:00:00', '2021-11-04', 12, 3, 37, 1, 11),
(120, '12:00:00', '2021-11-05', 12, 5, 37, 1, 11),
(121, '13:00:00', '2021-06-01', 11, 5, 40, 2, 6),
(122, '13:00:00', '2021-06-02', 11, 8, 40, 2, 6),
(123, '13:00:00', '2021-06-03', 11, 5, 40, 2, 6),
(124, '13:00:00', '2021-06-04', 11, 8, 40, 2, 6),
(125, '13:00:00', '2021-06-05', 11, 7, 40, 2, 6),
(126, '13:00:00', '2021-07-01', 11, 9, 40, 2, 7),
(127, '13:00:00', '2021-07-02', 11, 4, 40, 2, 7),
(128, '13:00:00', '2021-07-03', 11, 9, 40, 2, 7),
(129, '13:00:00', '2021-07-04', 11, 3, 40, 2, 7),
(130, '13:00:00', '2021-07-05', 11, 4, 40, 2, 7),
(131, '13:00:00', '2021-08-01', 11, 5, 40, 2, 8),
(132, '13:00:00', '2021-08-02', 11, 1, 40, 2, 8),
(133, '13:00:00', '2021-08-03', 11, 8, 40, 2, 8),
(134, '13:00:00', '2021-08-04', 11, 4, 40, 2, 8),
(135, '13:00:00', '2021-08-05', 11, 5, 40, 2, 8),
(136, '13:00:00', '2021-09-01', 11, 3, 45, 2, 9),
(137, '13:00:00', '2021-09-02', 11, 8, 45, 2, 9),
(138, '13:00:00', '2021-09-03', 11, 9, 45, 2, 9),
(139, '13:00:00', '2021-09-04', 11, 3, 40, 2, 9),
(140, '13:00:00', '2021-09-05', 11, 6, 45, 2, 9),
(141, '13:00:00', '2021-10-01', 11, 10, 45, 2, 10),
(142, '13:00:00', '2021-10-02', 11, 4, 40, 2, 10),
(143, '13:00:00', '2021-10-03', 11, 4, 45, 2, 10),
(144, '13:00:00', '2021-10-04', 11, 9, 40, 2, 10),
(145, '13:00:00', '2021-10-05', 11, 5, 45, 2, 10),
(146, '13:00:00', '2021-11-01', 11, 9, 45, 2, 11),
(147, '13:00:00', '2021-11-02', 11, 7, 40, 2, 11),
(148, '13:00:00', '2021-11-03', 11, 4, 45, 2, 11),
(149, '13:00:00', '2021-11-04', 11, 10, 40, 2, 11),
(150, '13:00:00', '2021-11-05', 11, 5, 40, 2, 11);

--
-- Tetikleyiciler `siparisler`
--
DROP TRIGGER IF EXISTS `faturaa`;
DELIMITER $$
CREATE TRIGGER `faturaa` AFTER INSERT ON `siparisler` FOR EACH ROW INSERT INTO fatura
VALUES(new.siparis_id,(SELECT sirketler.sirket_ad FROM sirketler WHERE sirketler.sirket_id=new.sirket_id),(new.adet*(SELECT menu.fiyat FROM menu WHERE menu.menu_no=new.menu_no)),(SELECT odeme_turu.odeme_turu FROM odeme_turu WHERE odeme_turu.odeme_turu_id=new.odeme_turu_id),now())
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `sirketler`
--

DROP TABLE IF EXISTS `sirketler`;
CREATE TABLE IF NOT EXISTS `sirketler` (
  `sirket_id` int(5) NOT NULL,
  `sirket_ad` varchar(255) COLLATE utf8_turkish_ci NOT NULL,
  `sirket_tel` varchar(20) COLLATE utf8_turkish_ci NOT NULL,
  PRIMARY KEY (`sirket_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `sirketler`
--

INSERT INTO `sirketler` (`sirket_id`, `sirket_ad`, `sirket_tel`) VALUES
(1, 'ZERODENSİTY YAZILIM ANONİM ŞİRKETİ', '02325031133'),
(2, 'TOSHIBA CORPORATION', '02122817323'),
(3, 'TAŞÇI TEKSTİL KONFEKSİYON DIŞ TİC. VE SAN. LTD. ŞTİ.', '02322518687'),
(4, 'SWİTCH İNTERNATİONAL BOWLİNG EKİPMANLARI A.Ş. EGE SERBEST BÖLGE ŞUBESİ', '02327990344'),
(5, 'STACKPOLE INTERNATIONAL OTOMOTİV ÜRÜNLERİ LTD. ŞTİ.', '02324559060'),
(6, 'SML MASCHİNENGESELLSCHAFT MBH', '02322200254'),
(7, 'S.P.M. OTOMOTİV ENDÜSTRİSİ VE TİC. A.Ş.', '02322521637'),
(8, 'ROY ROBSON FASHION TEKSTİL KONFEKSİYON SAN. VE TİC. A.Ş.', '02322580157'),
(9, 'ROPİX GİYİM SANAYİ LTD. ŞTİ.	', '02322519488'),
(10, 'PFW HAVACILIK SAN. VE DIŞ TİC. LTD.ŞTİ.', '02322521555'),
(11, 'OZ OPTICS A.Ş.', '02322523531'),
(12, 'ORTOPRO TIBBİ ALETLER SANAYİ VE TİCARET A.Ş. E.S.B. ŞUBESİ', '02322522919 '),
(13, 'MECALAC İŞ MAKİNALARI SANAYİ VE TİCARET LTD. ŞTİ.', '02322580009'),
(14, 'LAZERİZMİR METAL KESİM VE İŞLEME TEKNOLOJİLERİ MAKİNA İMALAT SAN. VE TİC. LTD. ŞTİ. ESB ŞUBESİ', '02325027223'),
(15, 'KORSİNİ-SAF AMBALAJ SANAYİ VE TİCARET A.Ş. EGE SERBEST BÖLGE ŞUBESİ', '02322513848');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `tarih`
--

DROP TABLE IF EXISTS `tarih`;
CREATE TABLE IF NOT EXISTS `tarih` (
  `tarih` date NOT NULL,
  PRIMARY KEY (`tarih`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `tarih`
--

INSERT INTO `tarih` (`tarih`) VALUES
('2021-06-01'),
('2021-06-02'),
('2021-06-03'),
('2021-06-04'),
('2021-06-05'),
('2021-06-06'),
('2021-06-07'),
('2021-06-08'),
('2021-06-09'),
('2021-06-10'),
('2021-07-01'),
('2021-07-02'),
('2021-07-03'),
('2021-07-04'),
('2021-07-05'),
('2021-07-06'),
('2021-07-07'),
('2021-07-08'),
('2021-07-09'),
('2021-07-10'),
('2021-08-01'),
('2021-08-02'),
('2021-08-03'),
('2021-08-04'),
('2021-08-05'),
('2021-08-06'),
('2021-08-07'),
('2021-08-08'),
('2021-08-09'),
('2021-08-10'),
('2021-09-01'),
('2021-09-02'),
('2021-09-03'),
('2021-09-04'),
('2021-09-05'),
('2021-09-06'),
('2021-09-07'),
('2021-09-08'),
('2021-09-09'),
('2021-09-10'),
('2021-10-01'),
('2021-10-02'),
('2021-10-03'),
('2021-10-04'),
('2021-10-05'),
('2021-10-06'),
('2021-10-07'),
('2021-10-08'),
('2021-10-09'),
('2021-10-10'),
('2021-11-01'),
('2021-11-02'),
('2021-11-03'),
('2021-11-04'),
('2021-11-05'),
('2021-11-06'),
('2021-11-07'),
('2021-11-08'),
('2021-11-09'),
('2021-11-10'),
('2021-12-16'),
('2021-12-17'),
('2021-12-18'),
('2021-12-19'),
('2021-12-20'),
('2021-12-21'),
('2021-12-22'),
('2021-12-23'),
('2021-12-24'),
('2021-12-25'),
('2021-12-26'),
('2021-12-27'),
('2021-12-28'),
('2021-12-29'),
('2021-12-30');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `yemekler`
--

DROP TABLE IF EXISTS `yemekler`;
CREATE TABLE IF NOT EXISTS `yemekler` (
  `yemek_no` int(5) NOT NULL,
  `yemek_adi` varchar(255) COLLATE utf8_turkish_ci NOT NULL,
  PRIMARY KEY (`yemek_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `yemekler`
--

INSERT INTO `yemekler` (`yemek_no`, `yemek_adi`) VALUES
(1, 'Pirinç Pilavı'),
(2, 'Sebzeli Köfte'),
(3, 'Şehriye Çorba'),
(4, 'Etli Bezelye'),
(5, 'Börek'),
(6, 'Taze Fasulye'),
(7, 'Kabak Dolma'),
(8, 'Biber Dolma'),
(9, 'Karnıyarık'),
(10, 'Kadınbudu Köfte'),
(11, 'Patlıcan Musakka'),
(12, 'Peynirli Makarna'),
(13, 'Tas Kebabı'),
(14, 'Bulgur Pilavı'),
(15, 'Tavuk Pirzola'),
(16, 'Kayseri Mantısı'),
(17, 'Biftek Pirola'),
(18, 'Mercimek Çorba'),
(19, 'Şakşuka'),
(20, 'Sebzeli Makarna');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `yemekler_menu`
--

DROP TABLE IF EXISTS `yemekler_menu`;
CREATE TABLE IF NOT EXISTS `yemekler_menu` (
  `menu_no` int(5) NOT NULL,
  `yemek_no` int(5) NOT NULL,
  KEY `menu_no` (`menu_no`),
  KEY `yemek_no` (`yemek_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `yemekler_menu`
--

INSERT INTO `yemekler_menu` (`menu_no`, `yemek_no`) VALUES
(1, 4),
(1, 1),
(1, 3),
(2, 2),
(2, 12),
(2, 18),
(3, 8),
(3, 5),
(3, 3),
(4, 11),
(4, 1),
(4, 18),
(5, 14),
(5, 4),
(5, 3),
(6, 13),
(6, 8),
(6, 3),
(7, 6),
(7, 15),
(7, 3),
(9, 17),
(9, 7),
(9, 3),
(10, 12),
(10, 11),
(10, 3);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `yoneticiler`
--

DROP TABLE IF EXISTS `yoneticiler`;
CREATE TABLE IF NOT EXISTS `yoneticiler` (
  `eposta` varchar(255) COLLATE utf8_turkish_ci NOT NULL,
  `sifre` varchar(20) COLLATE utf8_turkish_ci NOT NULL,
  `ad` varchar(255) COLLATE utf8_turkish_ci NOT NULL,
  `soyad` varchar(255) COLLATE utf8_turkish_ci NOT NULL,
  `resim` varchar(255) COLLATE utf8_turkish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `yoneticiler`
--

INSERT INTO `yoneticiler` (`eposta`, `sifre`, `ad`, `soyad`, `resim`) VALUES
('zehra@gmail.com', '741', 'Zehra Nur', 'ÖZÇALIŞIR', 'dist/img/zehra.png'),
('gizem@gmail.com', '852', 'Gizem', 'TURAN', 'dist/img/gizem.png'),
('buse@gmail.com', '963', 'Buse', 'Çınal', 'dist/img/buse.png');

--
-- Dökümü yapılmış tablolar için kısıtlamalar
--

--
-- Tablo kısıtlamaları `calisanlar`
--
ALTER TABLE `calisanlar`
  ADD CONSTRAINT `sirket_id2` FOREIGN KEY (`sirket_id`) REFERENCES `sirketler` (`sirket_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Tablo kısıtlamaları `degerlendirme`
--
ALTER TABLE `degerlendirme`
  ADD CONSTRAINT `lezzet` FOREIGN KEY (`lezzet`) REFERENCES `puan` (`puan`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `puan` FOREIGN KEY (`hız`) REFERENCES `puan` (`puan`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `servis` FOREIGN KEY (`servis`) REFERENCES `puan` (`puan`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `siparis_noooo` FOREIGN KEY (`siparis_no`) REFERENCES `siparisler` (`siparis_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Tablo kısıtlamaları `gider`
--
ALTER TABLE `gider`
  ADD CONSTRAINT `ay_idddd` FOREIGN KEY (`ay_id`) REFERENCES `aylar` (`ay_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `gider_tur` FOREIGN KEY (`gider_tur_id`) REFERENCES `gider_tur` (`gider_tur_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Tablo kısıtlamaları `siparisler`
--
ALTER TABLE `siparisler`
  ADD CONSTRAINT `ay_id` FOREIGN KEY (`ay_id`) REFERENCES `aylar` (`ay_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `menu_no2` FOREIGN KEY (`menu_no`) REFERENCES `menu` (`menu_no`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `odeme_turu_id` FOREIGN KEY (`odeme_turu_id`) REFERENCES `odeme_turu` (`odeme_turu_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `saat` FOREIGN KEY (`saat`) REFERENCES `saat` (`saat`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sirket_id` FOREIGN KEY (`sirket_id`) REFERENCES `sirketler` (`sirket_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tarih` FOREIGN KEY (`tarih`) REFERENCES `tarih` (`tarih`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Tablo kısıtlamaları `yemekler_menu`
--
ALTER TABLE `yemekler_menu`
  ADD CONSTRAINT `menu_no` FOREIGN KEY (`menu_no`) REFERENCES `menu` (`menu_no`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `yemek_no` FOREIGN KEY (`yemek_no`) REFERENCES `yemekler` (`yemek_no`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
