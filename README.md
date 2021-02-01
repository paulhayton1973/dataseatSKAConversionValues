# dataseatSKAConversionValues

## Background

The SkAdNetwork framework provided by Apple allows Ad-networks to track installs a in privacy centric manner. It allows advertisers to record a conversion value to assist in measuring the value of users. Dataseat recommend that these 2 values are used together to maximise LTV prediction and optimisation.

## Method

The SkAdNetwork Conversion Value is set by the advertiser App. The Dataseat recomendation is that the conversion value is split and used to store 2 pieces of information - the best event reached by the user for prediction of LTV and the day of the week the App was first launched.

| Top 3 bits | Lower 3 bits | 
| ------------- | --------------- | 
| value representing user behaviour  | 1-7 representing the day of the week |

The code in this repository gives examples of utility functions that can be used in an iOS App to set the conversion value. The conversion value should only be updated within the first 24 hours after the install.

The Weekday is taken from NSCalendarUnitWeekday so Sunday=1,Monday=2,Tuesday=3,Wednesday=4,Thursday=5,Friday=6,Saturday=7.  0 for the lower 3 bits would indicate this hasn't been set.

## Code

The example code includes 2 methods.

* registerAppOpen : This should be called when the App is first opened and will record the Day of the week in the lower 3 bits of the conversion value.
* updateConversionValue : This should be called with a value between 0 and 7 inclusive where the higher the value given the better the indication of good LTV.

e.g. For a game you might have :

* 0 = First Launch
* 1 = Level X complete
* 2 = Level Y complete
* 3 = Purchase $1.99
* 4 = Purchase $4.99
* 5 = Purchase medium $9.99
* 6 = Purchase high total $19.99
* 7 = Purchase highest total value $49.99

For a retail App, you might have :

* 0 = First Launch
* 1 = Registration
* 2 = Product Viewed
* 3 = 3 Products viewed
* 4 = Item placed in basket
* 5 = Purchase made of value up to $9.99
* 6 = Purchase made of value up to $19.99
* 7 = Purchase made of value up to $49.99

