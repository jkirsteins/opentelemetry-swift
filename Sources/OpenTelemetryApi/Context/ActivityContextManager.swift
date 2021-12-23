/*
 * Copyright The OpenTelemetry Authors
 * SPDX-License-Identifier: Apache-2.0
 */

import Foundation
//import os.activity

class ActivityContextManager: ContextManager {
    
    static let instance = ActivityContextManager()
#if canImport(_Concurrency)
#if swift(<5.5.2)
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, *)
    static let taskLocalContextManager = TaskLocalContextManager.instance
#else
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, *)
    static let taskLocalContextManager = TaskLocalContextManager.instance
#endif
#endif

//    class ScopeElement {
//        init(scope: os_activity_scope_state_s) {
//            self.scope = scope
//        }
//
//        deinit {}
//
//        var scope: os_activity_scope_state_s
//    }
//
    func getCurrentContextValue(forKey: OpenTelemetryContextKeys) -> AnyObject?
    {
        fatalError("os.activity not available")
    }
    func setCurrentContextValue(forKey: OpenTelemetryContextKeys, value: AnyObject)
    {
        fatalError("os.activity not available")
    }
    func removeContextValue(forKey: OpenTelemetryContextKeys, value: AnyObject)
    {
        fatalError("os.activity not available")
    }
}
