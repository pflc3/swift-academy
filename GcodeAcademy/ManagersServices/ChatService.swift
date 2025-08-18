/*
 * Handles network requests to the backend chat API.
 * Encodes messages into API format, sends to server, and decodes response.
 */

import Foundation

class ChatService {
    private let baseURL = "http://localhost:8000/api/v1"

    /*
     * Sends a chat request to backend.
     *
     * messages: full conversation history
     * userId/context: optional metadata (defaults to nil for now)
     */
    func sendMessage(
        messages: [ChatMessage],
        userId: String? = nil,
        context: [String: String]? = nil,
        completion: @escaping (Result<String, Error>) -> Void
    ) {
        // Convert our ChatMessage objects to the API format
        let apiMessages = messages.map { APIMessage(role: $0.apiRole, content: $0.content) }

        // Create the request body
        let requestBody = ChatRequest(
            messages: apiMessages,
            userId: userId,
            context: context
        )

        // Create the URL
        guard let url = URL(string: "\(baseURL)/chat") else {
            completion(.failure(NSError(
                domain: "ChatService",
                code: 0,
                userInfo: [NSLocalizedDescriptionKey: "Invalid URL"]
            )))
            return
        }

        // Create the request
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        // Encode the request body
        do {
            request.httpBody = try JSONEncoder().encode(requestBody)
        } catch {
            completion(.failure(error))
            return
        }

        // Send request and decode JSON response
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error)); return
            }
            guard let data = data else {
                completion(.failure(NSError(
                    domain: "ChatService",
                    code: 0,
                    userInfo: [NSLocalizedDescriptionKey: "No data returned"]
                )))
                return
            }
            
            // Decode the response
            do {
                let response = try JSONDecoder().decode(ChatResponse.self, from: data)
                completion(.success(response.message.content))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
