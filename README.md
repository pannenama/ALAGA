## OVERVIEW ## 
ALAGA is an offline-first medical records application created by Team MISMO as part of the 1st Naga City Mayoral Hackathon. It is designed to shift healthcare access from being facility-centered to patient-centered by allowing medical records to move with the patient. Through AI-assisted document processing and location-based facility recommendations, ALAGA helps patients understand their health information, share records securely, and access appropriate healthcare services even in low-connectivity environments.

## !! HOW TO DOWNLOAD AND INSTALL ALAGA !!

# PREREQUISITES
- Create a Github account.
- Install and set-up Git.
- Have a chosen IDE installed. For reference, our team used Visual Studio Code.
- Install and set-up Flutter, a mobile development framework software created by google.

# TESTING INSTRUCTIONS
- Change directory to apps/mobile_app within the cloned repository and do a flutter run (assuming that a device is in developer mode, and is plugged within the system/ an emulator is utilized.)

# DOCUMENTATION LOG
- 1/28/26: Completed the initial front-end demo. Team began integrating OAuth in a separate branch.
- 1/29/26: Tested trOCR for proper OCR reading outputs based on 10 datasets. Concluded that due to hardware capabilities, trOCR alongside MedGemma could not be utilized by the team.
- 1/30/26: Switched the entire MADA system to Qwen 2.5 VL, concluded that the model could not be run locally by the team, hence opted to use Roboflow. However, Roboflow's Qwen model can only be used through a paid version of the hosting site. 
- 1/2/26: Continued debugging and testing the file features, the team decided to push to (this) final repository with only the completed front-end. The other core features may be viewed in the other related branches.

#ALAGA Github Repository: https://github.com/pannenama/ALAGA 


