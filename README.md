# ``sis11sdk``


## Overview

This project is an iOS framework designed to enable developers to have functionalities available for rapid deployment. The framework leverages the Singleton pattern to keep user data accessible at all times.

## Features

- **Rapid Deployment**: Easily integrate and deploy functionalities into your iOS app.
- **Singleton Pattern**: Maintains user data accessibility throughout the app's lifecycle.
- **User Data Management**: Simplified management and retrieval of user data.

## Installation

To install the framework, follow these steps:

Swift Package Manager: Add the package dependency to your `Package.swift` file:
```
dependencies: [
    .package(url: "https://bitbucket.org/axxis_systems/sis11sdk/", from: "1.0.0")
]
```
Then add the framework as a dependency to your target:
```
.target(
    name: "YourAppTarget",
    dependencies: ["sis11sdk"]),
```
Usage
To use the framework, import it into your project and access its functionalities. Here's an example:
```
import sis11sdk

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        // Access the shared instance of the singleton
        let sdk = sis11sdk.shared

        // Use the framework's functionalities
        sdk.doAuth(credentials: Credentials(email: "your email", clave: "your password"))
    }
}
```
## Singleton Pattern

The framework uses the Singleton pattern to ensure that there is only one instance of the user data manager. This instance is globally accessible and provides a centralized way to manage user data.
