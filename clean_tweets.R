
clean_tweets<-function(tweets){
require(tm)  
  
  unwanted_array = list(    'À'='A', 'Á'='A', 'Â'='A', 'Ã'='A', 'Ä'='A', 'Å'='A', 'Æ'='A', 'Ç'='C', 'È'='E', 'É'='E',
                            'Ê'='E', 'Ë'='E', 'Ì'='I', 'Í'='I', 'Î'='I', 'Ï'='I', 'Ñ'='N', 'ñ'='n','Ò'='O', 'Ó'='O', 'Ô'='O', 'Õ'='O', 'Ö'='O', 'Ø'='O', 'Ù'='U',
                            'Ú'='U', 'Û'='U', 'Ü'='U', 'à'='a', 'á'='a', 'â'='a', 'ã'='a', 'ä'='a', 'å'='a', 'æ'='a', 'ç'='c',
                            'è'='e', 'é'='e', 'ê'='e', 'ë'='e', 'ì'='i', 'í'='i', 'î'='i', 'ï'='i', 'ð'='o', 'ò'='o', 'ó'='o', 'ô'='o', 'õ'='o',
                            'ö'='o', 'ø'='o', 'ù'='u', 'ú'='u', 'û'='u', 'ý'='y', 'ý'='y', 'þ'='b', 'ÿ'='y')
  
  
  
  
  aux=chartr(paste(names(unwanted_array), collapse=''),
             paste(unwanted_array, collapse=''),
             tweets)  
  
  
  #aux<-gsub("rt", "", aux)
  
  aux <- gsub("&amp", "", aux)
  aux<- gsub("\n"," ",aux)
  #aux<- gsub("\\-.","",aux)
  aux<- gsub("\\|.","",aux)
  #aux <- gsub("http.\\w+", "", aux)
  aux <- gsub("@\\w+", "", aux)
  aux <- gsub(" http.*","",aux)
  
  aux <- gsub('[[:punct:]]', ' ', aux)
  aux <- gsub('[[:cntrl:]]', ' ', aux)
  
  aux <- gsub("[[:digit:]]", " ", aux)
  aux<-gsub("[^\x01-\x7F]", " ", aux)
  
  aux <- gsub("^\\s+|\\s+$", " ", aux)
  aux <- gsub("  ", " ", aux)
  aux <- tolower(aux)
  aux <- gsub("\\b[[:alpha:]]{16,}\\b", "", aux)
  aux <- gsub('\\b\\w{1,2}\\b','',aux)
  
  #aux <- gsub("  ", " ", aux)
  return(aux)
  
}
