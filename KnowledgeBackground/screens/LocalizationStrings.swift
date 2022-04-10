//
//  LocalizationStrings.swift
//  KnowledgeBackground
//
//  Created by Mahmudov Asrbek Ulug'bek o'g'li on 26/08/21.
//

import SwiftUI

struct LocalizationStrings: View {
    @State var welcome = "str_welcome".localized()
    
    var body: some View {
        VStack {
            VStack {
                Text(LocalizedStringKey(welcome))
            }.frame(maxWidth: .infinity, maxHeight: .infinity)
            
            HStack(spacing: 0) {
                VStack {
                    Button(action: {
                        Bundle.setLanguage("en")
                        welcome = "str_welcome".localized()
                    }, label: {
                        Text("English").foregroundColor(Color.white).frame(maxWidth: .infinity, maxHeight: .infinity).background(Color.red)
                    })
                }.frame(maxWidth: .infinity, maxHeight: .infinity)
                
                VStack {
                    Button(action: {
                        Bundle.setLanguage("ru")
                        welcome = "str_welcome".localized()
                    }, label: {
                        Text("Russian").foregroundColor(Color.white).frame(maxWidth: .infinity, maxHeight: .infinity).background(Color.blue)
                    })
                }.frame(maxWidth: .infinity, maxHeight: .infinity)
                
                VStack {
                    Button(action: {
                        Bundle.setLanguage("uz")
                        welcome = "str_welcome".localized()
                    }, label: {
                        Text("Uzbek").foregroundColor(Color.white).frame(maxWidth: .infinity, maxHeight: .infinity).background(Color.green)
                    })
                }.frame(maxWidth: .infinity, maxHeight: .infinity)
            }.frame(maxWidth: .infinity, maxHeight: 70).background(Color.gray)
        }
    }
}

struct LocalizationStrings_Previews: PreviewProvider {
    static var previews: some View {
        LocalizationStrings()
    }
}
