//
//  dataresposnse.swift
//  Namba
//
//  Created by Mac on 16/6/23.
//

import Foundation
import Moya
import RxSwift
import RxCocoa
final class DataRepository:ReactiveCompatible {
    
    private let userDefaultsHelper: UserDefaultsHelper
    private let provider: MoyaProvider<DataRouter>
    init(userDefaultsHelper: UserDefaultsHelper?,
         provider: MoyaProvider<DataRouter>?) {
        guard let userDefaultsHelper = userDefaultsHelper,
              let provider = provider
        else { fatalError("DataRepository init") }
        
        self.userDefaultsHelper = userDefaultsHelper
        self.provider = provider
    }
    //
    func getUserData() -> Single<String> {
        return provider.rx
            .request(DataRouter.userData)
            .mapString()
            .catchError({ error in
                throw CustomError.badRequest
                
                
            })
    }
    
    
}

