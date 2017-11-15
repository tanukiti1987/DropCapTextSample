//
//  ViewController.swift
//  DropCapTextSample
//
//  Created by ryusuke-sekiguchi on 2017/11/15.
//  Copyright © 2017年 tanukit1987. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var dropCapTextView: DropCapTextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        dropCapTextView.text = "吾輩（わがはい）は猫である。名前はまだ無い。どこで生れたかとんと見当（けんとう）がつかぬ。何でも薄暗いじめじめした所でニャーニャー泣いていた事だけは記憶している。吾輩はここで始めて人間というものを見た。しかもあとで聞くとそれは書生という人間中で一番獰悪（どうあく）な種族であったそうだ。"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

