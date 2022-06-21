//
//  InputCategoryPicker.swift
//  Moasa
//
//  Created by 김원희 on 2022/06/13.
//

import Foundation
import SwiftUI

struct InputCategoryPicker: UIViewRepresentable {
    var data: [String]
    @Binding var lastSelectedIndex: Int?
    private let textField = UITextField()
    private let pikcerView = UIPickerView()
    private let helper = Helper()
    func makeCoordinator() -> Coordinator {
        return Coordinator(data: self.data) { (index) in
            self.lastSelectedIndex = index
        }
    }
    func makeUIView(context: UIViewRepresentableContext<InputCategoryPicker>) -> UITextField {
        self.pikcerView.delegate = context.coordinator
        self.pikcerView.dataSource = context.coordinator
        self.textField.inputView = pikcerView
        self.textField.delegate = context.coordinator
        self.textField.frame = .zero
        self.textField.setContentHuggingPriority(.defaultLow, for: .horizontal)
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(title: "Done", style: .plain,
                                         target: self.helper, action: #selector(self.helper.doneButtonAction))
        toolbar.setItems([flexibleSpace, doneButton], animated: true)
        self.textField.inputAccessoryView = toolbar
        self.helper.doneButtonTapped = {
            if self.lastSelectedIndex == nil {
                self.lastSelectedIndex = 0
            }
            self.textField.resignFirstResponder()
        }
        return self.textField
    }
    func updateUIView(_ uiView: UITextField, context: UIViewRepresentableContext<InputCategoryPicker>) {
        //           uiView.text = text
        if let lastSelectedIndex = lastSelectedIndex {
            uiView.text = self.data[lastSelectedIndex]
        }
    }
    class Helper {
        var doneButtonTapped: (() -> Void)?
        @objc func doneButtonAction() {
            self.doneButtonTapped?()
        }
    }
    class Coordinator: NSObject, UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate {
        private var data: [String]
        private var didSelectItem: ((Int) -> Void)?
        init(data: [String], didSelectItem: ((Int) -> Void)? = nil) {
            self.data = data
            self.didSelectItem = didSelectItem
        }
        func numberOfComponents(in pickerView: UIPickerView) -> Int {
            return 1
        }
        func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            return self.data.count
        }
        func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
            return self.data[row]
        }
        func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
            self.didSelectItem?(row)
        }
    }
}
