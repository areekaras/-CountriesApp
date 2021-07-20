# Project Title - CountriesApp

A sample iOS application that allows a user to select a country and display a
small amount of information about that country, including displaying the
country’s flag.

Built using Xcode 12.4 (Swift 5)

## How to run the project?

 1. Clone this repo
 2. Open shell window and navigate to project folder
 3. Run  `pod install`
 4. Open  `CountriesApp.xcworkspace`  and run the project on selected device or simulator

## Architecture

 -  MVVM
 - Coordinators used for routing mechanism
 - Protocol oriented programming

## Network Layer

 - A full protocol oriented network layer
 - Countries data recieved via api [restcountries.eu](https://restcountries.eu/rest/v2/all) 
 - Parsing JSON using the Codable protocol

## External dependency

 - [SDWebImageSVGCoder](https://github.com/SDWebImage/SDWebImageSVGCoder) which provide the image loading support for SVG images with caching. 

## UI

 - [x] Dark mode enabled
 - [x] Skeleton view animation before loading content
 - [x] Device orientation: Portrait and Landscape

## Unit testing

 - Sample unit testing for ViewModel dependency injection
