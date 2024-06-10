//
//  ImageUploader.swift
//  Tweeter
//
//  Created by Luke Goddard on 10/6/2024.
//

import SwiftUI

struct ImageUploader {
    
    static func uploadImage(paramName: String, fileName: String, image: UIImage, urlPath: String) {
        
        let url = URL(string: "\(K.Network.server)\(urlPath)")!
        
        let boundary = UUID().uuidString
        
        let session = URLSession.shared
        
        var request = URLRequest(url: url)
        
        request.httpMethod = "POST"
        
        // AUTHENTICATION
        
        let token = UserDefaults.standard.string(forKey: "jsonwebtoken")!
        
        request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        
        request.addValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
        
        var data = Data()
        
        data.append("\r\n--\(boundary)\r\n".data(using: .utf8)!)
        data.append("Content-Disposition: form-data; name=\"\(paramName)\"; filename=\"\(fileName)\"\r\n".data(using: .utf8)!)
        data.append("Content-Type: image/png\r\n\r\n".data(using: .utf8)!)
        data.append(image.pngData()!)
        
        data.append("\r\n--\(boundary)--\r\n".data(using: .utf8)!)
        
        session.uploadTask(with: request, from: data, completionHandler:  { responseData, response, error in
            if error == nil {
                let jsonData = try? JSONSerialization.jsonObject(with: responseData!, options: .allowFragments)
                
                if let json = jsonData as? [String:Any] {
                    print(json)
                }
            }
        }).resume()
    }
    
}
