//
//  MessageConstants.swift
//  NasaAPIExample
//
//  Created by Tuncel, Pelin on 4/7/22.
//

struct MessageConstants {
    struct ApiResponseTitle {
        static var Error: String = "Hata"
        static var Warning: String = "Uyarı"
        static var Success: String = "Başarılı"
    }
    struct ApiErrorMessages {
        static var General: String = "İşlem gerçekleştirilirken bir hata oluştu. Lütfen daha sonra tekrar dene."
        static var NotSuccess: String = "İşlemini şu anda gerçekleştiremiyoruz. Lütfen daha sonra tekrar dene."
        static var NoElements: String = "Aradığınız kamera kriterinde fotoğraf bulunamadı."
    }
}
