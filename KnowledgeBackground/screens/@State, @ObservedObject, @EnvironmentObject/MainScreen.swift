//
//  MainScreen.swift
//  KnowledgeBackground
//
//  Created by Mahmudov Asrbek Ulug'bek o'g'li on 28/08/21.
//

import SwiftUI

struct MainScreen: View {
    //@State var count = 0
    //@ObservedObject var settings = UserSettings()
    @EnvironmentObject var settings: UserSettings
    var body: some View {
        NavigationView {
            VStack {
                Text("Your count is \(settings.count)").padding().font(.title3)
                
                HStack {
                    Button(action: {
                        self.settings.count -= 1
                    }, label: {
                        Text("Decrease").padding().frame(width: 135).background(Color.red).foregroundColor(.white)
                    })
                    Button(action: {
                        self.settings.count += 1
                    }, label: {
                        Text("Increase").padding().frame(width: 135).background(Color.blue).foregroundColor(.white)
                    })
                }
                
                NavigationLink(
                    destination:
                        //SecondScreen(settings: settings)
                        SecondScreen(),
                    label: {
                        Text("Open Second Screen").padding()
                    })
            }
        }
    }
}

struct MainScreen_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen()
            .environmentObject(UserSettings())
    }
}
