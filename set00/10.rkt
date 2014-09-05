(require rackunit)

; Ex 10
; two-largest-sum : Number Number Number -> Number
; GIVEN: three numbers in any order
; RETURNS: the sum of the largest two numbers
; Examples:
; (two-largest-sum 1 2 3)    => 5
; (two-largest-sum -8 7 -3)  => 4
; (two-largest-sum 0 0 0)    => 0
; (two-largest-sum 100 2 99) => 199
(define (two-largest-sum a b c)
  (if (and (number? a) (number? b) (number? c))
      (cond
        ; check if a is greater than b
        [(> a b)
         (cond
           [(> b c) (+ a b)]
           [else (+ a c)]
           )
         ]
        ; check if a is greater than c--if it got here, then c is smallest
        [(> a c) (+ a b)]
        ; a must be smaller than both so add b and c
        [else (+ b c)]
        )
      "All three arguments provided must be numbers."
      )
  )


(test-begin
 (check-equal?
  (two-largest-sum 1 2 3)
  5
  )

 (check-equal?
  (two-largest-sum -8 7 -3)
  4
  )

 (check-equal?
  (two-largest-sum 0 0 0)
  0
  )

 (check-equal?
  (two-largest-sum 100 2 99)
  199
 )
)
