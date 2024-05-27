//
//  URLRepository.swift
//  SGeneralUtility
//
//  Created by Sunil Verma on 26/05/24.
//

import Foundation


enum UrlRepository {
    case employee
    case employeeDetail(empId: String)
    
    var dataRequest: APIRequest {
        switch self {
        case .employee:
            return APIRequest(path: "employee", method: .get)
        case .employeeDetail(let empId):
            return APIRequest(path: "detail/\(empId)", method: .get)

        }
    }
}
