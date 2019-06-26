//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright © ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//

import Quick
import Nimble
@testable import ___PROJECTNAMEASIDENTIFIER___

class ___VARIABLE_sceneName___ViewControllerSpec: QuickSpec {
    override func spec() {

        // MARK: - Subject Under Test (SUT)

        var sut: ___VARIABLE_sceneName___ViewController!
        var window: UIWindow!

        // MARK: - Test Doubles

        var businessLogicSpy: ___VARIABLE_sceneName___BusinessLogicSpy!
        var routerSpy: ___VARIABLE_sceneName___RouterSpy!

        // MARK: - Tests

        beforeEach {
            window = UIWindow()
            setupInitialUserState()
            setupViewController()
            setupBusinessLogic()
            setupRouter()
        }

        afterEach {
            window = nil
            sut = nil
            businessLogicSpy = nil
            routerSpy = nil
        }

        // MARK: - View Lifecycle

        describe("view did load") {
            it("should fetch from datastore", closure: {
                // given

                // when
                loadView()

                // then
                expect(businessLogicSpy.fetchFromDataStoreCalled).to(beTrue())
            })
        }

        describe("view did appear") {
            it("should track analytics", closure: {
                // given
                loadView()

                // when
                sut.viewDidAppear(true)

                // then
                expect(businessLogicSpy.trackAnalyticsCalled).to(beTrue())
            })
        }

        // MARK: - IBActions/Delegates

        // MARK: - Display Logic

        describe("display fetch from datastore") {
            it("should display fetch from datastore", closure: {
                // given
                loadView()
                let exampleVariable = "Example string."
                let viewModel = ___VARIABLE_sceneName___Models.FetchFromDataStore.ViewModel(exampleVariable: exampleVariable)

                // when
                sut.displayFetchFromDataStore(with: viewModel)

                // then
                expect(sut.exampleLabel.text).to(equal(exampleVariable))
            })
        }

        describe("display track analytics") {
            it("should display track analytics", closure: {
                // given
                loadView()
                let viewModel = ___VARIABLE_sceneName___Models.TrackAnalytics.ViewModel()

                // when
                sut.displayTrackAnalytics(with: viewModel)

                // then
                // assert something here based on use case
            })
        }

        describe("display perform ___VARIABLE_sceneName___") {
            context("when there is an error", closure: {
                var error: ___VARIABLE_sceneName___Models.Error<___VARIABLE_sceneName___Models.___VARIABLE_sceneName___ErrorType>!

                beforeEach {
                    // given
                    loadView()
                    error = ___VARIABLE_sceneName___Models.Error<___VARIABLE_sceneName___Models.___VARIABLE_sceneName___ErrorType>.init(type: .emptyExampleVariable)
                    error.message = "Example error"
                    let viewModel = ___VARIABLE_sceneName___Models.Perform___VARIABLE_sceneName___.ViewModel(error: error)

                    // when
                    sut.displayPerform___VARIABLE_sceneName___(with: viewModel)
                }

                it("should show error as label", closure: {
                    // then
                    expect(sut.exampleLabel.text).to(equal(error.message))
                })

                it("should not route to next", closure: {
                    // then
                    expect(routerSpy.routeToNextCalled).to(beFalse())
                })
            })

            context("when there is no error", closure: {
                it("should route to next", closure: {
                    // given
                    loadView()
                    let viewModel = ___VARIABLE_sceneName___Models.Perform___VARIABLE_sceneName___.ViewModel(error: nil)

                    // when
                    sut.displayPerform___VARIABLE_sceneName___(with: viewModel)

                    // then
                    expect(routerSpy.routeToNextCalled).to(beTrue())
                })
            })
        }

        // MARK: - Test Helpers

        func setupInitialUserState() {
            // some initial user state setup
        }

        func setupViewController() {
            let bundle = Bundle.main
            let storyboard = UIStoryboard(name: "Main", bundle: bundle)
            sut = storyboard.instantiateViewController(withIdentifier: "___VARIABLE_sceneName___ViewController") as? ___VARIABLE_sceneName___ViewController
        }

        func setupBusinessLogic() {
            businessLogicSpy = ___VARIABLE_sceneName___BusinessLogicSpy()
            sut.interactor = businessLogicSpy
        }

        func setupRouter() {
            routerSpy = ___VARIABLE_sceneName___RouterSpy()
            sut.router = routerSpy
        }

        func loadView() {
            window.addSubview(sut.view)
            RunLoop.current.run(until: Date())
        }
    }
}

// MARK: - Test Doubles

extension ___VARIABLE_sceneName___ViewControllerSpec {
    class ___VARIABLE_sceneName___BusinessLogicSpy: ___VARIABLE_sceneName___BusinessLogic {

        // MARK: Spied Methods

        var fetchFromDataStoreCalled = false
        var fetchFromDataStoreRequest: ___VARIABLE_sceneName___Models.FetchFromDataStore.Request!
        func fetchFromDataStore(with request: ___VARIABLE_sceneName___Models.FetchFromDataStore.Request) {
            fetchFromDataStoreCalled = true
            fetchFromDataStoreRequest = request
        }

        var trackAnalyticsCalled = false
        var trackAnalyticsRequest: ___VARIABLE_sceneName___Models.TrackAnalytics.Request!
        func trackAnalytics(with request: ___VARIABLE_sceneName___Models.TrackAnalytics.Request) {
            trackAnalyticsCalled = true
            trackAnalyticsRequest = request
        }

        var perform___VARIABLE_sceneName___Called = false
        var ___VARIABLE_sceneName___Request: ___VARIABLE_sceneName___Models.Perform___VARIABLE_sceneName___.Request!
        func perform___VARIABLE_sceneName___(with request: ___VARIABLE_sceneName___Models.Perform___VARIABLE_sceneName___.Request) {
            perform___VARIABLE_sceneName___Called = true
            ___VARIABLE_sceneName___Request = request
        }
    }

    class ___VARIABLE_sceneName___RouterSpy: ___VARIABLE_sceneName___Router {

        // MARK: Spied Methods

        var routeToNextCalled = false
        override func routeToNext() {
            routeToNextCalled = true
        }
    }
}
