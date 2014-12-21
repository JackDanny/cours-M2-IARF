(define (problem sat3-pb)
  (:domain sat3)
  (:objects X1 X2 X3
	    
	   )
  (:init (vrai X1)
	(vrai X2)
	(vrai X3)



	

	
  )
  (:goal (and (or (vrai X1)
		  (vrai X2)
		  (vrai X3))
		(faux X2)
		(or(faux X1) (faux X2))
		(or(faux X1) (faux X3))
		(or(faux X2) (faux X3)) 
		

	)
	)
  )
