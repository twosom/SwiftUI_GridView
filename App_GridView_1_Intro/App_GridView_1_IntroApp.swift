//
//  App_GridView_1_IntroApp.swift
//  App_GridView_1_Intro
//
//  Created by Desire L on 2021/12/31.
//
//

import SwiftUI

@main
struct App_GridView_1_IntroApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

// This code can be found in the Swift package:
// https://github.com/johnno1962/HotSwiftUI

#if DEBUG
import Combine

private var loadInjectionOnce: () = {
    guard objc_getClass("InjectionClient") == nil else {
        return
    }
    #if os(macOS)
    let bundleName = "macOSInjection.bundle"
    #elseif os(tvOS)
    let bundleName = "tvOSInjection.bundle"
    #elseif targetEnvironment(simulator)
    let bundleName = "iOSInjection.bundle"
    #else
    let bundleName = "maciOSInjection.bundle"
    #endif
    Bundle(path: "/Applications/InjectionIII.app/Contents/Resources/" + bundleName)!.load()
}()

public let injectionObserver = InjectionObserver()

public class InjectionObserver: ObservableObject {
    @Published var injectionNumber = 0
    var cancellable: AnyCancellable? = nil
    let publisher = PassthroughSubject<Void, Never>()

    init() {
        cancellable = NotificationCenter.default.publisher(for:
        Notification.Name("INJECTION_BUNDLE_NOTIFICATION"))
            .sink { [weak self] change in
                self?.injectionNumber += 1
                self?.publisher.send()
            }
    }
}

extension SwiftUI.View {
    public func eraseToAnyView() -> some SwiftUI.View {
        _ = loadInjectionOnce
        return AnyView(self)
    }

    public func loadInjection() -> some SwiftUI.View {
        return eraseToAnyView()
    }

    public func onInjection(bumpState: @escaping () -> ()) -> some SwiftUI.View {
        return self
            .onReceive(injectionObserver.publisher, perform: bumpState)
            .eraseToAnyView()
    }
}
#else
extension SwiftUI.View {
    @inline(__always)
    public func eraseToAnyView() -> some SwiftUI.View {
        return self
    }

    @inline(__always)
    public func loadInjection() -> some SwiftUI.View {
        return self
    }

    @inline(__always)
    public func onInjection(bumpState: @escaping () -> ()) -> some SwiftUI.View {
        return self
    }
}
#endif
