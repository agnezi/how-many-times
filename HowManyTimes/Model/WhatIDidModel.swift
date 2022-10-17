//
//  WhatIDidModel.swift
//  HowManyTimes
//
//  Created by Jonas Agnezi on 11/10/22.
//

import Foundation

struct WhatIDidModel: Identifiable, Codable, Equatable {
	var id = UUID()
	var title: String
	var amount: Int
}
