
import Foundation

struct Employee: Decodable {
    
    var status: String?
    var data: EmployeeData?
    var datas: [EmployeeData]?
    
}

struct EmployeeData: Decodable {
    var id: Int?
    var employee_name: String?
    var employee_salary: Int?
    var employee_age: Int?
    var profile_image: String?
    
    init() {

    }
    
    init(employee_name: String, employee_salary: Int, employee_age: Int, profile_image: String) {
        self.id = 1
        self.employee_name = employee_name
        self.employee_salary = employee_salary
        self.employee_age = employee_age
        self.profile_image = profile_image
    }

    init(id: Int, employee_name: String, employee_salary: Int, employee_age: Int, profile_image: String) {
        self.id = id
        self.employee_name = employee_name
        self.employee_salary = employee_salary
        self.employee_age = employee_age
        self.profile_image = profile_image
    }
}
