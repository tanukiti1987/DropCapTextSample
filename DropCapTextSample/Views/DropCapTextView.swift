//
//  DropCapTextView.swift
//  DropCapTextSample
//
//  Created by ryusuke-sekiguchi on 2017/11/15.
//  Copyright © 2017年 tanukit1987. All rights reserved.
//

import UIKit

class DropCapTextView: UIView {
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var dropCapImageView: UIImageView!

    var body: String = ""

    var text: String {
        get {
            return body
        }
        set {
            body = newValue
            if body != "" {
                updateTextView()
            }
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        loadFromNib()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        loadFromNib()
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func loadFromNib() {
        let view = Bundle.main.loadNibNamed("DropCapTextView", owner: self, options: nil)?.first as! UIView
        view.frame = self.bounds
        self.addSubview(view)
    }

    func setTextAttributes() {
        let fontSize: UIFont = UIFont.systemFont(ofSize: 17.0)

        let style: NSMutableParagraphStyle = NSMutableParagraphStyle()
        style.alignment = NSTextAlignment.left
        style.lineBreakMode = NSLineBreakMode.byWordWrapping
        style.minimumLineHeight = 30

        let attributes = [
            NSAttributedStringKey.font: fontSize,
            NSAttributedStringKey.paragraphStyle: style,
            NSAttributedStringKey.foregroundColor: UIColor.black,
            NSAttributedStringKey.backgroundColor: UIColor.clear
        ]

        textView.attributedText = NSAttributedString(string: textView.text, attributes: attributes)
    }

    func updateTextView() {
        textView.text = String(body[body.index(body.startIndex, offsetBy: 1)...])
        setTextAttributes()

        dropCapImageView.image = createDropCapImage(text: String(body[body.startIndex]))
        let exclusionRect = CGRect(x: 0, y: 0, width: dropCapImageView.frame.size.width, height: dropCapImageView.frame.size.height)
        let path: UIBezierPath = UIBezierPath(rect: exclusionRect)
        textView.textContainer.exclusionPaths = [path]
    }

    func createDropCapImage(text: String) -> UIImage {
        let size = CGSize(width: dropCapImageView.frame.size.width, height: dropCapImageView.frame.size.height)
        UIGraphicsBeginImageContext(size)

        let fontSize: UIFont = UIFont.systemFont(ofSize: 42.0)

        let style: NSMutableParagraphStyle = NSMutableParagraphStyle()
        style.alignment = NSTextAlignment.center
        style.lineBreakMode = NSLineBreakMode.byClipping
        style.minimumLineHeight = 30

        let attributes = [
            NSAttributedStringKey.font: fontSize,
            NSAttributedStringKey.paragraphStyle: style,
            NSAttributedStringKey.foregroundColor: UIColor.black,
            NSAttributedStringKey.backgroundColor: UIColor.clear
        ]

        text.draw(in: CGRect(x: 0, y: 0, width: size.width, height: size.height), withAttributes: attributes)
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext() as UIImage!
        UIGraphicsEndImageContext()

        return image
    }
}
