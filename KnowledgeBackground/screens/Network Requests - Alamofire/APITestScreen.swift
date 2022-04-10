//
//  APITestScreen.swift
//  KnowledgeBackground
//
//  Created by Mahmudov Asrbek Ulug'bek o'g'li on 09/09/21.
//

import SwiftUI

struct APITestScreen: View {
    
    @ObservedObject var viewmodel = EmployeeViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                List(self.viewmodel.employees, id: \.id) { employeeDatas in
                    VStack(alignment: .leading) {
                        Text(employeeDatas.employee_name!.uppercased())
                            .fontWeight(.bold)
                        Text("\(employeeDatas.employee_salary!)").padding(.top, 5)
                        Text("\(employeeDatas.employee_age!)").padding(.top, 5)
                    }
                }
                
                if self.viewmodel.isLoading {
                    ProgressView()
                }
            }.navigationBarTitle("Posts")
        }.onAppear {
//            self.viewmodel.apiEmployeeList()
            self.viewmodel.apiEmployeeSingle(id: 1)
//            apiPostSingle(id: 1)
//            let post = Post(title: "pdp", body: "online")
//            apiPostCreate(post: post)
//            apiPostUpdate(post: post)
//            apiPostDelete(post: post)
        }

    }
}

struct APITestScreen_Previews: PreviewProvider {
    static var previews: some View {
        APITestScreen()
    }
}
