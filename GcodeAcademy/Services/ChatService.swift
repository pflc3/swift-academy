//
//  ChatService.swift
//  GcodeAcademy
//
//  Created by Joshua Fineboy-Mark on 7/31/25.
//
import Foundation

class ChatService{
    private let baseURL = "https://localhost:8000/api/v1"
    
    func sendMessage(messages:[ChatMessage], completion:@escaping (Result<String, Error>) -> Void) {
        //Convert our ChatMessage objects to the API format
        let apiMessages = messages.map { APIMessage(role:$0.apiRole, content:$0.content) }
        
        //Create the request body
        let requestBody = ChatRequest(
            messages: apiMessages,
            userId:nil, //We'll add user ID later
            context:nil //We'll add context later
        )
        
        //Create the URL
        guard let url = URL(string: "\(baseURL)/chat") else {
            completion(.failure(NSError(domain: "ChatServicee", code: 0, userInfo: [NSLocalizedDescriptionKey:"Invalid URL"])))
            return
        }
        
        //Create the request
        var request = URLRequest(url: url)
        request.httpMethod="POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        //Encode the request body
        do {
            request.httpBody = try JSONEncoder().encode(requestBody)
        } catch {
            completion(.failure(error))
            return
        }
        
        //Send the request
        URLSession.shared.dataTask(with: request){ data, response, error in
            if let error=error{
                completion(.failure(error))
                return
            }
            
            guard let data = data else{
                completion(.failure(NSError(domain: "ChatService", code: 0, userInfo: [NSLocalizedDescriptionKey:"No data returned"])))
                return
            }
            
            //Decode the response
            do{
                let response = try JSONDecoder().decode(ChatResponse.self, from: data)
                completion(.success(response.message.content))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
