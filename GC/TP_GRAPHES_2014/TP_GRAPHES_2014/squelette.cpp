#include <iostream>
#include <fstream>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include <vector>
#include <ctime>
#include <limits.h>

using namespace std;

/*-----------------------------------------------------------------------------*/
class Activity          
/*-----------------------------------------------------------------------------*/
{
public:
  /*==========================================*/
  /*=                ATTRIBUTS               =*/
  /*==========================================*/
  int i,n_p,n_s; // No de l'activité et nombre de prédecesseurs et successeurs
  int di_max,di_min; // Durée max et min de l'activité
  vector <int> Pred; // Liste des prédecesseurs
  vector <int> Succ; // Liste des successeurs
    
  /*==========================================*/
  /*=                METHODES                =*/
  /*==========================================*/
  Activity(void) // Constructeur
  {
    i=-1; di_max=0; di_min=0; n_p=0;n_s=n_p=0; 
  };
  ~Activity(void) // Destructeur
  {};
  void AddPred(int i) // Ajoute i dans la liste des prédecesseurs de la tâche
  {
    n_p++;Pred.push_back(i);
  };
  friend ostream & operator << (ostream &f, Activity *a) // Affichage des caractéristiques de la tâche
  {
    f<<"Activity "<<a->i<<" with duration ["<<a->di_min<<", "<<a->di_max<<"], having "<<a->n_p<<" predecessor(s) (";
    vector<int>::iterator it;
    for(it=a->Pred.begin();it<a->Pred.end();it++)
      f<<*it<<" ,";
    f<<") and "<<a->n_s<<" successor(s) (";
    for(it=a->Succ.begin();it<a->Succ.end();it++)
      f<<*it<<" ,";
    f<<")\n";
    f.flush();
    return f;
  };
};

class ActivityGraph
{
public:
  /*==========================================*/
  /*=                ATTRIBUTS               =*/
  /*==========================================*/
  vector <Activity> A; // Liste des activités sommets 
  /*==========================================*/
  /*=                METHODES                =*/
  /*==========================================*/
  ActivityGraph(char *filename,int coef)  // Constructeur
  {
    filebuf fichier;
    filebuf *ouvert=fichier.open(filename,ios_base::in);
    if(!ouvert)
      {
	cout<<"Can not open file "<<filename<<endl;
	exit(1);
      }
    istream entree(&fichier);
    int n_activites;
    entree>>n_activites;
    A.resize(n_activites);
    for(int i=0;i<n_activites;i++)
      {
	float di_max,di_min;
	entree>>A[i].i;
	entree>>di_min;
	entree>>di_max;
	entree>>A[i].n_s;
	A[i].di_max=(int)floor(di_max*coef);
	A[i].di_min=(int)floor(di_min*coef);
	A[i].Succ.resize(A[i].n_s);  
	for(int j=0;j<A[i].n_s;j++)
	  {
	    entree>>A[i].Succ[j];
	    A[A[i].Succ[j]].AddPred(i);
	  }
      }
  };    
  friend ostream & operator << (ostream &f, ActivityGraph *G) // Affichage du graphe
  {
    int n=G->A.size();
    f<< "The graph has "<<n<<" activities :\n";
    for(int i=0;i<n;i++)
      f<<&(G->A[i]);
    f.flush();
    return f;
  };
};
      

int main(int argc, char **argv)
{
  if(argc<2 || argc >3)
    {
      cout<<" The syntax must respect the following format: main.exe <Problem_file> {< Duration_multiplicator=1>} \n";
      return 0;
    }
  int Duration_mul=1;
  if(argc==3)
    Duration_mul=atoi(argv[2]);
  char fileName[60];
  strcpy(fileName,argv[1]);
  clock_t start=clock(); // Lancement du cpt TCdi_max
  ActivityGraph G(fileName,Duration_mul);
  cout<<&G;

  clock_t end=clock(); // Lancement du cpt TCdi_max
  cout<<"*===================================================================*\n";
  cout<<"Instance "<< fileName<<" done: Tcpu(microsec)="<<((double)(end - start) / (double)(CLOCKS_PER_SEC / 1000000.0))<<endl;
  cout<<"*===================================================================*\n";
  return 0;
}
