#TP2 code R 
#Emile Hembert
#05/10/2026

library(Mfuzz)
library(limma)

expData = read.table("ModelisationSyst/TP1/Mito_Genes.txt", header = T, row.names = 1)

#C.R des données
expData_q = normalizeQuantiles(as.matrix(expData))
expData_n = log2(expData_q +1)

#création de l'objet Mfuzz
esetData = new("ExpressionSet",exprs=as.matrix(expData_n))
#Missing values
#Nous n'avons pas de valeur maquantes dans notre jeu de donnée
#Sinon on doit les remplacer par l'expression moyenne du gène en question
data.f = filter.NA(esetData,thres = 0.25)

#Filtering
data.f = filter.std(data.f,min.std = 0)  

#Standardisation
data.s = standardise(data.f)

#estimation automatique des parametres
##parametre de "flou"
m_e = mestimate(data.s)

#on peut maintenant essayer différent nombres de clusters (4,5,6,7,8,9,10)
par(mfrow=c(1,1))
cluster_nb = 3

cl = mfuzz(data.s,c=cluster_nb,m=m_e)
#mfuzz.plot(data.s,cl=cl,mfrow=c(5,2),time.labels=colnames(expData))

#connaitre le nombre de gene dans plusieurs cluster à la fois et évaluer le meilleur nombre de cluster
Ov = overlap(cl)
Ptmp = overlap.plot(cl, over=Ov,thres=0.05)




# 1. Ouvrir un fichier PDF pour y stocker tous les graphiques
pdf("ModelisationSyst/TP2/Mfuzz_Overlap_Plots_4to10.pdf", width = 8, height = 8)

for (cluster_nb in 4:10) {
  cl <- mfuzz(data.s, c = cluster_nb, m = m_e)
  
  # Calcul du chevauchement
  Ov <- overlap(cl)
  
  # Affichage de l'overlap plot (Correction de 'over' en 'overlap')
  overlap.plot(cl, overlap = Ov, thres = 0.05)
  
  # Ajout d'un titre dynamique sur chaque page du PDF
  title(main = paste("Overlap Plot - c =", cluster_nb), line = 2.5)
}

# 2. Fermer le fichier PDF (très important pour enregistrer le fichier !)
dev.off() 

cat("Le fichier 'Mfuzz_Overlap_Plots_4to10.pdf' a été généré avec succès.")




