
import Foundation

class EmployeeViewModel: ObservableObject {

    @Published var employees = [EmployeeData]()
    @Published var employee = EmployeeData()
    
    @Published var isLoading = false
    @Published var isCreated = false
    @Published var isUpdated = false
    @Published var isDeleted = false

    // Post List API
    func apiEmployeeList() {
        self.isLoading = true
        AFHttp.get(url: AFHttp.API_EMPLOYEE_LIST, params: [:], handler: { response in
            self.isLoading = false
            switch response.result {
            case .success:
                self.employees = (try! JSONDecoder().decode(Employee.self, from: response.data!)).datas!
                print(self.employees)
            case let .failure(error):
                print(error)
            }
        })
    }

    // Signle Post API
    func apiEmployeeSingle(id: Int) {
        self.isLoading = true
        AFHttp.get(url: AFHttp.API_EMPLOYEE_SINGLE + String(id), params: [:], handler: { response in
            self.isLoading = false
            switch response.result {
            case .success:
                self.employee = (try! JSONDecoder().decode(Employee.self, from: response.data!)).data!
                print(self.employee)
            case let .failure(error):
                print(error)
            }
        })
    }

    // Create Post Api
    func apiEmployeeCreate(employee: Employee) {
        self.isLoading = true
        AFHttp.post(url: AFHttp.API_EMPLOYEE_CREATE, params: AFHttp.paramsEmployeeCreate(employee: employee), handler: { response in
            self.isLoading = false
            switch response.result {
            case .success:
                print(response.result)
                self.isCreated = true
            case let .failure(error):
                print(error)
            }
        })
    }

    // Update Post Api
    func apiEmployeeUpdate(post: Post) {
        self.isLoading = true
        AFHttp.put(url: AFHttp.API_EMPLOYEE_UPDATE + String(post.id!), params: AFHttp.paramsEmployeeUpdate(employee: Employee.init()), handler: { response in
            self.isLoading = false
            switch response.result {
            case .success:
                print(response.result)
                self.isUpdated = true
            case let .failure(error):
                print(error)
            }
        })
    }

    // Delete Post Api
    func apiEmployeeDelete(data: EmployeeData) {
        self.isLoading = true
        AFHttp.del(url: AFHttp.API_EMPLOYEE_DELETE + String(data.id!), params: [:], handler: { response in
            self.isLoading = false
            switch response.result {
            case .success:
                print(response.result)
                self.isDeleted = true
            case let .failure(error):
                print(error)
            }
        })
    }
}
