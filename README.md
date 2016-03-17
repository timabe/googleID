# googleID
Authentication and identifying Google users using Google+ API

## Example

Activate [Google+ API here](https://console.developers.google.com/apis/api/plus/overview)

```r
library(googleAuthR)
library(googleID)
options(googleAuthR.scopes.selected = c("https://www.googleapis.com/auth/userinfo.email", "https://www.googleapis.com/auth/userinfo.profile"))

googleAuthR::gar_auth()

## default is user logged in
user <- get_user_info()

## to use in a shiny app:
user <- with_shiny(get_user_info)

> str(user)
List of 24
 $ kind          : chr "plus#person"
 $ etag          : chr "\"4OZ_Kt6ujOh1jaML_U6RM6APqoE/UYyiZzYR_iS62bMpKv92P1iPcZ0\""
 $ occupation    : chr "Google Developer Expert - Google Analytics.  RStudio Advocate."
 $ skills        : chr "Google Analytics, Adobe Marketing Cloud, R, Python, SEO, Google Cloud, Statistics, Music"
 $ gender        : chr "male"
 $ emails        :'data.frame':	1 obs. of  2 variables:
  ..$ value: chr "me@markedmondson.me"
  ..$ type : chr "account"
 $ urls          :'data.frame':	5 obs. of  3 variables:
  ..$ value: chr [1:5] "http://twitter.com/holomarked" "http://www.linkedin.com/in/markpeteredmondson" "https://github.com/MarkEdmondson1234" "http://stackoverflow.com/users/3878063/marked" ...
  ..$ type : chr [1:5] "otherProfile" "otherProfile" "otherProfile" "otherProfile" ...
  ..$ label: chr [1:5] "Twitter" "Mark Edmondson LinkedIn" "Github" "StackOverflow" ...
 $ objectType    : chr "person"
 $ id            : chr "115064340704113209584"
 $ displayName   : chr "Mark Edmondson"
 $ name          :List of 2
  ..$ familyName: chr "Edmondson"
  ..$ givenName : chr "Mark"
 $ tagline       : chr "Taking part in the evolution of the Multivac"
 $ braggingRights: chr "RStudio Advocate.  Google Developer Expert - Google Analytics.  Adobe Certified Expert - Adobe Analytics."
 $ aboutMe       : chr "Taking part in the evolution of the multivac<br />"
 $ url           : chr "https://plus.google.com/+MarkEdmondsonAtHome"
 $ image         :List of 2
  ..$ url      : chr "https://lh5.googleusercontent.com/-OVYhmgQg3lg/AAAAAAAAAAI/AAAAAAAAAP0/1qVcsNpSXlQ/photo.jpg?sz=50"
  ..$ isDefault: logi FALSE
 $ organizations :'data.frame':	1 obs. of  4 variables:
  ..$ name   : chr "King's College London"
  ..$ title  : chr "Physics"
  ..$ type   : chr "school"
  ..$ primary: logi FALSE
 $ placesLived   :'data.frame':	3 obs. of  1 variable:
  ..$ value: chr [1:3] "Copenhagen" "London" "Falmouth, UK"
 $ isPlusUser    : logi TRUE
 $ language      : chr "en_GB"
 $ circledByCount: int 410
 $ verified      : logi FALSE
 $ cover         :List of 3
  ..$ layout    : chr "banner"
  ..$ coverPhoto:List of 3
  .. ..$ url   : chr "https://lh3.googleusercontent.com/HIq8ABRcUKBs5AYBg0tiqoJifjv3A08MWCU3u79hBWhXjvBv1iilf94_YIjRSH4VlWZH=s630"
  .. ..$ height: int 183
  .. ..$ width : int 940
  ..$ coverInfo :List of 2
  .. ..$ topImageOffset : int 0
  .. ..$ leftImageOffset: int 0
 $ domain        : chr "markedmondson.me"

```