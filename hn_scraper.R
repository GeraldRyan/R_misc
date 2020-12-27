library(rvest)

url <- 'https://news.ycombinator.com/'

#further pages 
#url2 <- 'https://news.ycombinator.com/news?p=2'

content <- read_html(url)

#News Title

title <- content %>% html_nodes('a.storylink') %>% html_text()


#News Link Domain

link_domain <- content %>% html_nodes('span.sitestr') %>% html_text()
#Link Score / Upvote

score <- content %>% html_nodes('span.score') %>% html_text()
#Link Age (submission time)

age <- content %>% html_nodes('span.age') %>% html_text()
#Final Dataframe

# Fix row count mismatch (naive solution-- but my own)
rws = c(NROW(title),NROW(link_domain), NROW(score), NROW(age))
minrw = min(rws)

df <- data.frame(title = title[0:min], link_domain = link_domain[0:min], score = score[0:min], age = age[0:min])
#Naive way of extracting the entire page content with this table
#tb <- content %>% html_node('table.itemlist') %>% html_text()