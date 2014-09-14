;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |21|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
; Ex 21

(require 2htdp/image)

(define-struct person (first-name last-name age height weight))
; A Person is a (make-person String String PosInt PosInt PosInt)
; It represents a given person.
; Interpretation:
;   first-name = the first name of the given person
;   last-name = the last name of the given person
;   age = the age of the person in years
;   height = the height of the person in inches, rounded to the nearest inch
;   weight = the weight of the person in pounds, rounded to the nearest pound

(define (person-image person)
  (scale/xy (* 0.01 (person-weight person)) (* 0.02 (person-height person)) 
  (above 
   (beside 
    (arm person)
    (above 
     (head person) 
     (body person)
     ) 
    (arm person)
    )
   (legs person)
   )
  )
  )

(define (arm x)
  (rectangle 30 10 "solid" "brown")
  )

(define (head x)
  (circle 15 "solid" "brown")
  )

(define (body x)
  (rectangle 45 60 "solid" "brown")
  )

(define (legs x)
  (beside
   (rectangle 10 50 "solid" "brown")
   (rectangle 10 50 "solid" "white")
   (rectangle 10 50 "solid" "brown")
   )
  )