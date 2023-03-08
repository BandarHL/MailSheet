# MailSheet

MailSheet is a Swift library that replicates the menu sheet of the Apple Mail application. It provides a customizable and easy-to-use interface for presenting a menu of options to the user.


# Requirements
- iOS 15.0+
- Swift 5.0+


# Installation
The [Swift Package Manager](https://swift.org/package-manager/) is a tool for managing the distribution of Swift code. It’s integrated with the Swift build system to automate the process of downloading, compiling, and linking dependencies.

To integrate `MailSheet` into your Xcode project using Xcode 12, specify it in `File > Swift Packages > Add Package Dependency...`:

```ogdl
https://github.com/BandarHL/MailSheet.git, :branch="main"
```


# Usage
Using MailSheet is easy. Here's an example of how to create a menu sheet:

```swift
import MailSheet

// Config the navigation view
let config = MailSheetNavigationConfig(title: "Discord", subtitle: "Hey! We wanted to let you know that we're updating our Terms of Service, Paid Services Terms, Privacy Policy, and Community Guidelines.", image: UIImage(named: "2.jpeg")!)

let sheetViewController = MailSheetViewController(navigationConfig: config, sections: [
    
    // Define Box cell section
    MailSheetSection(type: .boxCell, items: [
        MailSheetItem(title: "Reply", image: UIImage(systemName: "arrowshape.turn.up.left.fill")!, action: { item in
            print(item)
        }),
        MailSheetItem(title: "Reply All", image: UIImage(systemName: "arrowshape.turn.up.left.2.fill")!, action: { item in
            print(item)
        }),
        MailSheetItem(title: "Forward", image: UIImage(systemName: "arrowshape.turn.up.forward.fill")!, action: { item in
            print(item)
        }),
        MailSheetItem(title: "Trash", image: UIImage(systemName: "trash.fill")!, action: { item in
            print(item)
        }),
    ]),
    
    // Define Long cell section
    MailSheetSection(type: .longCell, items: [
        MailSheetItem(title: "Remind Me", image: UIImage(systemName: "clock")!, action: { item in
            print(item)
        }),
        MailSheetItem(title: "Flag", image: UIImage(systemName: "flag")!, action: { item in
            print(item)
        }),
        MailSheetItem(title: "Mark as Read", image: UIImage(systemName: "envelope.open")!, action: { item in
            print(item)
        }),
        MailSheetItem(title: "Move Message", image: UIImage(systemName: "folder")!, action: { item in
            print(item)
        }),
        MailSheetItem(title: "Archive Message", image: UIImage(systemName: "archivebox")!, action: { item in
            print(item)
        }),
        MailSheetItem(title: "Move to Junk", image: UIImage(systemName: "xmark.bin")!, action: { item in
            print(item)
        }),
        MailSheetItem(title: "Mute", image: UIImage(systemName: "bell.slash")!, action: { item in
            print(item)
        }),
        MailSheetItem(title: "Notify Me", image: UIImage(systemName: "bell")!, action: { item in
            print(item)
        }),
        MailSheetItem(title: "Block Sender", image: UIImage(systemName: "nosign")!, action: { item in
            print(item)
        }),
    ])
])

// Present the sheet view controller
sheetViewController.show(on: self)
```

# Preview
<img src="https://user-images.githubusercontent.com/31299470/223842741-db9c5e9b-a4db-4074-a9f4-338505f6065e.mp4" alt="1" width="280"/>


# TODO
- [ ] Add color customizable options.
- [ ] Improve documentation.
