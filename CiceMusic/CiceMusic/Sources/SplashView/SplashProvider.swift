//
//  SplashProvider.swift
//  CiceMusic
//
//  Created by Luis Burgos on 17/2/22.
//

import Foundation

protocol SplashProviderInputProtocol {
    func fetchData()
}

final class SplashProvider: SplashProviderInputProtocol {
    
    let networkService: NetworkServiceProtocol = NetworkService()
    
    func fetchData() {
        self.networkService.requestGeneric(requestPayload: SplashRequestDTO.requestData(numeroItems: "10"),
                                           entityClass: MusicServerModel.self) { (result) in
            //
        } failure: { (error) in
            //
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
