;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |25|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
; Ex 25

(require rackunit)

; all-true? : ListOfBoolean -> Boolean
; GIVEN: a list of boolean values
; WHERE: the initial list is not empty
; RETURNS: true if all values in list are true; false otherwise
; Examples: 
; (all-true (list true)) = true
; (all-true (list false)) = false
; (all-true (list true false)) = false
; (all-true (list true true)) = true
; DESIGN STRATEGY: Cases
(define (all-true? lst)
  (cond
    [(empty? lst) true]
    [else (and (first lst) (all-true? (rest lst)))]
    )
  )

; Tests for all-true?
(test-begin
 (check-equal?
  (all-true? (list true))
  true
  )
 
 (check-equal?
  (all-true? (list false))
  false
  )
 
 (check-equal?
  (all-true? (list true false))
  false
  )
 
 (check-equal?
  (all-true? (list true true))
  true
  ) 
 )