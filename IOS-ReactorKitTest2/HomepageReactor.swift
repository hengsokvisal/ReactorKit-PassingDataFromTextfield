//
//  HomepageReactor.swift
//  IOS-ReactorKitTest2
//
//  Created by HengVisal on 5/14/18.
//  Copyright © 2018 HengVisal. All rights reserved.
//

import ReactorKit
import RxSwift
final class HomepageReactor : Reactor {
    
    enum Action {
        case usernameText(String?)
        case ageText(String?)
    }
    
    enum Mutation {
        case getUsernameText(String?)
        case getAgeText(String?)
    }
    
    struct State {
        var userName : String? = nil
        var age : String? = nil
    }
    
    var initialState: State = State()
    
    func mutate(action: HomepageReactor.Action) -> Observable<HomepageReactor.Mutation> {
        switch action {
        case let .usernameText(text):
            return Observable.just(Mutation.getUsernameText(text))
        case let .ageText(text):
            return Observable.just(Mutation.getAgeText(text))
        }
    }
    
    func reduce(state: HomepageReactor.State, mutation: HomepageReactor.Mutation) -> HomepageReactor.State {
        var localState = state
        
        switch mutation {
        case let .getUsernameText(text):
            localState.userName = text
        case let .getAgeText(text):
            localState.age = text
        }
        return localState
    }
    
}
