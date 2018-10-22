//
//  ViewController.swift
//  PDFNotes
//
//  Created by Noel Jander on 25.09.18.
//  Copyright © 2018 Noel Jander. All rights reserved.
//

import UIKit
import DrawingPDF
import PDFKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let path = Bundle.main.path(forResource: "test", ofType: "pdf") {
            if let pdfDocument = PDFDocument(url: URL(fileURLWithPath: path)) {
                print("\(path)")
                let pdfView = PDFDrawingView(frame: view.frame, document: pdfDocument, delegate: self)
                view.addSubview(pdfView)
                print("\(pdfView.currentPageNumber)")
                pdfView.drawingColor = UIColor.black
                pdfView.drawingKey = PDFDrawingView.DrawingKeys.draw
            }
        }
    }
    
}

extension ViewController: PDFDelegate{
    // Wird jedesmal aufgerufen, wenn zu einer neuen Seite weiter gescrollt wird
    func scrolled(to page: Int) {
        print("Hellooooo")
    }
    
    func viewWasCreated() {
        print("Halloooo")
    }
}

