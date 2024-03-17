import 'package:get/get.dart';

class LocaleStrings extends Translations {
  @override
  Map<String, Map<String, String>> get keys => const {
        "en_US": {
          "app_name": "Beymen",
          "home_page": "Products",
          "barcode_page": "Barcode",
          "button_cancel": "Cancel",
          "button_add": "Add",
          "button_close": "Close",
          "barcode_not_found_text": "@barcode barcode not found",
          "barcode_found_text":
              "A product with barcode @barcode was found, would you like to add it?",
          "item_remove_info":
              "This product will be deleted from the list, do you confirm?",
          "button_delete": "Delete",
          "connected_wifi": "Connected to wifi network.",
          "connected_mobile": "Connected to mobile data.",
          "connection_lost": "Internet connection lost.",
        },
        "tr_TR": {
          "app_name": "Beymen",
          "home_page": "Ürünler",
          "barcode_page": "Barkod Okuma",
          "button_cancel": "Vazgeç",
          "button_add": "Ekle",
          "button_close": "Kapat",
          "barcode_not_found_text": "@barcode barkodlu ürün bulunamadı",
          "barcode_found_text":
              "@barcode barkodlu ürün bulundu, eklemek ister misiniz?",
          "item_remove_info": "Bu ürün listeden silinecek, onaylıyor musunuz?",
          "button_delete": "Sil",
          "connected_wifi": "Wifi ağına bağlanıldı.",
          "connected_mobile": "Mobil veriye bağlanıldı.",
          "connection_lost": "İnternet bağlantısı kesildi.",
        },
      };
}
