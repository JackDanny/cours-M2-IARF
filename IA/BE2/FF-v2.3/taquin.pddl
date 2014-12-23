(define (domain taquin)
  (:requirements :strips) 

  (:predicates
   (libre ?square)
   (apion ?square ?pion)
   (adj ?square1 ?square2)
  )

  (:action move
   :parameters (?square_1 ?square_2 ?pion)
   :precondition (and 
                 (adj ?square_1 ?square_2)
                 (libre ?square_2)
                 (apion ?square_1 ?pion)
                 )
    
   :effect (and (not(libre ?square_2)) 
                (apion ?square_2 ?pion)
                (not(apion ?square_1 ?pion)) 
                (libre ?square_1)
            )
    )

)
