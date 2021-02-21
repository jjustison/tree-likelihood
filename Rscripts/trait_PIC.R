library(ape) ##Load in required package

##so I don't think there's a tree file for this challenge so we'll just write and read it directly
newick <- "(((((((A:1,B:1):1,C:2):1,D:3):1,E:4):1,F:5):1,G:6):1,H:7);"
tree<-read.tree(text=newick)

##Same thing with the trait data. I honestly have no idea how people save trait data in their csvs, I've mostly only worked with simulated data
##Let's just assume we were able to read in our trait data and wrangle it into a vector where the elements are named according to the tip they represent
traits<-c(4,5,9,11,13,7,4,8)
names(traits)<-c("A","B","C","D","E","F","G","H")

source("./challenge_fxns.R")

getPics<-function(phy,traits){
  
  PICs<-c() ##This will store all our Independent contrasts
  
  ntips<-length(phy$tip.label) ##The number of tips
  
  ##For a bifurcating tree with n tips we should have n-1 contrasts
  while( length(PICs) < (ntips-1) ){ ##While we have fewer than n-1 PICs..
    
    ##we can compute the PIC for any node where its two descendent nodes are tips 
    
    ##To find such a node we need to first isolate our edge matrix to just the edges that are connect to tips
    ##these are known as pendent edges
    pendent<-which(tree$edge[,2]<=ntips) ##We look for edges where the descendents are less than ntips because tips are numbered 1 to ntips
    
    ##we now need to find two edges that have the same parent node, this is the node we want
    nd<-as.integer(names(which(table(phy$edge[,1][tips])==2)))[1] ##This one-liner does that but it is quite ugly. Let's break it down
    
    # This is what the one-liner does. I recommend running this code and printing the output at each step to get a feel for what's going on
    # 
    # par_nodes<-phy$edge[,1] ##Get all the parent nodes that appear
    # node_counts<-table(par_nodes)##count how many times each parent node appears
    # nd<-which(node_counts==2)[1] ##find the nodes that appear twice, this is what we want. We take the first of these such nodes
    # nd<-as.integer(names(nd)) ##Table actually stores the count in the vector and the node number as a name. So we need to extract the name and convert the name from a string to a number
   
    ##we want the trait values for the children nodes and branch lengths that lead to the children
    children<-getChildren(phy,nd)
    
    Xi<-traits[phy$tip.label[children[1]]] ##Trait value for child 1
    Xj<-traits[phy$tip.label[children[2]]] ##Trait value for child 2
    
    Vi<-getBranchLength(phy,children[1]) ##Edge length for the edge that leads to child 1
    Vi<-getBranchLength(phy,children[2]) ##Edge length for the edge that leads to child 2
    
    PIC<-
    
    
    
     
  }
  
  
  
  
  
}