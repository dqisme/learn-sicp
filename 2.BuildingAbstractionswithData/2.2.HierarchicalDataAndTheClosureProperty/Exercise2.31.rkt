#lang sicp

(define (square x)
    (* x x))

(define (map proc items)
  (if (null? items)
      nil
      (cons (proc (car items))
            (map proc (cdr items)))))

(define (tree-map proc tree)
    (map (lambda (sub-tree)
                 (if (pair? sub-tree)
                     (tree-map proc sub-tree)
                     (proc sub-tree)))
         tree))

(define tree (list 1
                   (list 2 (list 3 4) 5)
                   (list 6 7)))

(define (square-tree tree)
    (tree-map square tree))

(square-tree tree) ; (1 (4 (9 16) 25) (36 49))
