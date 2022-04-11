/*
Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright notice, this
list of conditions and the following disclaimer.

2. Redistributions in binary form must reproduce the above copyright notice,
this list of conditions and the following disclaimer in the documentation
and/or other materials provided with the distribution.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
POSSIBILITY OF SUCH DAMAGE.
*/

import Foundation
import Combine

//Input protocol
protocol DetailMovieProviderInputProtocol: BaseProviderInputProtocol {
    
}

final class DetailMovieProvider: BaseProvider {
    
    //MARK: - DI
    weak var interactor: DetailMovieProviderOutputProtocol? {
        super.baseInteractor as? DetailMovieProviderOutputProtocol
    }
    
    let networkService: NetworkServiceInputProtocol = NetworkService()
    var cancellable: Set<AnyCancellable> = []
    var dataDTO: DetailMovieCoordinatorDTO?
}

extension DetailMovieProvider: DetailMovieProviderInputProtocol {
//    func fetchDataPopularProvider() {
//        let request = RequestDTO(params: nil,
//                                 method: .get,
//                                 endpoint: URLEnpoint.endpointMoviesPopular,
//                                 urlContext: .webService)
//        self.networkService.requestGeneric(payloadRequest: request, entityClass: MoviesServerModel.self)
//            .sink { [weak self] completion in
//                guard self != nil else { return }
//                switch completion {
//                case .finished:
//                    debugPrint("Finished")
//                case let .failure(error):
//                    self?.interactor?.setInformationPopular(completion: .failure(error))
//                }
//            } receiveValue: { [weak self] resultData in
//                guard self != nil else { return }
//                self?.interactor?.setInformationPopular(completion: .success(resultData.results))
//            }
//            .store(in: &cancellable)
//    }
}

struct DetailMovieRequestDTO {
    
//    static func requestData(numeroItems: String) -> RequestDTO {
//        let argument: [CVarArg] = [numeroItems]
//        let urlComplete = String(format: URLEnpoint.music, arguments: argument)
//        let request = RequestDTO(arrayParams: nil, method: .get, endpoint: urlComplete, urlContext: .webService)
//        return request
//    }
}
