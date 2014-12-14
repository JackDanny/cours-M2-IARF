(define (domain hanoi)
	
  (:requirements :strips)
  (:predicates
   (libre ?what)
   (sur ?disque ?what)
   (pluspetit ?disque1 ?disque2)
   )

  (:action deplacer
    :parameters (?disque1 ?from ?what)
    :precondition (and (libre ?disque1)
			(libre ?what)
			(pluspetit ?disque1 ?what)
			(sur ?disque1 ?from)
		       )
    :effect (and (not (libre ?what))
		 (sur ?disque1 ?what)
		 (not (sur ?disque1 ?from))
		 (libre ?from)
		 )
   )

 
)
