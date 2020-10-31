//
//  SuggestedArticleRow.swift
//  LemmeHelpV2
//
//  Created by Colin Power on 8/24/20.
//  Copyright © 2020 Colin Power. All rights reserved.
//

import SwiftUI

struct SuggestedArticleRow: View {
    var body: some View {
        VStack {
            HStack {
                Text("Suggested articles")
                    .foregroundColor(Color.gray)
                    .padding(.vertical, 12)
            }
            HStack {
                VStack {
                    HStack {
                        Image(systemName: "book.fill").foregroundColor(Color.purple)
                        Text("Common questions about returns")
                            .fontWeight(.semibold)
                            .padding(.leading, 12)
                            .foregroundColor(Color.purple.opacity(0.85))
                            .frame(minWidth: 0, idealWidth: .infinity, maxWidth: .infinity, minHeight: 0, idealHeight: 48, maxHeight: 48, alignment: .leading)
                    }.padding(.leading, 12)
                    .background(RoundedRectangle(cornerRadius: 0).fill(Color.purple.opacity(0.1)))
                    HStack {
                        Image(systemName: "book.fill").foregroundColor(Color.purple)
                        Text("Returns for high value clients")
                            .fontWeight(.semibold)
                            .padding(.leading, 12)
                            .foregroundColor(Color.purple.opacity(0.85))
                            .frame(minWidth: 0, idealWidth: .infinity, maxWidth: .infinity, minHeight: 0, idealHeight: 48, maxHeight: 48, alignment: .leading)
                    }.padding(.leading, 12)
                    .background(RoundedRectangle(cornerRadius: 0).fill(Color.purple.opacity(0.1)))
                }
            }
        }
    }
}

struct SuggestedArticleRow_Previews: PreviewProvider {
    static var previews: some View {
        SuggestedArticleRow()
    }
}
