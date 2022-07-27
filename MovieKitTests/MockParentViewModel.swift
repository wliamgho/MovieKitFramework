//
//  MockParentViewModel.swift
//  MovieDBTests
//
//  Created by William on 26/06/22.
//

import XCTest
@testable import MovieKit

class MockParentViewModel: ParentViewModel {

    var invokedViewStateSetter = false
    var invokedViewStateSetterCount = 0
    var invokedViewState: ViewState?
    var invokedViewStateList = [ViewState]()
    var invokedViewStateGetter = false
    var invokedViewStateGetterCount = 0
    var stubbedViewState: ViewState!

    override var viewState: ViewState {
        set {
            invokedViewStateSetter = true
            invokedViewStateSetterCount += 1
            invokedViewState = newValue
            invokedViewStateList.append(newValue)
        }
        get {
            invokedViewStateGetter = true
            invokedViewStateGetterCount += 1
            return stubbedViewState
        }
    }

    var invokedDidLoad = false
    var invokedDidLoadCount = 0

    override func didLoad() {
        invokedDidLoad = true
        invokedDidLoadCount += 1
    }

    var invokedWillAppear = false
    var invokedWillAppearCount = 0

    override func willAppear() {
        invokedWillAppear = true
        invokedWillAppearCount += 1
    }

    var invokedDidDisappear = false
    var invokedDidDisappearCount = 0

    override func didDisappear() {
        invokedDidDisappear = true
        invokedDidDisappearCount += 1
    }
}
