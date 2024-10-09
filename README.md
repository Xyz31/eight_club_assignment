# project_eight_second

A new Flutter project.


## ScreenShots

<div align="center">
  <img src="https://github.com/user-attachments/assets/f9edeab4-3a3c-44a4-a28f-d8edbaf22650" width="45%" />
  <img src="https://github.com/user-attachments/assets/42aad29c-72dc-4a1f-8697-fba4b52584a1" width="45%" />
</div>

<div align="center">
  <img src="https://github.com/user-attachments/assets/552d286b-8eb4-42f5-b03f-00cbe22a39f1" width="45%" />
  <img src="https://github.com/user-attachments/assets/d3588d17-5acf-43fb-89e2-2b9199957c10" width="45%" />
</div>

## videon demonstration



https://github.com/user-attachments/assets/f1c4d72e-29df-420f-8f9b-5b1b39e31d95



# 📱 Experience Selection & Onboarding App

This Flutter project implements a two-step onboarding flow consisting of an Experience Type Selection screen and an Onboarding Question screen. The main objective was to create a clean, user-friendly interface with proper state management and dynamic UI. 

🚧 **Note**: The functionality for **Voice and Video recording** is currently pending implementation.

## 📋 Project Overview

### ✔️ Implemented Features

#### 1. **Experience Type Selection Screen**
   - **Fetch and Display Experiences**: Retrieves a list of experiences from the provided API and displays them as interactive cards.
   - **Selection/Deselection**: Users can select or deselect experiences, with each card toggling its state based on selection.
   - **Multi-line Text Input**: Added a multi-line text field with a character limit of 250.
   - **Grayscale Unselected State**: Unselected cards are shown with a grayscale filter.
   - **Multiple Selections**: Users can select multiple experience cards simultaneously.
   - **State Management**: Selected experience IDs and text inputs are stored in the app’s state.
   - **Navigation**: Logs the state and navigates to the Onboarding Question screen on clicking the "Next" button.

#### 2. **Onboarding Question Screen**
   - **Text Input Field**: Added a multi-line text field with a 600 character limit.
   - **Dynamic Layout**: The layout dynamically adjusts based on recorded asset availability.
   - **Navigation Support**: "Next" button implemented to handle state logging and future navigation.

### 🚧 Pending Implementation
- **Voice Recording**: Feature to record and playback audio answers is not yet implemented.
- **Video Recording**: Feature to capture and playback video answers is pending development.

---

## 🛠️ Brownie Points Implemented

- **Pixel-Perfect Design**: The UI follows the Figma file closely with correct spacings, fonts, and colors.
- **Responsive Layout**: Handled keyboard overlay and reduced viewport scenarios for smooth UI interactions.
- **State Management**: Integrated `Riverpod` for managing the state efficiently.
- **API Calls**: Used `Dio` for API management and seamless data fetching.

### ✨ Optional Animations Added
- **Experience Screen**: Animated the card to move to the first index on selection.

---


### 🚀 Submission Details

- **Code Quality**: The project is organized with clean, readable code, and proper comments are added where necessary.
- **Repository**: Pushed to GitHub with a clear README detailing features and implementation status.

### 🎨 Design Reference

- [Figma Design File](https://www.figma.com/design/WLHY8QN57gHYTApzZD9t1A/%F0%9F%8E%A8-EXT-FLUT-02-Assignment?node-id=0-1&t=9vFL4BBf6wA9wUBk-1)

### 📹 Demo

Please check the attached screen shots in the repository for a demonstration of the implemented functionalities.

### 💡 Note

Feel free to reach out for any queries or suggestions. I'm open to feedback to further refine the project and complete the pending functionalities.


