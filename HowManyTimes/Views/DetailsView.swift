//
//  DetailsView.swift
//  HowManyTimes
//
//  Created by Jonas Agnezi on 12/10/22.
//

import SwiftUI

struct DetailsView: View {
	
	let item: WhatIDidModel
	
	var body: some View {
		
			VStack {
				VStack {
					
					Text("What I did ?")
						.font(.title).bold()
					Text(item.title)
						.italic()
				}
				
				Spacer()
				
				VStack {
					Text("How many times?")
						.font(.title2).bold()
					Text(item.amount, format: .number)
				}
			}
			.padding(.vertical)
			.frame(width: 200, height: 300)
			.background(Color.indigo)
			.clipShape(RoundedRectangle(cornerRadius: 10.0))
	}
}

struct DetailsView_Previews: PreviewProvider {
	static var previews: some View {
		DetailsView(item: WhatIDidModel(title: "teste", amount: 1))
	}
}
