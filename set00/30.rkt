;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |30|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
; Ex 30

(require rackunit)

; neg-list : ListOfBoolean -> ListOfBoolean
; GIVEN: a list of boolean values
; RETURNS: a list containing the inverses of each boolean value in order of the original list
; Examples:
; (neg-list empty) => empty
; (neg-list (list true)) => (cons false empty)
; (neg-list (list false)) => (cons true empty)
; (neg-list (list false true)) => (cons true (cons false empty))
; DESIGN STRATEGY: Cases
(define (neg-list boolList)
  (cond
    [(empty? boolList) empty]
    [else (cons (not (first boolList)) (neg-list (rest boolList)))]
    )
  )

(test-begin
 
 ; Tests for neg-list
 (check-equal?
  (neg-list empty)
  empty
  )
 
 (check-equal?
  (neg-list (list true))
  (cons false empty)
  )
 
 (check-equal?
  (neg-list (list false))
  (cons true empty)
  )
 
 (check-equal?
  (neg-list (list false true))
  (cons true (cons false empty))
  )
 
 )