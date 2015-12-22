# Pre-work - Tip Calculator

Tip Calculator is a tip calculator application for iOS.

Submitted by: Corey Salzer

Time spent: 30 hours spent in total

## User Stories

The following **required** functionality is complete:

* [X] User can enter a bill amount, choose a tip percentage, and see the tip and total values.
* [X] Settings page to change the default tip percentage.

The following **optional** features are implemented:
* [ ] UI animations
* [X] Remembering the bill amount across app restarts (if <10mins)
* [ ] Using locale-specific currency and currency thousands separators.
* [X] Making sure the keyboard is always visible and the bill amount is always the first responder. This way the user doesn't have to tap anywhere to use this app. Just launch the app and start typing.

The following **additional** features are implemented:

- [X] Remembering the custom tip amounts across app restarts (if <10 mins)
- [X] Login Screen with Image Implemented
- [X] App Icon Implemented
- [X] Size Classes Used
- [X] User input sanitized and autofilled


## Video Walkthrough 

Here's a walkthrough of implemented user stories:

<img src='http://i.imgur.com/link/to/your/gif/file.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />

GIF created with [LiceCap](http://www.cockos.com/licecap/).

## Notes

Describe any challenges encountered while building the app.

1. Figuring out where to tap into during the application lifecycle for remembering the bill amount across app restarts was difficult. I at first thought that I should just delay applicationWillTerminate by 10 minutes, but then when I realized that NSUserDefaults persists across app restarts (with a little help from Charlie), I realized that I should just save the time in viewWillDisappear to NSUserDefaults and then compare in didFinishLaunchingWithOptions. 

2. Figuring out how to use the Navigation Controller for multiple views was also difficult. I thought that I had to programmatically create settings and back buttons in each view, but then I realized that I could just do this through the Navigation Controller. 


## License

Copyright [2015] [Corey Salzer]

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.