# LKFloatingTextField

Enter a text in UITextField And UITextView, it displays the placeholder as a subject.

![floating](https://user-images.githubusercontent.com/26429027/44324354-0a8ce400-a473-11e8-9070-e75231680d07.gif)


## Installation

Just drag LKFloatingTextField Library and import the classes.

## Customize
### Use IBInspectable


## Usage
Insert 'RaisePlaceholder' in your UITextField And UITextView custom class.




## Use Code

#### UITextField
    self.txtFieldOne.activeLabelColor = [UIColor whiteColor];                                                         
    self.txtFieldTwo.activeLabelColor = [UIColor whiteColor];                                                         
    self.txtFieldOne.placeholderColor = [UIColor whiteColor];                                                         
    self.txtFieldTwo.placeholderColor = [UIColor whiteColor];    
   
#### UITextView
    self.txtViewMessage.placeholderColor = [UIColor whiteColor];                                                         
    self.txtViewMessage.placeholder = @"Address";                                                         
    self.txtViewMessage.placeholderFont = self.txtViewMessage.font;                                                         
