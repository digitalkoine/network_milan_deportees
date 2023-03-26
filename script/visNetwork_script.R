##install.packages("visNetwork")
##install.packages("tidyverse")

library(visNetwork)
library(tidyverse)

nodes <- read_csv("data/nodes_milano.csv")
edges <- read_csv("data/edges_milano.csv")
pop_up <- read_csv("data/pop_up.csv")

visNetwork(nodes, 
           edges, 
           height = "1000px", 
           width = "100%", 
           main = paste(sep = "<br/>",
                        paste0("<p>Ebrei nati nella città di Milano e deportati dall’Italia
                                <h6>Rappresentazione grafica dei dati sugli ebrei nati a Milano e deportati nei campi di concentramento e sterminio nazisti fra il 1943-1945.
                                Questa visualizzazione permette di seguire i percorsi di deportazione delle singole persone, dal momento dell’arresto fino all’arrivo ai campi nazisti.
                                L'utente può evidenziare il percorso di ogni persona cliccando su di un punto della grafica oppure a partire dal menu a tendina a sinistra 
                                scegliendo singoli nomi dalla finestra <i>Select by id</i>; i  convogli o i luoghi prigionia dalla finestra <i>Select by group</i>.
                                Per maggiori informazioni sulla lista dei convogli ", pop_up$link,". 
                                (L. Picciotto, Libro della Memoria. <i>Gli ebrei deportati dall’Italia (1943-1945)</i>, Milano, Mursia, 2a ed., 2002)</h6></p>")))%>%
  
visOptions(highlightNearest = TRUE, 
           nodesIdSelection = TRUE, 
           selectedBy = "group") %>%
  
visIgraphLayout(layout = "layout_with_sugiyama") %>%
##visIgraphLayout(layout = "layout_in_circle") %>%
##visPhysics(solver = "forceAtlas2Based",
  ##forceAtlas2Based = list(gravitationalConstant = -100))%>%
  
visInteraction(navigationButtons = TRUE, 
               keyboard = TRUE, 
               tooltipDelay = 0) %>%

visLayout(randomSeed = 123)
