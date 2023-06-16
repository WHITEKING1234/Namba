//
//  SwinmOBGET.swift
//  Namba
//
//  Created by Mac on 16/6/23.
//

import Foundation
import Swinject
final class SwinjectManager {
    
    static let shared = SwinjectManager()
    
    private init() {}
    
    private let assembler = Assembler([MainAssembly(),
                                       DataAssembly()])
    
    var firstVC: UIViewController? {
        guard let rootVC = assembler.resolver.resolve(MainViewController.self) else {
            return nil
        }
        
        return UINavigationController(rootViewController: rootVC)
    }
    
    var dataVC: UIViewController? {
        return assembler.resolver.resolve(DataViewController.self)
    }
}
