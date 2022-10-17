//
//  ThingsThatIDid.swift
//  HowManyTimes
//
//  Created by agnezi.io on 11/10/22.
//

import Foundation


class ThingsThatIDid: ObservableObject {
	@Published var items = [WhatIDidModel]() {
		didSet {
			if let encoded = try? JSONEncoder().encode(items) {
				UserDefaults.standard.set(encoded, forKey: "Items")
			}
		}
	}
	
	init() {
		if let savedItems = UserDefaults.standard.data(forKey: "Items") {
			if let decodedItems = try? JSONDecoder().decode([WhatIDidModel].self, from: savedItems) {
				items = decodedItems
				return
			}
		}
		
		items = []
	}
}
