;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 21a) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
; Ex 21a

(require 2htdp/image)
(require rackunit)

; constant Image that represents the 
; connected arms, legs, body, and head of a person
(define WHOLE_BODY (above 
                    (beside
                     ; left arm (looking at Image)
                     (rectangle 30 10 "solid" "brown")
                     (above
                      ; head above the body
                      (circle 15 "solid" "brown") 
                      (rectangle 45 60 "solid" "brown")
                      )
                     ; right arm (looking at Image)
                     (rectangle 30 10 "solid" "brown")
                     )
                    (beside
                     ; two legs, separated by whitespace
                     (rectangle 10 50 "solid" "brown")
                     (rectangle 10 50 "solid" "white")
                     (rectangle 10 50 "solid" "brown")
                     )
                    )
  )

(define-struct person (first-name last-name age height weight))
; A Person is a (make-person String String PosInt PosInt PosInt)
; It represents a given person.
; Interpretation:
;   first-name = the first name of the given person
;   last-name = the last name of the given person
;   age = the age of the person in years
;   height = the height of the person in inches, rounded to the nearest inch
;   weight = the weight of the person in pounds, rounded to the nearest pound

; person-image : Person -> Image
; GIVEN: a Person structure
; RETURNS: a basic Image representing that person proportioned to the 
;          person-weight and person-height with the person's first and last
;          names displayed below the body Image
; Examples:
; (person-image (make-person "First" "Last" 50 75 190)) => (above (scale/xy 1.9 1.5 WHOLE_BODY)
;                                                                 (name "First" "Last"))
; (person-image (make-person "Brandon" "Daley" 21 69 165)) => (above (scale/xy 1.65 1.38 WHOLE_BODY)
;                                                                    (name "Brandon" "Daley"))
; DESIGN STRATEGY: Function Composition
(define (person-image person)
  (above
   (scale/xy (* 0.01 (person-weight person)) (* 0.02 (person-height person)) 
             WHOLE_BODY
             )
   (name (person-first-name person) (person-last-name person))
   )
  )

; name : String String -> Image
; GIVEN: the first and last name from a Person structure
; RETURNS: an Image of the person's first and last name as text
; Examples:
; (name "First" "Last") => (text "First Last" 15 "red")
; (name "Brandon" "Daley") => (text "Brandon Daley" 15 "red")
; DESIGN STRATEGY: Function Composition
(define (name first last)
  (text (string-append first " " last) 15 "red")
  )

; Tests for person-image
(test-begin
 (check-equal?
  (person-image (make-person "First" "Last" 50 75 190))
  (above (scale/xy 1.9 1.5 WHOLE_BODY)
         (name "First" "Last"))
  )
 
 (check-equal?
  (person-image (make-person "Brandon" "Daley" 21 69 165))
  (above (scale/xy 1.65 1.38 WHOLE_BODY)
         (name "Brandon" "Daley"))
  )
 )

; Tests for name
(test-begin
 (check-equal?
  (name "First" "Last")
  (text "First Last" 15 "red")
  )
 
 
 (check-equal?
  (name "Brandon" "Daley")
  (text "Brandon Daley" 15 "red")
  )
 )