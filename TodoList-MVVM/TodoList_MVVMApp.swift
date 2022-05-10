//
//  TodoList_MVVMApp.swift
//  TodoList-MVVM
//
//  Created by NaheedPK on 08/04/2022.
//

import SwiftUI
import Firebase
@main
struct TodoList_MVVMApp: App {
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ListView()
            }
            .environmentObject(listViewModel)
        }
    }
}


class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        FirebaseApp.configure()
        return true
    }
}
