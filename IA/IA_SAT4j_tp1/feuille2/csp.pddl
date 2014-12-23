(define (domain csp)
(:requirements :strips)
(:predicates
   (colorie ?sommet)
   (rouge ?sommet)
   (bleu ?sommet)
   (vert ?sommet)
   (arc ?sommet1 ?sommet2))
(:action rouge
   :parameters (?sommet)
   :precondition (not (colorie ?sommet))
   :effect (and (colorie ?sommet)
	             (rouge ?sommet)))
(:action vert
    :parameters (?sommet)
    :precondition (not (colorie ?sommet))
    :effect (and (colorie ?sommet)
	             (vert ?sommet)))
(:action bleu
    :parameters (?sommet)
    :precondition (not (colorie ?sommet))
    :effect (and (colorie ?sommet)
	             (bleu ?sommet)))
(:action arc
    :parameters (?sommet1 ?sommet2)
    :precondition (and 
            (colorie ?sommet1)
            (colorie ?sommet2)
            (not (and (rouge ?sommet1) (rouge ?sommet2)) )
			(not (and (vert ?sommet1) (vert ?sommet2)) )
			(not (and (bleu ?sommet1) (bleu ?sommet2)) ))
    :effect 
	(arc ?sommet1 ?sommet2)))






	

