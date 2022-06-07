//
//  Results.swift
//  JustoApp
//
//  Created by Emi Mtz on 06/06/22.
//

import Foundation

// MARK: - Results
class Results: Codable {
  var results: [Result]
  var info: Info

  enum CodingKeys: String, CodingKey {
    case results
    case info
  }

  init(results: [Result] = [], info: Info = Info()) {
    self.results = results
    self.info = info
  }

  required init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    results = try values.decodeIfPresent([Result].self, forKey: .results) ?? []
    info = try values.decodeIfPresent(Info.self, forKey: .info) ?? Info()
  }

  func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encodeIfPresent(info, forKey: .info)
    try container.encodeIfPresent(results, forKey: .results)
  }
}

// MARK: - Info
class Info: Codable {
  var seed: String
  var results, page: Int
  var version: String

  enum CodingKeys: String, CodingKey {
    case seed
    case results
    case page
    case version
  }
  
  init(seed: String = "", results: Int = .zero, page: Int = .zero, version: String = "") {
    self.seed = seed
    self.results = results
    self.page = page
    self.version = version
  }

  required init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    seed = try values.decodeIfPresent(String.self, forKey: .seed) ?? ""
    results = try values.decodeIfPresent(Int.self, forKey: .results) ?? .zero
    page = try values.decodeIfPresent(Int.self, forKey: .page) ?? 0
    version = try values.decodeIfPresent(String.self, forKey: .version) ?? ""
  }

  func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encodeIfPresent(seed, forKey: .seed)
    try container.encodeIfPresent(results, forKey: .results)
    try container.encodeIfPresent(page, forKey: .page)
    try container.encodeIfPresent(version, forKey: .version)
  }
}

// MARK: - Result
class Result: Codable {
  var gender: String
  var name: Name
  var location: Location
  var email: String
  var login: Login
  var dob, registered: Dob
  var phone, cell: String
  var id: ID
  var picture: Picture
  var nat: String

  enum CodingKeys: String, CodingKey {
    case gender
    case name
    case location
    case email
    case login
    case dob, registered, phone, cell
    case id
    case picture
    case nat
  }
  
  init(gender: String = "", name: Name = Name(), location: Location = Location(), email: String = "", login: Login = Login(), dob: Dob = Dob(), registered: Dob = Dob(), phone: String = "", cell: String = "", id: ID = ID(), picture: Picture = Picture(), nat: String = "") {
    self.gender = gender
    self.name = name
    self.location = location
    self.email = email
    self.login = login
    self.dob = dob
    self.registered = registered
    self.phone = phone
    self.cell = cell
    self.id = id
    self.picture = picture
    self.nat = nat
  }

  func getModel() -> [InfoEntity] {
    var infoArray: [InfoEntity] = []
    infoArray.append(InfoEntity(infoName: "Gender", infoService: gender))
    infoArray.append(InfoEntity(infoName: "Name",
                                infoService: name.title + name.first + name.last))
    infoArray.append(InfoEntity(infoName: "Location",
                                infoService:  "\(location.country), \(location.state), \(location.city)"))
    infoArray.append(InfoEntity(infoName: "E-mail" , infoService: email))
    infoArray.append(InfoEntity(infoName: "Age", infoService: "\(dob.age)"))
    infoArray.append(InfoEntity(infoName: "Phone", infoService: phone))
    infoArray.append(InfoEntity(infoName: "cell", infoService: cell))
    return infoArray
  }

  required init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    gender = try values.decodeIfPresent(String.self, forKey: .gender) ?? ""
    name = try values.decodeIfPresent(Name.self, forKey: .name) ?? Name()
    location = try values.decodeIfPresent(Location.self, forKey: .location) ?? Location()
    email = try values.decodeIfPresent(String.self, forKey: .email) ?? ""
    login = try values.decodeIfPresent(Login.self, forKey: .login) ?? Login()
    dob = try values.decodeIfPresent(Dob.self, forKey: .dob) ?? Dob()
    registered = try values.decodeIfPresent(Dob.self, forKey: .registered) ?? Dob()
    phone = try values.decodeIfPresent(String.self, forKey: .phone) ?? ""
    cell = try values.decodeIfPresent(String.self, forKey: .cell) ?? ""
    id = try values.decodeIfPresent(ID.self, forKey: .id) ?? ID()
    picture = try values.decodeIfPresent(Picture.self, forKey: .picture) ?? Picture()
    nat = try values.decodeIfPresent(String.self, forKey: .nat) ?? ""
  }

  func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encodeIfPresent(gender, forKey: .gender)
    try container.encodeIfPresent(name, forKey: .name)
    try container.encodeIfPresent(location, forKey: .location)
    try container.encodeIfPresent(email, forKey: .email)
    try container.encodeIfPresent(login, forKey: .login)
    try container.encodeIfPresent(dob, forKey: .dob)
    try container.encodeIfPresent(registered, forKey: .registered)
    try container.encodeIfPresent(phone, forKey: .phone)
    try container.encodeIfPresent(cell, forKey: .cell)
    try container.encodeIfPresent(id, forKey: .id)
    try container.encodeIfPresent(picture, forKey: .picture)
    try container.encodeIfPresent(nat, forKey: .nat)
  }
}

// MARK: - InfoEntity
class InfoEntity: Codable {
  var infoName: String
  var infoService: String

  init(infoName: String = "", infoService: String = "") {
    self.infoName = infoName
    self.infoService = infoService
  }
}

// MARK: - Dob
class Dob: Codable {
  var date: String
  var age: Int

  enum CodingKeys: String, CodingKey {
    case date
    case age
  }
  
  init(date: String = "", age: Int = .zero) {
    self.date = date
    self.age = age
  }

  required init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    date = try values.decodeIfPresent(String.self, forKey: .date) ?? ""
    age = try values.decodeIfPresent(Int.self, forKey: .age) ?? .zero
  }

  func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encodeIfPresent(date, forKey: .date)
    try container.encodeIfPresent(age, forKey: .age)
  }
}

// MARK: - ID
class ID: Codable {
  var name: String
  var value: Int?

  enum CodingKeys: String, CodingKey {
    case name
    case value
  }

  init(name: String = "", value: Int? = .zero) {
    self.name = name
    self.value = value
  }

  required init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    name = try values.decodeIfPresent(String.self, forKey: .name) ?? ""
    value = try values.decodeIfPresent(Int.self, forKey: .value) ?? .zero
  }

  func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encodeIfPresent(name, forKey: .name)
    try container.encodeIfPresent(value, forKey: .value)
  }
}

// MARK: - Location
class Location: Codable {
  var street: Street
  var city, state, country: String
  var postcode: Int
  var coordinates: Coordinates
  var timezone: Timezone

  enum CodingKeys: String, CodingKey {
    case street
    case city, state, country
    case postcode
    case coordinates
    case timezone
  }
  
  init(street: Street = Street(), city: String = "", state: String = "", country: String = "", postcode: Int = .zero, coordinates: Coordinates = Coordinates(), timezone: Timezone = Timezone()) {
    self.street = street
    self.city = city
    self.state = state
    self.country = country
    self.postcode = postcode
    self.coordinates = coordinates
    self.timezone = timezone
  }

  required init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    street = try values.decodeIfPresent(Street.self, forKey: .street) ?? Street()
    city = try values.decodeIfPresent(String.self, forKey: .city) ?? ""
    state = try values.decodeIfPresent(String.self, forKey: .state) ?? ""
    country = try values.decodeIfPresent(String.self, forKey: .country) ?? ""
    postcode = try values.decodeIfPresent(Int.self, forKey: .postcode) ?? .zero
    coordinates = try values.decodeIfPresent(Coordinates.self, forKey: .coordinates) ?? Coordinates()
    timezone = try values.decodeIfPresent(Timezone.self, forKey: .timezone) ?? Timezone()
  }

  func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encodeIfPresent(street, forKey: .street)
    try container.encodeIfPresent(city, forKey: .city)
    try container.encodeIfPresent(state, forKey: .state)
    try container.encodeIfPresent(country, forKey: .country)
    try container.encodeIfPresent(postcode, forKey: .postcode)
    try container.encodeIfPresent(coordinates, forKey: .coordinates)
    try container.encodeIfPresent(timezone, forKey: .timezone)
  }
}

// MARK: - Coordinates
class Coordinates: Codable {
  var latitude, longitude: String

  enum CodingKeys: String, CodingKey {
    case latitude, longitude
  }

  init(latitude: String = "", longitude: String = "") {
    self.latitude = latitude
    self.longitude = longitude
  }

  required init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    latitude = try values.decodeIfPresent(String.self, forKey: .latitude) ?? ""
    longitude = try values.decodeIfPresent(String.self, forKey: .longitude) ?? ""
  }

  func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encodeIfPresent(latitude, forKey: .latitude)
    try container.encodeIfPresent(longitude, forKey: .longitude)
  }
}

// MARK: - Street
class Street: Codable {
  var number: Int
  var name: String

  enum CodingKeys: String, CodingKey {
    case number
    case name
  }
  
  init(number: Int = .zero, name: String = "") {
    self.number = number
    self.name = name
  }

  required init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    number = try values.decodeIfPresent(Int.self, forKey: .number) ?? .zero
    name = try values.decodeIfPresent(String.self, forKey: .name) ?? ""
  }

  func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encodeIfPresent(number, forKey: .number)
    try container.encodeIfPresent(name, forKey: .name)
  }
}

// MARK: - Timezone
class Timezone: Codable {
  var offset, timezoneDescription: String
  
  enum CodingKeys: String, CodingKey {
    case offset
    case timezoneDescription = "description"
  }
  
  init(offset: String = "", timezoneDescription: String = "") {
    self.offset = offset
    self.timezoneDescription = timezoneDescription
  }

  required init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    offset = try values.decodeIfPresent(String.self, forKey: .offset) ?? ""
    timezoneDescription = try values.decodeIfPresent(String.self, forKey: .timezoneDescription) ?? ""
  }

  func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encodeIfPresent(offset, forKey: .offset)
    try container.encodeIfPresent(timezoneDescription, forKey: .timezoneDescription)
  }
}

// MARK: - Login
class Login: Codable {
  var uuid, username, password, salt: String
  var md5, sha1, sha256: String

  enum CodingKeys: String, CodingKey {
    case uuid, username, password, salt
    case md5, sha1, sha256
  }
  
  init(uuid: String = "", username: String = "", password: String = "", salt: String = "", md5: String = "", sha1: String = "", sha256: String = "") {
    self.uuid = uuid
    self.username = username
    self.password = password
    self.salt = salt
    self.md5 = md5
    self.sha1 = sha1
    self.sha256 = sha256
  }

  required init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    uuid = try values.decodeIfPresent(String.self, forKey: .uuid) ?? ""
    username = try values.decodeIfPresent(String.self, forKey: .username) ?? ""
    password = try values.decodeIfPresent(String.self, forKey: .password) ?? ""
    salt = try values.decodeIfPresent(String.self, forKey: .salt) ?? ""
    md5 = try values.decodeIfPresent(String.self, forKey: .md5) ?? ""
    sha1 = try values.decodeIfPresent(String.self, forKey: .sha1) ?? ""
    sha256 = try values.decodeIfPresent(String.self, forKey: .sha256) ?? ""
  }

  func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encodeIfPresent(uuid, forKey: .uuid)
    try container.encodeIfPresent(username, forKey: .username)
    try container.encodeIfPresent(password, forKey: .password)
    try container.encodeIfPresent(salt, forKey: .salt)
    try container.encodeIfPresent(md5, forKey: .md5)
    try container.encodeIfPresent(sha1, forKey: .sha1)
    try container.encodeIfPresent(sha256, forKey: .sha256)
  }
}

// MARK: - Name
class Name: Codable {
  var title, first, last: String

  enum CodingKeys: String, CodingKey {
    case title, first, last
  }
  
  init(title: String = "", first: String = "", last: String = "") {
    self.title = title
    self.first = first
    self.last = last
  }

  required init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    title = try values.decodeIfPresent(String.self, forKey: .title) ?? ""
    first = try values.decodeIfPresent(String.self, forKey: .first) ?? ""
    last = try values.decodeIfPresent(String.self, forKey: .last) ?? ""
  }

  func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encodeIfPresent(title, forKey: .title)
    try container.encodeIfPresent(first, forKey: .first)
    try container.encodeIfPresent(last, forKey: .last)
  }
}

// MARK: - Picture
class Picture: Codable {
  var large, medium, thumbnail: String

  enum CodingKeys: String, CodingKey {
    case large, medium, thumbnail
  }
  
  init(large: String = "", medium: String = "", thumbnail: String = "") {
    self.large = large
    self.medium = medium
    self.thumbnail = thumbnail
  }

  required init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    large = try values.decodeIfPresent(String.self, forKey: .large) ?? ""
    medium = try values.decodeIfPresent(String.self, forKey: .medium) ?? ""
    thumbnail = try values.decodeIfPresent(String.self, forKey: .thumbnail) ?? ""
  }

  func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encodeIfPresent(large, forKey: .large)
    try container.encodeIfPresent(medium, forKey: .medium)
    try container.encodeIfPresent(thumbnail, forKey: .thumbnail)
  }
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {
  
  public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
    return true
  }
  
  public var hashValue: Int {
    return 0
  }
  
  public init() {}
  
  public required init(from decoder: Decoder) throws {
    let container = try decoder.singleValueContainer()
    if !container.decodeNil() {
      throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
    }
  }
  
  public func encode(to encoder: Encoder) throws {
    var container = encoder.singleValueContainer()
    try container.encodeNil()
  }
}
