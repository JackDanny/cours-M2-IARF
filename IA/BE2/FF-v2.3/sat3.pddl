(define (domain sat3)
	
  (:requirements :strips)
  (:predicates

   (vrai ?what)
   (faux ?what)
  
   )

  (:action vrai
    :parameters (?what)
   
    :effect (and (not (faux ?what))
		 (vrai ?what)
		 )
   )

  (:action faux
    :parameters (?what)
   
    :effect (and (not (vrai ?what))
		 (faux ?what)
		 )
   )

   )






	





 

