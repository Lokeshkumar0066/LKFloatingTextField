# LKFloatingTextField

Enter a text in UITextField And UITextView, it displays the placeholder as a subject.

![floating](https://user-images.githubusercontent.com/26429027/44324354-0a8ce400-a473-11e8-9070-e75231680d07.gif)


## Installation

Just drag LKFloatingTextField Library and import the classes.

## Customize

### Use IBInspectable

#### UITextField
![screen shot 2018-08-21 at 8 32 34 am](https://user-images.githubusercontent.com/26429027/44378061-2fd62c80-a51d-11e8-8caf-bdf080b3ef57.png)

#### UITextView
![screen shot 2018-08-21 at 8 33 01 am](https://user-images.githubusercontent.com/26429027/44378035-11703100-a51d-11e8-88d0-615bc1746fbf.png)

## Usage
Insert 'RaisePlaceholder' in your UITextField And UITextView custom class.                                                        
![screen shot 2018-08-21 at 8 33 22 am](https://user-images.githubusercontent.com/26429027/44378074-4086a280-a51d-11e8-84ff-1701e6c03b13.png)
![screen shot 2018-08-21 at 8 33 30 am](https://user-images.githubusercontent.com/26429027/44378077-41b7cf80-a51d-11e8-8417-e3f495b76d7d.png)

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
