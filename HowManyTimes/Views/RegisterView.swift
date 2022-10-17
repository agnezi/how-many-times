//
//  RegisterView.swift
//  HowManyTimes
//
//  Created by agnezi.io on 11/10/22.
//

import SwiftUI

struct RegisterView: View {
	
	@ObservedObject var thingsThatIDid: ThingsThatIDid
	
	@State private var whatIDid = ""
	@State private var howManyTimes = 1.0
	
	@Environment(\.dismiss) var dismiss
	
	var body: some View {
		NavigationView {
			Form {
				Section("What I did?") {
					TextField("Describe here:", text: $whatIDid)
				}
				
				Section("How many times?") {
					Slider(value: $howManyTimes, in: 1...20, step: 1)
					Text("Amount: \(howManyTimes, format: .number)")
				}
				
				Button("Register", action: registerWhatIDid)
			}
		}
		.preferredColorScheme(.dark)
	}
	
	func registerWhatIDid() {
		let newData = WhatIDidModel(title: whatIDid, amount: Int(howManyTimes))
		
		thingsThatIDid.items.append(newData)
		dismiss()
	}
	
}

struct Register_Previews: PreviewProvider {
	static var previews: some View {
		RegisterView(thingsThatIDid: ThingsThatIDid())
	}
}
