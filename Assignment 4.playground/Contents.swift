//1. შექმენით enum-ი სახელით DayOfWeek შესაბამისი ქეისებით. დაწერეთ function რომელიც იღებს ამ ენამის ტიპს. function-მა უნდა და-print-ოს, გადაწოდებული დღე კვირის დღეა თუ დასვენების.
print("Task 1")
enum DayOfWeek {
    case Monday
    case Tuesday
    case Wednesday
    case Thursday
    case Friday
    case Saturday
    case Sunday
}

func dayType(day: DayOfWeek) -> String {
    if day == DayOfWeek.Saturday || day == DayOfWeek.Sunday {
        return "Weekend"
    } else {
        return "Weekday"
    }
}
print("Today is", DayOfWeek.Saturday)

//2. შექმენით enum-ი Weather შემდეგი ქეისებით, Sunny, Cloudy, Rainy და Snowy. ამ ქეისებს უნდა ჰქონდეს associated value Celsius-ის სახით. დაწერეთ function რომელიც მიიღებს ამ enum-ს, და მოგვცემს რეკომენდაციას რა უნდა ჩავიცვათ შესაბამისი ამინდის მიხედვით.
// below 0
// 0-15
// 15-25
// >25

print("Task 2")
enum Weather {
    case Sunny(Celsius: Double)
    case Cloudy(Celsius: Double)
    case Rainy(Celsius: Double)
    case Snowy
}

func recommendation(weather: Weather) -> String {
    switch weather {
    case .Sunny(Celsius: var celsius):
        if celsius < 0 {
            return "Don't let the sun decieve you, layer up and embrace winter's warmth below zero!"
        } else if celsius > 0 && celsius < 15 {
            return "Sun's out, but don't let it fool you! Wrap up in cozy layers and embrace the cold!"
        } else if celsius > 15 && celsius < 25 {
            return "It's a beautiful day, but don't forget to grab a jacket, just in case the weather decides to surprise you!"
        } else if celsius > 25 {
            return "It's sizzling hot outside, so slip into your summer attire and let the sun be your only accessory!"
        }
        
    case .Cloudy(Celsius: var celsius) :
        if celsius < 0 {
            return "Under the cloudy skies, layer up and discover the coziness of winter below zero!"
        } else if celsius > 0 && celsius < 15 {
            return "Clouds may obscure the sun, but stay prepared! Wrap up in cozy layers and embrace the chill!"
        } else if celsius > 15 && celsius < 25 {
            return "It may be cloudy, don't leave without your raincoat, in case weather decides to surprise you!"
        } else if celsius > 25 {
            return "It's sizzling hot outside, but don't forget your umbrella – you never know when the weather might turn!"
        }
        
    case .Rainy(Celsius: var celsius) :
        if celsius < 0 {
            return "Even in the rainy weather, wrap up warmly and relish the winter magic below zero!"
        } else if celsius > 0 && celsius < 15 {
            return "Raindrops may fall, but stay ready! Bundle up in snug layers and welcome the cozy embrace of winter!"
        } else if celsius > 15 && celsius < 25 {
            return "Even in the rainy weather, be prepared! Don't forget your raincoat – you never know when the skies might open up!"
        } else if celsius > 25 {
            return "It's sizzling hot outside, but ddon't forget your umbrella, shield against unexpected showers!"
        }
        
    case .Snowy :
        return "When it's snowy and cold outside, your best friends are a trusty winter coat, insulated gloves, a knitted hat, and warm, waterproof boots – conquer the chill in style!"
    }
    return "Unknown weather"
}
let sunnyDay = Weather.Sunny(Celsius: 12.3)
let text = recommendation(weather: sunnyDay)
print(text)

//3. შექმენით struct-ი Book, with properties როგორიცაა: title, author, publicationYear. ამის შემდეგ შექმენით array-ი Book-ის ტიპის, შექმენით რამოდენიმე Book-ის ობიექტი, და შეავსეთ array ამ წიგნებით. დაწერეთ function რომელიც მიიღებს ამ წიგნების array-ს და მიიღებს წელს. function-მა უნდა დაგვიბრუნოს ყველა წიგნი რომელიც გამოშვებულია ამ წლის შემდეგ. დავ-print-ოთ ეს წიგნები.

print("Task 3")
struct Book {
    let title: String
    let author: String
    let publicationYear: Int
}

var library: [Book] = []

let book1 = Book(title: "To Kill a Mockingbird", author: "Harper Lee", publicationYear: 1960)
let book2 = Book(title: "Animal Farm", author: "George Orwell", publicationYear: 1945)
let book3 = Book(title: "Of Mice and Men", author: "John Steinbeck", publicationYear: 1937)
let book4 = Book(title: "Notes from Underground", author: "Fyodor Dostoevsky", publicationYear: 1864)
let book5 = Book(title: "The Museum of Innocence", author: "Orhan Pamuk", publicationYear: 2008)

library.append(book1)
library.append(book2)
library.append(book3)
library.append(book4)
library.append(book5)

func filteringBooks() -> [Book] {
    let filteredBooks = library.filter { $0.publicationYear < 1950 }
    return filteredBooks
}

for book in filteringBooks() {
    print("Title: \(book.title), Author: \(book.author), Year: \(book.publicationYear)")
}

//4. შექმენით struct BankAccount, with properties როგორიცაა: holderName, accountNumber, balance. ამ ობიექტში დაამატეთ methods, დეპოზიტისა და გატანის (withdraw), დაწერეთ შესაბამისი ლოგიკა და ეცადეთ გაითვალისწინოთ სხვადასხვა ეჯ-ქეისები (edge case). მაგ. თანხის გატანისას თუ თანხა იმაზე ნაკლებია ვიდრე გვაქვს, თანხას ვერ გავიტანთ და ასე შემდეგ. print-ის მეშვეობით გამოვიტანოთ შესაბამისი შეცდომები . ამის შემდეგ შექმენით BankAccount ობიექტი და გააკეთეთ ტრანზაქციების იმიტაცია თქვენს მიერ დაწერილი მეთოდებით.
print("Task 4")
struct BankAccount {
    let holderName : String
    let accountNumber : String
    var balance : Double
    
    mutating func deposit(amount: Double) {
        if amount > 0 {
            balance += amount
            print("\(amount) added to your Deposit. Current amount: \(balance)")
        } else {
            print("Error occured! Deposit amount must be more than 0")
        }
    }
    
    mutating func withdraw(amount: Double) {
        if balance >= amount {
            balance -= amount
            print("\(amount) was withdrawn from your account. Current amount: \(balance)")
        } else if balance <= amount {
            print("Error occured! Insufficient balance. Current amount: \(balance)")
        } else if amount == 0 {
            print("Error occured! Withdraw amount must be more than 0")
        }
    }
}
var account = BankAccount(holderName: "Mariam Mchedlidze", accountNumber: "12345678910", balance: 1000.0)
account.deposit(amount: 500.0)
account.withdraw(amount: 1550.0)

//5. შექმენით enum-ი Genre მუსიკის ჟანრის ქეისებით. ამის შემდეგ შექმენით struct Song, with properties: title, artist, duration, genre, description (computied propertie უნდა იყოს description) და publisher (lazy propertie-ად შექმენით publisher). შემდეგ შექმენით თქვენი playlist array რომელსაც Song-ებით შეავსებთ (ზოგ song-ს ჰქონდეს publisher, ზოგს არა). შექმენით function რომელსაც გადააწვდით თქვენს playlist-ს და ჟანრს, function-ს დააბრუნებინეთ მხოლოდ იმ Song-ების array, რომელიც ამ ჟანრის იქნება და შემდეგ დაა-print-ინეთ ეს Song-ები.
print("Task 5")
enum Genre {
    case Rock
    case Jazz
}

struct Song {
    let title: String
    let artist: String
    let duration: Int
    let genre: Genre
    lazy var publisher: String = {
        if publisher.isEmpty {
            return ""
        } else {
            return "Publisher: \(publisher)"
        }
    }()
    var description: String {
        return "Title: \(title), Artist: \(artist), Duration: \(duration) seconds, Genre: \(genre)"
    }
    //    var fullDescription: String {
    //        return "Title: \(title), Artist: \(artist), Duration: \(duration) seconds, Genre: \(genre), Publisher: \(publisher)"
    //    }
}

var myPlaylist = [
    Song(title: "Dream On", artist: "Aerosmith", duration: 268, genre: .Rock, publisher: "Columbia Records"),
    Song(title: "Bohemian Rhapsody", artist: "Queen", duration: 355, genre: .Rock),
    Song(title: "Sweet Child O'Mine", artist: "Guns N' Roses", duration: 302, genre: .Rock, publisher: "Geffen Records"),
    Song(title: "So What", artist: "Miles Davis", duration: 519, genre: .Jazz),
    Song(title: "Summertime", artist: "Ella Fitzgerald", duration: 227, genre: .Jazz)
]

func filterSongs(by genre: Genre) {
    for song in myPlaylist {
        if song.genre == genre {
            print(song.description)
        }
    }
}
filterSongs(by: .Rock)

//func filterSongsFull(by genre: Genre) {
//    for song in myPlaylist {
//        if song.genre == genre {
//            print(song.fullDescription)
//        }
//    }
//}
