;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |7|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
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
