//
//  ContentView.swift
//  HowManyTimes
//
//  Created by Jonas Agnezi on 11/10/22.
//

import SwiftUI

enum OperationType {
	case add, sub
}


struct ContentView: View {
	
	@ObservedObject var thingsThatIDid = ThingsThatIDid()
	@State private var showRegisterSheet = false
	
	var body: some View {
		NavigationView {
			List {
				ForEach(thingsThatIDid.items) { item in
					HStack {
						Image(systemName: "list.bullet")
							.contextMenu {
								Button { editAmount(item.id, operation: .add) } label: {
									Label("Add", systemImage: "plus")
								}
								
								
								Button(role: .destructive) { editAmount(item.id, operation: .sub) } label: {
									Label("Subtract", systemImage: "minus")
								}
							}
						
						NavigationLink(destination: DetailsView(item: item)) {
							Text("\(item.title) - \(item.amount)x")
						}
					}
				}
			}
			.padding()
			.navigationBarTitleDisplayMode(.inline)
			.navigationTitle("List of things!")
			.toolbar {
				Button(action: {showRegisterSheet = true}) {
					Image(systemName: "plus")
				}
			}
			.sheet(isPresented: $showRegisterSheet) {
				RegisterView(thingsThatIDid: thingsThatIDid)
			}
		}
		.preferredColorScheme(.dark)
	}
	
	func editAmount(_ id: UUID, operation: OperationType) {
		guard let foundIndex = thingsThatIDid.items.firstIndex(where: { $0.id == id }) else {
			print("Index not found!")
			return
		}
		
		guard var foundItem = thingsThatIDid.items.first(where: { $0.id == id }) else {
			print("Item not found!")
			return
		}
		
		if operation == .add {
			foundItem.amount += 1
		} else {
			foundItem.amount -= 1
		}
		
		let newItemData = foundItem
		
		thingsThatIDid.items[foundIndex] = newItemData
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
