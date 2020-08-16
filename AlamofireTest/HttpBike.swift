//
//  HttpBike.swift
//  AlamofireTest
//
//  Created by 劉家瑋 on 2020/8/10.
//  Copyright © 2020 劉家瑋. All rights reserved.
//

import Foundation
import Alamofire

class HttpBike {
    static let shared = HttpBike()
    fileprivate var session = Session()

    func request<T>(url: String, method: HTTPMethod, parameters: Parameters?, type: T.Type, success: ((Decodable) -> Void)?, failure:(() -> Void)?) where T: Decodable {
        session.request(url, method: method, parameters: parameters, encoding: URLEncoding.queryString, headers: nil).response { (response) in
            //200成功抓取到
            if response.response!.statusCode == 200 {
                do {
                    let result = try JSONDecoder().decode(type, from: response.data!)
                    success?(result)
                } catch {
                    failure?()
                }
            } else {
                failure?()
            }
        }
    }
}
