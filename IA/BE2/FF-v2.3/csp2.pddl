(define (domain csp2)
	
  (:requirements :strips)
  (:predicates

   (rouge ?sommet)
   (bleu ?sommet)
   (vert ?sommet)

   (arc ?sommet1 ?sommet2)
  
   )

  (:action rouge
    :parameters (?sommet1 ?sommet2)
    :precondition and((arc sommet1 sommet2)
		      (not rouge ?sommet2)
    :effect (and (not (vert ?sommet1))
		 (not (bleu ?sommet1))
		 (rouge ?sommet1)
	    )
   )

 (:action vert
    :parameters (?sommet1 ?sommet2)
    :precondition and((arc sommet1 sommet2)
		      (not vert ?sommet2)
    :effect (and (not (rouge ?sommet1))
		 (not (bleu ?sommet1))
		 (vert ?sommet1)
	    )
   )

(:action bleu
    :parameters (?sommet)
    :precondition and((arc sommet1 sommet2)
		      (not bleu ?sommet2)
    :effect (and (not (rouge ?sommet1))
		 (not (vert ?sommet1))
		 (bleu ?sommet1)
	    )
   )



   )






	

