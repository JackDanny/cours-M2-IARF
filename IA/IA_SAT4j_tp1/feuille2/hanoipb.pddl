(define (problem hanoi-pb)
  (:domain hanoi)
  (:objects D1 D2 D3 D4
	    P1 P2 P3
	    
	   )
  (:init (sur D4 P1)
	(sur D3 D4)
	(sur D2 D3)
	(sur D1 D2)
	(libre P2)
	(libre P3)
	(libre D1) 
	(pluspetit D1 D2)
	(pluspetit D2 D3)
	(pluspetit D3 D4)

	(pluspetit D1 D3)
	(pluspetit D1 D4)
	
	(pluspetit D2 D4)

	(pluspetit D1 P1)
	(pluspetit D2 P1)
	(pluspetit D3 P1)
	(pluspetit D4 P1)

	(pluspetit D1 P2)
	(pluspetit D2 P2)
	(pluspetit D3 P2)
	(pluspetit D4 P2)

	(pluspetit D1 P3)
	(pluspetit D2 P3)
	(pluspetit D3 P3)
	(pluspetit D4 P3)



	

	
  )
  (:goal (and (libre P2)
		(libre P1)
		(libre D1)
		(sur D4 P3)
		(sur D3 D4)
		(sur D2 D3)
		(sur D1 D2)

	)
	)
  )
