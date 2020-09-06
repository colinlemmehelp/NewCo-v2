//
//  SuggestedResponseRow.swift
//  LemmeHelpV2
//
//  Created by Colin Power on 8/24/20.
//  Copyright © 2020 Colin Power. All rights reserved.
//

import SwiftUI

struct SuggestedResponseRow: View {
    var body: some View {
        VStack {
            HStack {
                //Image(systemName: "hare.fill").foregroundColor(Color.blue)
                Text("Suggested reply")
                    .foregroundColor(Color.gray)
                    .padding(.vertical, 12)
            }
            HStack {
                Spacer(minLength: 60)
                VStack(alignment: .trailing) {
                    HStack {
                        Text("Hi, thanks for reaching out! I can totally help you with that request. Can you let me know what your OrderID was? You should see it on the first email you received.")
                            .font(.body)
                            .foregroundColor(Color.blue.opacity(0.8))
                    }
                    .padding(12)
                    .background(RoundedRectangle(cornerRadius: 5).strokeBorder(Color.blue, lineWidth: 2))
                    .background(RoundedRectangle(cornerRadius: 5).fill(Color.blue.opacity(0.1)))
                    HStack {
                        Spacer()
                        Text("Bad suggestion").fontWeight(  .medium).foregroundColor(Color.gray)
                        Spacer()
                        Text("Autofill")
                            .fontWeight(.semibold)
                            .foregroundColor(Color.white)
                            .padding(.horizontal, 30)
                            .padding(.vertical, 8)
                            .background(RoundedRectangle(cornerRadius: 5).fill(Color.blue))
                        Spacer()
                    }.padding(.top, 18)
                }.padding(.trailing, 18)
            }
        }
    }
}

struct SuggestedResponseRow_Previews: PreviewProvider {
    static var previews: some View {
        SuggestedResponseRow()
    }
}
