# dataseatSKAConversionValues

## Background

The SkAdNetwork framework provided by Apple allows Ad-networks to track installs a in privacy centric manner. It allows advertisers to record a conversion value to assist in measuring the value of users. Dataseat recommend that these 2 values are used together to maximise LTV prediction and optimisation.

## Method

The SkAdNetwork Conversion Value is set by the advertiser App. The Dataseat recomendation is that the conversion value is split and used to store 2 pieces of information - the best event reached by the user for prediction of LTV and the day of the week the App was first launched.

| Top 3 bits | Lower 3 bits | 
| ------------- | --------------- | 
| value representing user behaviour  | 1-7 representing the day of the weeek |

The code in this repository gives examples of utility functions that can be used in an iOS App to set the conversion value. The conversion value should only be updated within the first 24 hours after the install.
