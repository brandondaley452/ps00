;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |11|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
; Ex 11
; 
; Because point-functions represent a point on an (x,y) plane, I would expect the contracts to look something like this:
;
; make-point : Real Real -> Point
; point?     : Point     -> Boolean
; point-x    : Point     -> Real
; point-y    : Point     -> Real
;
; After examining the posn-functions in Help Desk, the contracts for posn-functions are:
;
; make-posn : Any Any -> Point
; posn?     : Point     -> Boolean
; posn-x    : Point     -> Any
; posn-y    : Point     -> Any
;
; The big difference between what I predicted and what the posn-functions represent is that I anticipated
; it to represent data on a standard (x, y) coordinate system from negative infinity to positive infinity
; on both axes. Instead, posn can hold literally any type of data in each argument.
