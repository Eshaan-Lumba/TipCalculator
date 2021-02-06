# Pre-work - *My Tip Calculator*

**My Tip Calculator** is a tip calculator application for iOS.

Submitted by: **Eshaan Lumba**

Time spent: **6** hours spent in total

## User Stories

The following **required** functionality is complete:

* [X] User can enter a bill amount, choose a tip percentage, and see the tip and total values.
* [X] User can select between tip percentages by tapping different values on the segmented control and the tip value is updated accordingly

The following **optional** features are implemented:

* [ ] UI animations
* [X] Remembering the bill amount across app restarts (if <10mins)
* [X] Using locale-specific currency and currency thousands separators.
* [X] Making sure the keyboard is always visible and the bill amount is always the first responder. This way the user doesn't have to tap anywhere to use this app. Just launch the app and start typing.

The following **additional** features are implemented:

- [X] Stepper Party size counter that splits the bill by the number of people paying
- [X] Slider for tip% that goes from 10$-40%
- [X] Keyboard is decimal number keyboard


## Video Walkthrough

Here's a walkthrough of the app:

<img src='http://g.recordit.co/cfzGzc36v8.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />


## Notes

Describe any challenges encountered while building the app.

I got stuck a few times when reference connecting the UI objects. I had renamed the IBOutlet variable after 
reference connecting it, which caused the app to crash. I also took some time when adding the
feature that remembers the bill amount across app restarts since I was unsure on what methods to use to 
implement it. Apart from this, I had no major issues. 


## License

    Copyright [2021] [Eshaan Lumba]

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
