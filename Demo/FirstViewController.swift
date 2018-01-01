//
//  FirstViewController.swift
//  Demo
//
//  Created by Chandni Solanki on 12/01/17.
//  Copyright © 2017 ChandniSolanki. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var lblText: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK:- Action methods
    @IBAction func btnDismissClicked(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    func transformLabels(){
        UIView.animate(withDuration: 0.6, animations: {
            self.lblText.transform = CGAffineTransform(scaleX: 0.1, y: 0.1) }, completion: {
                (finish: Bool) in
                //                UIView.animate(withDuration: 0.6, animations: {
                //                    self.lblText.transform = CGAffineTransform.identity
                //                })
        })
    }
    public func scrollViewDidScroll(_ scrollView: UIScrollView){
        print("scrolling")
    }
}
