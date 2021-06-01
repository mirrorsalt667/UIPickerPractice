//
//  PickerViewController.swift
//  UIPickerPractice
//
//  Created by Stephen on 2021/6/1.
//

import UIKit

//為viewController 增加３個繼承屬性
class PickerViewController: UIViewController, UITextFieldDelegate, UIPickerViewDataSource, UIPickerViewDelegate {
    
    //增加ViewController繼承屬性後後出現紅色錯誤，按下fix出現以下func
    //UIPickerView選項群組數目，這個專案為１
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    //UIPickerView選項數量，設置為22個縣市Array數量
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        counties.count
    }
    
    //UIPickerView選項內容
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return counties[row]
    }
    
    //判斷點擊UIPickerView時選取的選項
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //TextField顯示選取的選項
        countyTextField.text = counties[row]
    }

    //在TextField旁設置確認按鈕
    @IBAction func sureButton(_ sender: Any) {
        //若TextField不是空的，則顯示該縣市名產圖片
        if countyTextField.text?.isEmpty == false {
            foodImage.image = UIImage(named: countyTextField.text!)
        } else {
            //若TextField是空的則出現警告框
            let alert = UIAlertController(title: "注意", message: "未選擇縣市名稱", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "好！", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        }
    }
    
    //TextFeild
    @IBOutlet weak var countyTextField: UITextField!
    
    //imageView
    @IBOutlet weak var foodImage: UIImageView!
    
    //pickerView，在storyboard取消installed設定，故不會出現在storyboard
    @IBOutlet weak var countyPickView: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //設置TextField及PickerView 的 delegate
        countyTextField.delegate = self
        countyPickView.delegate = self
        countyPickView.dataSource = self
        
        //讓點擊textField應出現的鍵盤，替換成PickerView
        countyTextField.inputView = countyPickView
    }
    
    //點擊空白處收起鍵盤
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    //縣市名稱array
    var counties = ["基隆市","臺北市","新北市","桃園市","新竹市","新竹縣","苗栗縣","臺中市","南投縣","彰化縣","雲林縣","嘉義縣","嘉義市","臺南市","高雄市","屏東縣","臺東縣","花蓮縣","宜蘭縣","澎湖縣","金門縣","連江縣"]

}
