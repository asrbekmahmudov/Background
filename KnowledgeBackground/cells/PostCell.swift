//
//  PostCell.swift
//  KnowledgeBackground
//
//  Created by Mahmudov Asrbek Ulug'bek o'g'li on 18/09/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct PostCell: View {
    
    var post: PostInfo
    
    var body: some View {
        HStack {
            if post.imgUrl != nil {
                WebImage(url: URL(string: post.imgUrl!)).resizable().frame(width: 100, height: 100)
            } else {
                Image("image_picker").resizable().frame(width: 100, height: 100)
            }
            
            VStack(alignment: .leading) {
                Text(post.title!.uppercased()).fontWeight(.bold)
                Text(post.content!).padding(.top, 5)
            }.padding()
        }
    }
}

struct PostCell_Previews: PreviewProvider {
    static var previews: some View {
        PostCell(post: PostInfo(title: "title", content: "content"))
    }
}
