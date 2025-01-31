# 📱 Stock News App 

**Short project description:**  
StockNews is an iOS application that fetches and displays the latest stock-related news using Swift and UIKit.

---
## 📸 App Preview  

<p align="center">
    <img src="https://github.com/user-attachments/assets/9fbae1a7-d628-4667-b878-42ef72951fb4" width="45%">
    <img src="https://github.com/user-attachments/assets/86ea420f-2bb8-453d-b9a4-254165b39733" width="50%">
</p>


## ✨ Features  

✅ Fetch and display stock-related news from JSON data  
✅ Support for dynamic UI updates using `UICollectionView` and `UITableview` 
✅ Local JSON file parsing  

---

## 📥 Installation  

### **1️⃣ Clone the Repository**  
```sh
git clone https://github.com/fauziardha1/MachineTest.git
cd MachineTest
```

### **2️⃣ Open the Project**  
- Open `MachineTest.xcodeproj`

### **3️⃣ Build and Run**  
- Select a target device or simulator in Xcode.  
- Press **Cmd + R** or click the ▶️ button to run the app.  

---

## 📋 Requirements  

✅ iOS 13.0+  
✅ Xcode 14+  
✅ Swift 5  

---

## 🚀 How to Use  

1. Launch the app.  
2. The home screen will display a list of stock news.  
3. Tap on any article to read more.  

---

## 📂 Project Structure  

```
📂 MachineTest
├── 📂 Features
│   📂 News
│   ├──📂 Presentation
│   │    ├──📂 Components
│   │    │   ├── CategoryCell.swift
│   │    │   ├── NewsCell.swift
│   │    │
│   │    ├── ViewController.swift
│   │    ├── NewsViewModel.swift
│   │
│   ├──📂 Domain
│       ├──📂 Entity
│       │   ├── News.swift
│       │   ├── Category.swift
│       │
│       ├── NewsInteractor.swift
│
├── 📂 Data
│   ├── 📂 JSON
│       ├── Category.json
│       ├── NEWS.json
│
├── Assets.xcassets
├── AppDelegate.swift
├── SceneDelegate.swift
├── Info.plist
├── MachineTest.xcodeproj
├── README.md
```

---

## 🛠️ Technologies Used  

- **Swift 5** – Main programming language  
- **UIKit** – UI framework  
- **JSONDecoder** – Parsing JSON data  
- **Auto Layout** – Responsive UI  
- **Git** – Version control  

---

## 🤝 Contributing  

Contributions are welcome! To contribute:  

1. Fork the repo.  
2. Create a new branch:  
   ```sh
   git checkout -b feature-branch
   ```
3. Commit your changes:  
   ```sh
   git commit -m "Add new feature"
   ```
4. Push to the branch:  
   ```sh
   git push origin feature-branch
   ```
5. Open a **Pull Request**.

---

## 📄 License  

This project is licensed under the **MIT License** – see the [LICENSE](LICENSE) file for details.  

---

## 📧 Contact  

📌 **Author:** Fauzi Arda  
📌 **GitHub:** [@fauziardha1](https://github.com/fauziardha1)  
📌 **Email:** fauziardasaputra@gmail.com  

---

### 🎉 Happy Coding! 🚀  
