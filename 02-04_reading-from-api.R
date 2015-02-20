library(httr)
myapp = oauth_app("twitter", key="ylLi0nOx0u97RYy1ZcaCAWoUe", secret="GuyUcmQJqP6gTMEcO9oabW15UX3QUlCIUlb49iehttlXGLuQys")
sig = sign_oauth1.0(myapp, token="136788851-dwCyo8H2QO4TXCexN0KoaQwbZtiC9NsgZSEGVrZf", token_secret="6gjFWxzZ5YxCn9kPc5vPuIkwxmCNc0WJdNMRiAr38MI1W")
homeTL = GET("https://api.twitter.com/1.1/statuses/home_timeline.json", sig)

library(jsonlite)
json1 = content(homeTL)
json2 = fromJSON(toJSON(json1))
json2[1:5,1:4]

# GET, POST, PUT, DELETE


