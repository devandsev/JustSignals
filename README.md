  # JustSignals

  [![Build Status](https://travis-ci.org/devandsev/JustSignals.svg?branch=develop)](https://travis-ci.org/devandsev/JustSignals)

  JustSignals is a type-safe alternative to NotificationCenter and delegates. Use it if you don't need binding and rx magic in your project, and just want to replace NotificationCenter with something more strict and safe. Otherwise take a look at [RxSwift](https://github.com/ReactiveX/RxSwift), [ReactiveCocoa](https://github.com/ReactiveCocoa/ReactiveCocoa) and [Bond](https://github.com/ReactiveKit/Bond).

  ## Installation

  ### [CocoaPods](https://guides.cocoapods.org/using/using-cocoapods.html)

  ```ruby
  # Podfile
  use_frameworks!

  target 'YOUR_TARGET_NAME' do
      pod 'JustSignals'
  end
  ```

  Replace `YOUR_TARGET_NAME` and then, in the `Podfile` directory, type:

  ```bash
  $ pod install
  ```

  ### [Carthage](https://github.com/Carthage/Carthage)

  Add this to `Cartfile`

  ```
  github "devandsev/JustSignals"
  ```

  In the `Cartfile` directory, type:

  ```bash
  $ carthage update
  ```

  ## Usage examples

  Signal without any data:

  ```swift
  let signal = Signal<Void>()
  signal.subscribe(with: self) {
      print("pong")
  }

  signal.fire(())
  ```

  Signal with data:

  ```swift
  let signal = Signal<Int>()
  signal.subscribe(with: self) { data in
      print(data)
  }

  signal.fire(36)
  ```

  If you need to pass multiple values:

  ```swift
  let signal = Signal<(Int, Float, String, Bool)>()
  signal.subscribe(with: self) { data in
      print(data)
  }

  signal.fire((3, 2.2, "test", false))
  ```

  Subscription cancels automatically if the object that has been subscribed to the signal is deallocated, but if you need to unsubscribe early, use this:

  ```swift
  signal.unsubscribe(self)
  ```
  
  ## License

  This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
