
import SwiftUI

struct AddPostScreen: View {
    
    @EnvironmentObject var session: SessionStore
    @Environment(\.presentationMode) var presentation
    @ObservedObject var database = RealtimeStore()
    @ObservedObject var storage = StorageStore()
    @State var isLoading = false
    @State var title: String = ""
    @State var content: String = ""
    
    @State private var sourceType: UIImagePickerController.SourceType = .photoLibrary
    @State private var selectedImage: UIImage?
    @State private var isImagePickerDisplay = false
    
    func addNewPost(urlString: String) {
        let post = PostInfo(title: title, content: content, imgUrl: urlString)
        database.storePost(post: post, completion: { success in
            isLoading = false
            if success {
                print(success)
                self.presentation.wrappedValue.dismiss()
            }
        })
    }
    
    func uploadImage() {
        isLoading = true
        if selectedImage != nil {
            storage.uploadImage(selectedImage!, completion: { downloadURl in
                let urlString = downloadURl!.absoluteString
                print(urlString)
                addNewPost(urlString: urlString)
            })
        }
    }
    
    var body: some View {
        ZStack {
            VStack {
                if self.selectedImage != nil {
                    Image(uiImage: selectedImage!).resizable().frame(width: 100, height: 100).scaledToFill().cornerRadius(10)
                } else {
                    Button(action: {
                        self.sourceType = .camera
                        self.isImagePickerDisplay.toggle()
                    }, label: {
                        Image("image_picker").resizable().frame(width: 100, height: 100).scaledToFit().cornerRadius(10)
                    }).sheet(isPresented: self.$isImagePickerDisplay) {
                        ImagePickerView(selectedImage: $selectedImage, sourceType: self.sourceType)
                    }
                }
                
                TextField("Title", text: $title)
                    .frame(height: 50)
                    .padding(.leading, 10)
                    .background(Color.gray.opacity(0.2).cornerRadius(8))
                
                TextField("Content", text: $content)
                    .frame(height: 70)
                    .padding(.leading, 10)
                    .background(Color.gray.opacity(0.2).cornerRadius(8))
                
                Button(action: {
                    uploadImage()
                }, label: {
                    HStack {
                        Spacer()
                        Text("Add")
                            .foregroundColor(.white)
                        Spacer()
                    }
                })
                .frame(height: 45)
                .background(Color.blue)
                .cornerRadius(8)
                Spacer()
            }.padding()
            
            if isLoading {
                ProgressView()
            }
        }.navigationTitle("Add Post")
    }
}

struct AddPostScreen_Previews: PreviewProvider {
    static var previews: some View {
        AddPostScreen()
    }
}
