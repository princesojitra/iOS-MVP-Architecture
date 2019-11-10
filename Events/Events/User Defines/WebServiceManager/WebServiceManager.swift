//
//  WebServiceManager.swift
//  Events
//
//  Created by Prince Sojitra on 16/9/19.
//  Copyright © 2019 Prince Sojitra. All rights reserved.


import Foundation
import UIKit

class WebServiceManager: NSObject {
    
    private override init() { }
    
    static let shared:WebServiceManager  = WebServiceManager()
    
    func callWebService(WSUrl:String, WSMethod:HttpMethod,WSParams:[String:Any] ,WSHeader :Dictionary<String, AnyObject>,isShowLoader:Bool = true,LoaderColor:UIColor = Constants.Colours.PrimaryBlue,WSCompletionBlock:@escaping (_ data:AnyObject?,_ error:APIError?) -> ()) {
        
        //Show loader during api call
        if isShowLoader {
            CustomLoader.shared.showLoader(color:LoaderColor)
        }
        
        print("******* API Log ******")
        print("URL : ", WSUrl)
        print("Params : ", WSParams)
        print("Header :", WSHeader)
        
        //check if it's a valid url before api call
        guard let wsUrl = URL(string: WSUrl) else {
            WSCompletionBlock(nil,.unsuppotedURL)
            return
        }
        
        var request = URLRequest(url: wsUrl)
        request.httpMethod = WSMethod.rawValue
        
        //Check if web service params can be serialize or not before api call
        if WSMethod == .Post {
            let jsonTodo: Data
            do {
                jsonTodo = try JSONSerialization.data(withJSONObject: WSParams, options: [])
                request.httpBody = jsonTodo
            } catch {
                print("Error: cannot create JSON from todo")
                WSCompletionBlock(nil,.invalidPostParms)
                return
            }
        }
        
        URLSession.shared.dataTask(with: request) { (data, response
            , error) in
            
            //Check error does not exist otherwise throw error
            guard error == nil else {
                
                WSCompletionBlock(nil,.invalidResponse)
                return
            }
            
            //Check response data exist otherwise throw error
            guard let responseData = data else {
                
                WSCompletionBlock(nil,.notFound)
                return
            }
            
            do {
                let jsonResponse:Any? = try JSONSerialization.jsonObject(with: responseData, options:.allowFragments)
                
                print("Response :",jsonResponse ?? "")
                print("******* API Log ******")
                WSCompletionBlock(jsonResponse as AnyObject?,nil)
                
            } catch {
                
                print("Response error : \(error)")
                print("******* API Log ******")
                WSCompletionBlock(nil,.unknownError)
            }
            
            }.resume()
    }
}

