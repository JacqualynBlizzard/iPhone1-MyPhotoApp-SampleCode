//
//  GalleryViewController.swift
//  My Photo App
//
//  Created by Jacqualyn Blizzard-Caron on 2/4/19.
//  Copyright © 2019 Jacqualyn Blizzard-Caron. All rights reserved.
//

import UIKit

class GalleryViewController: UIViewController {
    let backgroundImageView = UIImageView()
    
    @IBOutlet weak var galleryImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackground()
        getImage(imageName: "test.png")
        // Do any additional setup after loading the view.
    }
    
    // Part 5
    func getImage(imageName: String) {
        let fileManager = FileManager.default
        let imagePath = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString).appendingPathComponent(imageName)
        if fileManager.fileExists(atPath: imagePath) {
            //galleryImageView.image = UIImage(contentsOfFile: imagePath)
            let image = UIImage(contentsOfFile: imagePath)
            let newImage = UIImage(cgImage: (image?.cgImage!)!, scale: (image?.scale)!, orientation: .right)
            galleryImageView.image = newImage
        } else {
            print("Oh no! No Image!")
        }
    }
    // Optional Part 1 Background
    func setBackground() {
        view.addSubview(backgroundImageView)
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        backgroundImageView.image = UIImage(named: "background")
        view.sendSubviewToBack(backgroundImageView)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
