; Ex 3
; f->c : Number -> Number
; GIVEN: a temperature in degrees Fahrenheit as an argument
; RETURNS: the equivalent temperature in degrees Celsius.
; Examples:
; (f->c 32)  => 0
; (f->c 100) => 37.77777777777778
(define (f->c fTemp)
    (* 5/9 (- fTemp 32))
  )

; Tests for f->c
(check-expect
  (f->c 32)
  0
  )

(check-within
  (f->c 100)
  37.7777
  0.0001
  )
