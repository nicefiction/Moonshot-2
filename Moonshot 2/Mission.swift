//  Mission.swift

import Foundation


struct Mission: Codable,
                Identifiable {
   
   
   // MARK: - NESTED TYPES
   
   struct CrewRole: Codable {
      
      let name: String
      let role: String
   }
   
   
   // MARK: - PROPERTIES -

   let id: Int
   let launchDate: Date?
   let crew: [CrewRole]
   let description: String
   
   
   
   // MARK: - COMPUTED PROPERTIES -
   
   var displayName: String {
      
      return "Apollo \(id)"
   }
   
   
   var imageName: String {
      
      return "apollo\(id)"
   }
   
   
   var formattedLaunchDate: String {
      
      guard let _launchDate = launchDate
      else {
         return "N/A"
      }
      
      let dateFormatter = DateFormatter()
      dateFormatter.dateStyle = .long
      
      return dateFormatter.string(from: _launchDate)
   }
}
