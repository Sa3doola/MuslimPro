//
//  PrayerTimeModel.swift
//  MuslimPro
//
//  Created by Saad Sherif on 7/28/21.
//

import Foundation

struct PrayerTimeModel : Codable {
    
    let code : Int
    let status : String
    let data : [DataTime]
}

struct DataTime : Codable {
    
    let timings : Timings
    let date : DataModel
    let meta : Meta
}

struct Timings : Codable { //Under DataTime Struct
    
    let Fajr : String
    let Sunrise : String
    let Dhuhr : String
    let Asr : String
    let Sunset : String
    let Maghrib : String
    let Isha : String
    let Imsak : String
    let Midnight : String
}

struct DataModel : Codable { //Under DataTime Struct
    
    let readable : String
    let timestamp : String
    let gregorian : Gregorian
    let hijri : Hijri
}

struct Gregorian : Codable { //Under Date
    
    let date : String
    let format : String
    let day : String
    let weekday : GregorianWeekday
    let month : GregorianMonth
    let year : String
}

struct GregorianWeekday : Codable { //Under Gregorian
    
    let en : String
}

struct GregorianMonth : Codable { //Under Gregorian
    
    let number : Int
    let en : String
}

struct Hijri : Codable { //Under DataModel Struct
    
    let date : String
    let format : String
    let day : String
    let weekday : HijriWeekday
    let month : HijriMonth
    let year : String
}

struct HijriWeekday : Codable { //Under Hijri
    
    let en : String
    let ar : String
}

struct HijriMonth : Codable { //Under Hijri
    
    let number : Int
    let en : String
    let ar : String
}


struct Meta : Codable { //Under DataTime Struct
    
    let latitude : Double
    let longitude : Double
    let timezone : String
}
