(require rackunit)

; Ex 8
; circle-area : Number -> Number
; GIVEN: the radius r of a circle 
; RETURNS: its area in units^2, using the formula pi * (r^2).
; Examples:
; (circle-area 1) => 3.141592653589793
; (circle-area 5) => 78.53981633974483
; (circle-area 7) => 153.93804002589985
(define (circle-area radius)
  (if (>= radius 0)
      (* pi (sqr radius))
      "The radius of the circle must be at least zero."
      )
  )

; Tests for circle-area
(test-begin
 (check-within
  (circle-area 1)
  3.141592653589793
  0.0000000001
  )

 (check-within
  (circle-area 5)
  78.53981633974483
  0.0000000001
  )

 (check-within
  (circle-area 7)
  153.93804002589985
  0.0000000001
  )
 )
