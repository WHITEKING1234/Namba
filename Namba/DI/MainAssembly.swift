//
//  Mainswiftjob.swift
//  Namba
//
//  Created by Mac on 16/6/23.
//

import Foundation
import Swinject
final class MainAssembly: Assembly {
    
    func assemble(container: Container) {
        
        container.register(OAuthRepository.self) { resolver in
            let userDefaultsHelper = resolver.resolve(UserDefaultsHelper.self)
            let appDelegate = UIApplication.shared.delegate as? AppDelegate
            return OAuthRepository(userDefaultsHelper: userDefaultsHelper,
                                   appDelegate: appDelegate)
        }.initCompleted { (resolver, repository) in
            repository.viewController = resolver.resolve(MainViewController.self)
        }
        
        container.register(UserDefaultsHelper.self) { resolver in
            return UserDefaultsHelper()
        }
        
        container.register(MainViewController.self) { resolver in
            let repository = resolver.resolve(OAuthRepository.self)
            return MainViewController(repository: repository)
        }
    }
}
