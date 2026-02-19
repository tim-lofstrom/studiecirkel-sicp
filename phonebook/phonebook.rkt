#lang racket

(define (action line)
  (match line
    ["add" (displayln "add")]
    ["delete" (displayln "delete")]
    ["alias" (displayln "alias")]
    ["change" (displayln "change")]
    ["lookup" (displayln "lookup")]
    ["save" (displayln "save")]
    ["load" (displayln "load")]
    [_ (void)]))

(define (phonebook-prompt)
  (display "phonebook> ")
  (flush-output)

  (match (read-line)
    [(? eof-object?) (void)]
    ["exit" (displayln "bye")]
    [line
     (action line)
     (phonebook-prompt)]))


(phonebook-prompt)
