import Foundation

var greeting = "<br>Jan<br>April\n<br><br/>"

func matches(for regex: String, in text: String) -> [String] {

    do {
        let regex = try NSRegularExpression(pattern: regex)
        let results = regex.matches(in: text,
                                    range: NSRange(text.startIndex..., in: text))
        return results.map {
            String(text[Range($0.range, in: text)!])
        }
    } catch let error {
        print("invalid regex: \(error.localizedDescription)")
        return []
    }
}
    
    let matched = matches(for: "^(<br>*|<br/>*|\n*|<br />*|<br >)*$", in: greeting)
greeting = greeting.replacingOccurrences(of: "(<br>*|<br/>*|\n*|<br />*|<br >)*$", with: "", options: .regularExpression)
    print(matched,greeting)

//while greeting.hasSuffix("<br>") {
//    greeting = String(greeting.dropLast(4))
//    if greeting.hasSuffix("\n") {
//        greeting = String(greeting.dropLast())
//    }
//}
//
//print(greeting)
