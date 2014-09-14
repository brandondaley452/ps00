;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |26|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
; Ex 26

(require 2htdp/image)

; draw-circles : ListOfPoint -> Image
; GIVEN: a list of points
; WHERE: x- and y-coordinates of points must both be <= 300
; RETURNS: an Image containing circles of radius 10 at each (x,y) coordinate defined by the Points on a 300x300 Scene
; Examples: 
(define (draw-circles lst)
  (cond
    [(empty? lst) (empty-scene 300 300)]
    [else (place-image (circle 10 "solid" "blue") (posn-x (first lst)) (posn-y (first lst)) (draw-circles (rest lst)))]
    )
  )
