//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright (c) ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol ___VARIABLE_sceneName___PresentationLogic {
    func presentFetchFromDataStoreResult(with response: ___VARIABLE_sceneName___Models.FetchFromDataStore.Response)
    func present___VARIABLE_sceneName___Result(with response: ___VARIABLE_sceneName___Models.___VARIABLE_sceneName___.Response)
}

class ___VARIABLE_sceneName___Presenter: ___VARIABLE_sceneName___PresentationLogic {
    weak var viewController: ___VARIABLE_sceneName___DisplayLogic?

    // MARK: Use Case - Fetch Data From DataStore

    func presentFetchFromDataStoreResult(with response: ___VARIABLE_sceneName___Models.FetchFromDataStore.Response) {
        let viewModel = ___VARIABLE_sceneName___Models.FetchFromDataStore.ViewModel(userAttribute: response.userAttribute)
        viewController?.displayFetchFromDataStoreResult(with: viewModel)
    }  

    // MARK: Use Case - ___VARIABLE_sceneName___

    func present___VARIABLE_sceneName___Result(with response: ___VARIABLE_sceneName___Models.___VARIABLE_sceneName___.Response) {
        let viewModel = ___VARIABLE_sceneName___Models.___VARIABLE_sceneName___.ViewModel(containsErrors: response.containsErrors, genericErrorMessage: response.genericErrorMessage, variablePassed: response.variablePassed)
        viewController?.display___VARIABLE_sceneName___Result(with: viewModel)
    }
}
