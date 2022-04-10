//
//  HomeScreen.swift
//  KnowledgeBackground
//
//  Created by Mahmudov Asrbek Ulug'bek o'g'li on 18/09/21.
//

import SwiftUI
import Firebase

struct HomeScreen: View {
    
    @EnvironmentObject var session: SessionStore
    @ObservedObject var database = RealtimeStore()
    @State var isLoading = false
    
    func doSignOut() {
        if SessionStore().signOut() {
            session.listen()
        }
    }
    
    func apiPosts() {
        isLoading = true
        database.loadPosts {
            print(database.items.count)
            print(database.items)
            isLoading = false
        }
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                List {
                    ForEach(database.items, id: \.self) { item in
                        PostCell(post: item)
                    }
                }.listStyle(PlainListStyle())
                
                if isLoading {
                    ProgressView()
                }
            }.navigationBarItems(trailing:
                                    HStack {
                                        NavigationLink(
                                            destination: AddPostScreen(),
                                            label: {
                                                Image(systemName: "note.text.badge.plus")
                                                    .foregroundColor(.primary)
                                            })
                                        Button(action: {
                                            doSignOut()
                                        }, label: {
                                            Image(systemName: "pip.exit")
                                                .foregroundColor(.primary)
                                        })
                                    }
            )
            .navigationBarTitle("Posts", displayMode: .inline)
        }.onAppear {
            apiPosts()
        }
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
