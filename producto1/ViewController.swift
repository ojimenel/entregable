//
//  ViewController.swift
//  producto1
//
//  Created by GDL-JIMENEL on 03/05/16.
//  Copyright (c) 2016 GDL-JIMENEL. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtISBN: UISearchBar!
   
    @IBOutlet weak var textViewResult: UITextView!
    
    @IBAction func btnBuscar(sender: AnyObject) {
        
         sincrono()
        
    }
    
    
    @IBAction func btnLimpiar(sender: AnyObject) {
        
        txtISBN.text = " "
        textViewResult.text = " "
        
    }
    
    
   
    func sincrono() {
        
        let urls = "http://openlibrary.org/api/books?jscmd=data&format=json&bibkeys=ISBN:"+txtISBN.text!
        
        var url = NSURL(string:urls)
        if url == nil {
            
            textViewResult.text = "asegurese de que tiene conexión de internet o de que el ISBN no comienza con espacio"
            
        }
        else{
            
        
        let datos:NSData? = NSData(contentsOfURL: url!)
        let texto = NSString(data:datos!,encoding:NSUTF8StringEncoding)
        print(texto!, terminator: "")
        
        if texto?.length < 3 {
            
            textViewResult.text = "La consulta no se realizo con éxito, intente mas tarde"
        }
        else
        {
          textViewResult.text = String(texto)
        }
      }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
       textViewResult.text = " "
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    

}

