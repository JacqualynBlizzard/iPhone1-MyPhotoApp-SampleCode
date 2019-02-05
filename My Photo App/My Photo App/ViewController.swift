//
//  ViewController.swift
//  My Photo App
//
//  Created by Jacqualyn Blizzard-Caron on 2/4/19.
//  Copyright © 2019 Jacqualyn Blizzard-Caron. All rights reserved.
//

import UIKit
import CoreImage

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    let backgroundImageView = UIImageView()
    //Part 3 Step 2
    var imagePickerController: UIImagePickerController!
    
    @IBOutlet weak var myImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackground()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    // Part 2
    @IBAction func handleTakePhotoPressed(_ sender: Any) {
        // Part 3 Step 3
        imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.sourceType = .camera
        present(imagePickerController, animated: true, completion: nil)
    }
    
    //Part 3 Step 4
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imagePickerController.dismiss(animated: true, completion: nil)
        myImageView.image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
    }
    @IBAction func handleSavePhotoPressed(_ sender: Any) {
        saveImage(imageName: "test.png")
    }
    
    //Part 4
    func saveImage(imageName: String) {
        let fileManager = FileManager.default
        let imagePath = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString).appendingPathComponent(imageName)
        let image = myImageView.image!
        let imageData = image.pngData()
        fileManager.createFile(atPath: imagePath as String, contents: imageData, attributes: nil)
    }
    
    //Extension 2 - Filter Buttons
    //FilterOne is Sepia
    @IBAction func handleFilterOne(_ sender: Any) {
        let context = CIContext()
        let filter = CIFilter(name: "CISepiaTone")!
        filter.setValue(0.8, forKey: kCIInputIntensityKey)
        let image = CIImage(image: myImageView.image!)
        filter.setValue(image, forKey: kCIInputImageKey)
        let result = filter.outputImage!
        let cgImage = context.createCGImage(result, from: result.extent)
        let filteredImage = UIImage(cgImage: cgImage!)
        let newImage = UIImage(cgImage: (filteredImage.cgImage!), scale: (filteredImage.scale), orientation: .right)
        myImageView.image = newImage
    }
    
    //FilterTwo is Instant
    @IBAction func handleFilterTwo(_ sender: Any) {
        let context = CIContext()
        let filter = CIFilter(name: "CIPhotoEffectInstant")!
        let image = CIImage(image: myImageView.image!)
        filter.setValue(image, forKey: kCIInputImageKey)
        let result = filter.outputImage!
        let cgImage = context.createCGImage(result, from: result.extent)
        let filteredImage = UIImage(cgImage: cgImage!)
        let newImage = UIImage(cgImage: (filteredImage.cgImage!), scale: (filteredImage.scale), orientation: .right)
        myImageView.image = newImage
    }
    
    //FilterThree is Halftone
    
    @IBAction func handleFilterThree(_ sender: Any) {
        let context = CIContext()
        let filter = CIFilter(name: "CICMYKHalftone")!
        filter.setValue(25, forKey: kCIInputWidthKey)
        let image = CIImage(image: myImageView.image!)
        filter.setValue(image, forKey: kCIInputImageKey)
        let result = filter.outputImage!
        let cgImage = context.createCGImage(result, from: result.extent)
        let filteredImage = UIImage(cgImage: cgImage!)
        let newImage = UIImage(cgImage: (filteredImage.cgImage!), scale: (filteredImage.scale), orientation: .right)
        myImageView.image = newImage
    }
    
    // Part 1 Optional Background
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

}

