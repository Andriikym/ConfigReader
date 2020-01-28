/**
*  ConfigReader Example
*  Copyright (c) Andrii Myk 2020
*  Licensed under the MIT license (see LICENSE file)
*/

import UIKit
import ExampleLibrary

class ViewController: UIViewController {

    @IBOutlet weak var labelTop: UILabel!
    @IBOutlet weak var labelCenter: UILabel!
    @IBOutlet weak var labelBottom: UILabel!

    @IBOutlet weak var additionalLabelTop: UILabel!
    @IBOutlet weak var additionalLabelCenter: UILabel!
    @IBOutlet weak var additionalLabelBottom: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        showConfigurationValues()
        showConfigsFromAnotherBundle()
    }
    
    private func showConfigurationValues() {
        let hostURL = Configuration.hostURL.stringValue
        let bridgeURL = Configuration.bridgeURL.stringValue
        let identifier = Configuration.contanerID.stringValue
        
        labelTop.text = hostURL
        labelCenter.text = bridgeURL
        labelBottom.text = identifier
    }
    
    private func showConfigsFromAnotherBundle() {
        let version = LibraryConfiguration.apiVersion.doubleValue
        let level = LibraryConfiguration.accessLevel.intValue
        let name = LibraryConfiguration.distributionName.stringValue
        let key = LibraryConfiguration.apiKey.stringValue
        
        additionalLabelTop.text = name + " " + "Level \(level)"
        additionalLabelCenter.text = "Version is \(version)"
        additionalLabelBottom.text = key

        
        let library = ExampleLibrary()
        library.printOKMessage()
    }
}

