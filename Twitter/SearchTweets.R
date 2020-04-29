library(rtweet)
load(file = 'twitterAuthentication.Rdata')
create_token(app = app_name,
              consumer_key = consumer_key,
              consumer_secret = consumer_secret,
              access_token = access_token, 
             access_secret = access_secret)

Italy <- search_tweets("Italy", n = 100, include_rts = FALSE)
Germany <- search_tweets("Germany", n = 100, include_rts = FALSE)
