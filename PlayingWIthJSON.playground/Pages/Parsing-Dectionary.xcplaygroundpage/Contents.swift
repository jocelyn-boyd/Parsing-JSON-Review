// Parsing Dictionary

// JSON Data
import Foundation

let json = """
{
 "results": [
   {
     "firstName": "John",
     "lastName": "Appleseed"
   },
  {
    "firstName": "Alex",
    "lastName": "Paul"
  }
 ]
}
""".data(using: .utf8)!

// ===================================================================
// Create Model(s)
//====================================================================

// Codable: is an alias and has both Decodable & Ecodable
// Decodable: converts json data
// Encodable: converts to json data to e.g POST to a Web API

// Top Level JSON is a dictionary
struct ResultsWrapper: Decodable {
  let results: [Contact]
}

struct Contact: Decodable {
  let firstName: String
  let lastName: String
}

// ===================================================================
// decode the JSON data to our Swift Model
//====================================================================

do {
  let dictionary = try JSONDecoder().decode(ResultsWrapper.self, from: json)
  let contacts = dictionary.results // [Contacts]
  dump(contacts)
} catch {
  print("decoding error: \(error)")
}

//: [Next](@next)
