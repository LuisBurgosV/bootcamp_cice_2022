//
//  SplashProvider.swift
//  CiceMusic
//
//  Created by Luis Burgos on 17/2/22.
//

import Foundation

protocol SplashProviderInputProtocol {
    func fetchData(completionHandler: @escaping (Result<MusicServerModel, NetworkError>) -> Void)
}

final class SplashProvider: SplashProviderInputProtocol {
    
    let networkService: NetworkServiceProtocol = NetworkService()
    
    func fetchData(completionHandler: @escaping (Result<MusicServerModel, NetworkError>) -> Void) {
        self.networkService.requestGeneric(requestPayload: SplashRequestDTO.requestData(numeroItems: "20"),
                                           entityClass: MusicServerModel.self) { [weak self] (result) in
            guard self != nil else { return }
            guard let resultUnw = result else { return }
            completionHandler(.success(resultUnw))
        } failure: { (error) in
            completionHandler(.failure(error))
        }
    }
}

struct SplashRequestDTO {
    static func requestData(numeroItems: String) -> RequestDTO {
        let argument: [CVarArg] = [numeroItems]
        let urlComplete = String(format: URLEnpoint.music, arguments: argument)
        let request = RequestDTO(arrayParams: nil, method: .get, endpoint: urlComplete)
        return request
    }
}
