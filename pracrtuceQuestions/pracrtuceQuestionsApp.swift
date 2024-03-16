//
//  pracrtuceQuestionsApp.swift
//  pracrtuceQuestions
//
//  Created by Gage on 2024-03-07.
//

import SwiftUI

@main
struct pracrtuceQuestionsApp: App {
    var body: some Scene {
        WindowGroup {
            MainView()
        }
		//also need this for @Model
        //.modelContainer(for: InventoryItem.self)
    }
}
