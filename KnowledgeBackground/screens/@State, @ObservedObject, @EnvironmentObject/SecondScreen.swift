//
//  SecondScreen.swift
//  KnowledgeBackground
//
//  Created by Mahmudov Asrbek Ulug'bek o'g'li on 28/08/21.
//

import SwiftUI

struct SecondScreen: View {
    //@State var count = 0
    //@ObservedObject var settings: UserSettings
    @EnvironmentObject var settings: UserSettings
    var body: some View {
        Text("Your count is \(settings.count)").padding().font(.title3)
    }
}

struct SecondScreen_Previews: PreviewProvider {
    static var previews: some View {
        SecondScreen()
        //SecondScreen(settings: UserSettings())
    }
}
