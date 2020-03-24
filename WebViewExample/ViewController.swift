//
//  ViewController.swift
//  WebViewExample
//
//  Created by moxDroid on 2020-03-24.
//  Copyright © 2020 moxDroid. All rights reserved.
//

import UIKit
import Webkit

class ViewController: UIViewController
{

    override func viewDidLoad()
    {
        super.viewDidLoad()
        loadLambtonUrl()
    }

 func loadLambtonUrl()
    {
        let url = URL(string: "https://www.lambtoncollege.ca/")
        let urlReq = URLRequest(url: url!)
        myWebKitView.load(urlReq)
    }
    
    func loadHtmlString()
    {
        let htmlString = "<h1>Hello World</h1>"
        myWebKitView.loadHTMLString(htmlString, baseURL: nil)
        
    }
    
    

    @IBAction func btnNavigation(_ sender: UIBarButtonItem)
    {
        switch sender.tag 
        {
        case 0:
            myWebKitView.reloadFromOrigin()
        case 1:
            if myWebKitView.canGoBack
            {
                print("Go back")
                myWebKitView.goBack()
            }else
            {
                print("Can't Go back")
            }
        default:
            print("No Navigation action found...")
        }
    }
    
}

