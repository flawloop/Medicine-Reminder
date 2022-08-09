//
//  Medicine_ReminderApp.swift
//  Medicine Reminder
//
//  Created by yaaburnee on 09/08/22.
//

import SwiftUI

@main
struct Medicine_ReminderApp: App {
    
    @StateObject var medicineViewModel: MedicineViewModel = MedicineViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ListView()
            }
            .navigationViewStyle(StackNavigationViewStyle())
            .environmentObject(medicineViewModel)
        }
    }
}
