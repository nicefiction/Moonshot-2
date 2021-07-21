//  Bundle+Decodable.swift

import Foundation



extension Bundle {
   
   func decode<T: Codable>(_ file: String)
   // -> [Astronaut] {
   -> T {
      
      // STEP 1 — Locate the file :
      
      guard
         let _url = self.url(forResource: file,
                             withExtension: nil)
      else {
         
         fatalError("Failed to locate \(file) in the bundle.")
      }
      
      
      // STEP 2 — Load the file :
      
      guard
         let _data = try? Data(contentsOf: _url)
      /** `NOTE`
       Previously we used `String(contentsOf:)` to load files into a `String` ,
       but because `Codable` uses `Data`
       we are instead going to use `Data(contentsOf:)` .
       */
      else {
         
         fatalError("Failed to load \(file) from the bundle.")
      }
      
      
      // STEP 3 — Decode the file :
      
      let jsonDecoder = JSONDecoder()
      
      guard
         let _decodedData = try? jsonDecoder.decode(T.self,
                                                    from: _data)
      else {
         
         fatalError("Failed to decode \(file) from the bundle.")
      }
      
      
      // STEP 4 — Return the decoded data :
      
      return _decodedData
   }
}
