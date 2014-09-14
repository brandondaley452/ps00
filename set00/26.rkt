;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |26|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
; Ex 26

(require 2htdp/image)
(require rackunit)

; draw-circles : ListOfPoint -> Image
; GIVEN: a list of points
; WHERE: x- and y-coordinates of points must both be <= 300
; RETURNS: an Image containing circles of radius 10 at each (x,y) coordinate defined by the Points on a 300x300 Scene
; Examples:
; (draw-circles empty) => (empty-scene 300 300)
; (draw-circles (list (make-posn 30 30))) => (place-image (circle 10 "solid" "blue") 30 30 (empty-scene 300 300))
; (draw-circles (list (make-posn 30 30) (make-posn 60 80))) =>
;                                 (place-image (circle 10 "solid" "blue") 60 80 (place-image (circle 10 "solid" "blue") 30 30 (empty-scene 300 300)))
; DESIGN STRATEGY: Cases
(define (draw-circles lst)
  (cond
    [(empty? lst) (empty-scene 300 300)]
    [else (place-image (circle 10 "solid" "blue") (posn-x (first lst)) (posn-y (first lst)) (draw-circles (rest lst)))]
    )
  )

; Tests for draw-circles
(test-begin
 (check-equal?
  (draw-circles empty)
  (empty-scene 300 300)
  )
 
 (check-equal?
  (draw-circles (list (make-posn 30 30)))
  (place-image (circle 10 "solid" "blue") 30 30 (empty-scene 300 300))
  )
 
 (check-equal?
  (draw-circles (list (make-posn 30 30) (make-posn 60 80)))
  (place-image (circle 10 "solid" "blue") 
               60 
               80 
               (place-image (circle 10 "solid" "blue") 
                            30 
                            30 
                            (empty-scene 300 300)
                            )
               )
  )
 )