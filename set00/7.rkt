(require rackunit)

; Ex 7
; circumference : Number -> Number
; GIVEN: the radius r of a circle 
; RETURNS: its circumference, using the formula 2 * pi * r.
; Examples:
; (circumference 1) => 6.283185307179586
; (circumference 0) => 0
; (circumference 4) => 25.132741228718345
(define (circumference radius)
  (if (>= radius 0)
      (* 2 pi radius)
      "The radius of a circle must be at least zero."
      )
  )

; Tests for circumference
(test-begin
 (check-=
  (circumference 1)
  6.283185
  0.0001
  )

 (check-equal?
  (circumference 0)
  0
  )

 (check-=
  (circumference 4)
  25.13274
  0.0001
  )
 )
