; Ex 5
; sq : Number -> NonNegNumber
; GIVEN: number to compute a square for
; RETURNS: the square of the given number
; Examples:
; (sq 5)   => 25
; (sq 1)   => 1
; (sq -12) => 144
(define (sq num)
  (cond
    [(number? num) (expt num 2)]
    [else "This function requires a number as input."]
    )
  )

; Tests for sq
(check-expect
  (sq 5)
  25
  )

(check-expect
  (sq 1)
  1
  )

(check-expect
  (sq -12)
  144
  )
