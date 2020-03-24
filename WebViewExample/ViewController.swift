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

     @IBOutlet weak var myWebKitView: WKWebView!
    
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
    
      @IBAction func btnHistory(_ sender: Any)
    {
        let history = myWebKitView.backForwardList.backList
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let historyTVC = sb.instantiateViewController(identifier: "historyTVC") as! HistoryTableViewController
        historyTVC.historyList = self.history
        navigationController?.pushViewController(historyTVC, animated: true)
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
          case 2:
            if myWebKitView.canGoForward
            {
               print("Go Next")
                myWebKitView.goForward()
            }
            else 
            {
                print("Can't Go Next")
            }
         case 3:
            myWebKitView.reload()
        default:
            print("No Navigation action found")
        }
    }
    
}

