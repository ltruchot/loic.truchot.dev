+++
title="One Day With Racket"
description="Not enough parenthesis!"
slug ="one-day-with-racket"
+++

> 7:56 AM. What brought me here? I'm a JavaScript Senior, and it's often mentioned that JS was inspired by Scheme.
>
> Scheme is a LISP, an old family of language, very promising for A.I., where everything is a workable list, looking like `(function-name, arg1, arg2, arg3...)`.
> It allows you to easily define Domain Specific Languages (DSL), with your own keywords and identifiers.
>
> Scheme is a classic academic LISP from MIT, and Racket is a scholar's attempt to make LISP even more universally learnable (Logo is another well-known).
> So let's do some Racket at least one day in our developer life!

## Find Basic Documentation

There is thousands of programming languages available, and plenty of websites for each. We can often find the official documentation for one of these, just typing: \<language\>-lang.org: rust-lang.org, elm-lang.org, etc.

Upon arriving at https://racket-lang.org, I'm happy to discover a clean and modern website with lively content. Before diving into the in-depth documentation, I hope to find a clear introduction.
After a few clicks I reach the
[Quick Introduction to Racket with Pictures](https://docs.racket-lang.org/quick/index.html).

## Quick Introduction

I've to install [Racket/DrRacket installer](https://download.racket-lang.org/) (~175Mb) to be able to run the examples. A very simple and smooth process on Windows 10: let's open DrRacket now.

It's a clean IDE interface with a menu, an empty document (named "definitions area") and a REPL ("interactions area") with some hints.

This introduction continue, but the documentation missed a small step: before copying / pasting the samples provided, I had to choose the "racket lang" in the "languages" menu. Then I paste `#lang slideshow` in the def area, and press the "run" button.

![Getting ready](/blog/2021-09-08-one_day_with_racket/img/01-getting_rdy.png)

Our first lines of code will take place in the REPL part.
Write `(circle 10)` and press \[Enter\] draw a 10px circle in the same area.
You can imagine what the following commands will do:

```rkt
(circle 10)
(circle 50)
(rectangle 100 20)
(arrow 20 10)
```

It draws shapes (and makes coffee)!
So we can guess that

- `#lang slideshow` contains useful functions to display certain shapes
- `circle`, `rectangle`, `arrow` are function names
- we can execute theses functions by putting them in parenthesis, passing arguments separated by spaces.
- the REPL is enough to directly interpret these inputs, then ouputs the result

![REPL](/blog/2021-09-08-one_day_with_racket/img/02-repl.png)

I just play without checking the docs and I ultimately make deliberate errors to see how useful the interpreter is.

```rkt
(triangle 30)
(rectangle 10)
rectangle 10
```

- Errors concerning undefined identifier seems easy to catch
- Errors on the arguments are little more frightening: the technical word "arity" refers to the expected number of arguments of a function
- Missing parenthesis did not give me an error, just an unexpected result that I suspect to be "this function as a value" (not executed)

By diving deeper, we discover that we can add several shapes on the same line...

```rkt
(hc-append
    (rectangle 20 20)
    (circle 20)
)
```

I'm assuming `hc-append` means "horizontally-centered append", but something is flashing red here: any function name will be a big concern, as they are so central here...

!["REPL](/blog/2021-09-08-one_day_with_racket/img/03-line_of_shapes.png)

... and it begins !

The famous LISP parenthesis festival that shows the order of execution of functions begins.
Despite its reputation, I feel like it's clean and natural at the moment. The language itself seems to contain very few symbols, mostly for simple instructions.

## Create my own stuff

For now, we had used some already baked functions.
How to make our owns ?

The quick-start guide show us how to do it, with the `define` identifier:

```rkt
(define c10 (circle 10))
c10
(hc-append c10 c10 c10 c10)
```

![define](/blog/2021-09-08-one_day_with_racket/img/04-define.png)

`define` acts as a function that takes 2 args: a variable name, and a value. Now, `c10` is available as a classic variable.

> 9:18 AM It feel astonishely simple to manipulate graphics, so I decide to write a snake-game in Racket before the sun goes down: we have the all day after all...

We can define a lot of stuff:

```rkt
(define eye (circle 10))
(define nose (rectangle 10 20))
(ht-append eye nose eye)
(define face (ht-append eye nose eye))
face
face
```

But we reach the point where we loose some visiblity.
So let's use the "def area" for define instructions, and keep the REPL for executions...

![my stuff](/blog/2021-09-08-one_day_with_racket/img/05-my_stuff.png)

It's clearer now. And I have a program to save on disk: `quick-start.rkt`.
This is not the usual approach of programming, of course. I'm used to a soup where everything is mixed.
Here, definitions stays "pure", and the process of creating the program is REPL-oriented, playing with code until it work.

Few remarks:

- `ht-append` can take any number of args. If 1st arg is a number, it represent the white-space between picts; it reminds me the [overloading practice](https://www.w3schools.com/java/java_methods_overloading.asp) in OOP.
- `vc-append` stands for vertical-centered, and so on with `hb-append`, `vt-append`...
- when the mouse is over a defined name, DrRacket show an arrow to find its definition - I discovered that by accident, and it's amazing
- there is no fatality about parenthesis hell, if we define names smartly along the way
- Racket already feel like a DSL maker . I can imagine a function to make a triangle, an other to do a square, an other to combine them and make a little house, and a house function just to wrap all of this... I reminds me the [SHRDLU](https://en.wikipedia.org/wiki/SHRDLU) initiative in A.I.

What about defining my own function ? I.e. there is no `square` function in this package, so let's create one

Nothing too new:

```rkt
(define (square n)
  (rectangle n n))
```

In place of taking a var name, define takes a function name + some args, surrounded by parenthesis.
Then, a second pair of parenthesis contains the actual code to run on execution.
And here is my little 30px square:

![square](/blog/2021-09-08-one_day_with_racket/img/06-square.png)

## My first challenge

> 10:10 AM - I just decided to challenge my-self. Can I create a function able to draw colored cars ?

I don't want to only stick to the tutorial. If I find the documentation for `circle` and `hc-append`, I'm pretty sure I will know all the shapes available, and all the ways to combine them.

Here we are, no surprise:

![docs](/blog/2021-09-08-one_day_with_racket/img/07-docs.png)

I need is a kind of `disk` for the wheel, and it exists. Now, how to put a white disk in a slightly bigger black disk ?

It appears there is a `colorize` function that take any "pict" (our shapes) and an [x11 color](https://docs.racket-lang.org/draw/color-database___.html) as 2d argument.

```rkt
(disk 30) ; a disk, black by default
(colorize (disk 25) "lightgray") ; a gray disk
```

We can even put them together with the `cc-superimpose` function, a way to super impose on center - center!

```rkt
(define black-disk
    (disk 30))
(define gray-disk
    (colorize
        (disk 25)
        "white"))
(cc-superimpose black-disk gray-disk)
```

So my final definitions could be

```rkt
(define tire
    (disk 30))
(define hubcap
    (colorize (disk 25) "white"))
(define wheel
    (cc-superimpose tire hubcap))
(define wheels
    (hc-append 100 wheel wheel))
(define (car color)
    (define body
        (colorize
            (filled-rectangle 180 20)
            color))
    (vc-append body wheels))
```

and let's try:

![cars](/blog/2021-09-08-one_day_with_racket/img/08-cars.png)

OMG, so easy. What is this strange feeling ? Am I a wizard or something ? It work so well, and it was just some instinct + few RTFM work: thank you DrRacket!

As you can see, I tried to define a function in a function for the body of my car. I was not sure it will work, but it did!

Going further in the documentation, it appears that's the job of the `let`/`let*` identifier too (the `*` authorize several `let` to use each others)

```rkt
#lang slideshow
(define wheel
  (let([tire (disk 30)]
       [hubcap
        (colorize (disk 25) "white")])
    (cc-superimpose tire hubcap)))
(define wheels
  (hc-append 100 wheel wheel))
(define (car color)
  (let* ([1st-part
          (filled-rectangle 90 20)]
         [2nd-part
          (filled-rectangle 180 20)]
         [compartment
          (colorize 1st-part color)]
         [body (colorize
                2nd-part color)])
    (vc-append compartment body wheels)))
```

This little recfacto limit the scope of my definitions: that's always a good practice. I can going further, while putting everything in the car definition.

![use let*](/blog/2021-09-08-one_day_with_racket/img/09-violet_car.png)

## First citizen

One of the big strenght of JavaScript is the "function as value", which imply that a function can take another one as argument (aka higher-order functions).

```javascript
function example(callback) {
  console.log("hello");
  callback();
}
example(() => console.log("world!"));
```

And of course you can put functions in variables, or even make a function that return an other one (aka curriying, thank EcmaGod for the arrow functions).

```javascript
const car = (size) => (color) => {
  console.log(`It's a ${size} ${color} car!`);
};
const bigCar = car("big");
const smallCar = car("small");
bigCar("blue");
bigCar("red");
smallCar("violet");
```

This is the heritage of LISP, so in Racket we can also pass function to another as argument, and so on. Functions are values likes the others (aka first-class citizen functions)

Ok, in which case this will happen ?

> 10:51 AM - I have an idea to find a case. I want to be able to ask the program a specific number of colored cars or houses. I suspect it will request use of "functions as value".

Let's make a house first. I had to dive in the documentation to find `rotate`, `inset`, `pi`, `sqrt`, without any surprise.

Before you read this code, be prepared:
In LISP, math operators are functions, defined and working like any other. So:

```rkt
(+ 1 2) ; returns 3
(* 4 3) ; returns 12
(/ 8 2) ; returns 4
(= 5 5) ; returns true (#t) since it checks number equality
; and so on.
```

In other word, no more "infix" operators (symbol in between the 2 operands): an addition is no more than a simple function and it signature is `(number, number) -> number`.

```rkt
(define (house color)
  (let* ([size 30]
         ; diagonal to assemble well sized home and roof
         [diag (* (sqrt 2) size)]
         ; base rectangles for roof, home, door
         [rect1 (filled-rectangle 30 30)]
         [rect2 (filled-rectangle diag diag)]
         [rect3 (filled-rectangle 10 20)]
         ; roof is a rotated/clipped square
         ; (in other word, a triangle)
         [roof (let* ([colored (colorize rect1 color)]
                      [rotated (rotate colored (/ pi 4))])
                 (inset rotated 0 0 0 -20))]
         [home (colorize rect2 color)]
         ; structure is just a roof on a home
         [structure  (vc-append roof home)]
         [door (colorize rect3 "gray")])
    ;let's add a door on center-bottom
    (cb-superimpose structure door)))
```

This is improvisation, but it work! Even if this piece of code appears complex, I can swear it was easy to write ! And now, let's just use `(house "color")` everywhere...

![blue house](/blog/2021-09-08-one_day_with_racket/img/10-blue_house.png)

Know let's write this very special function. I just want to say "draw 3 blue houses" and get my stuff. The signature will looks like `(n, color, thing) -> pict`.

```rkt
; dumb color identifiers
(define blue "blue")
(define red "red")
; draw function
(define (draw n color thing)
    (hc-append (thing color)))
(draw 1 blue house)
(draw 1 red car)
```

It work and we can see here that `thing` is a "function as values", where draw is an "higher order function": a function in charge the execute another.

The next challenge is to do something with this `n` parameter. I need a "for loop", but guess what, it's not [idiomatic](Programming idiom) Racket!

Indeed, Racket is not a big set of reserved imperative keyword like other languages are. In contrary, it's a very few set of powerful identifiers (`define`, `let`...) sufficient to create our own language (And indeed, some forms of "for" or "while" exists in Racket langs/libraries/modules) as defined functions.

Basic iteration will be build on top of recursion. In JavaScript, a recursion looks like:

```javascript
const recursiveFunction = (n) => {
  if (n <= 0) {
    console.log("the end!");
  } else {
    console.log("n is now " + n);
    recursiveFunction(n - 1);
  }
};
recursiveFunction(10);
```

The loop occurs because the function call itself until a condition is reached - or "while" a condition still valid (just like any loop in fact - but recursion shows that functions can be loops, and "for" or "while" is an optional tool).

Let's try this recursion in Racket. Before that, we will need few new tools that I easily found in the documentation:

- `print` that write in the console like `console.log` in JS
- `string-append` for string concatenation
- `number->string` to cast a number in string

```rkt
(define (recursive-function n)
  (print (string-append
          "n is now "
          (number->string n))))
```

Last but not least:

- `if` is a function like all the others, it takes 3 args: a "test" (condition), a "then" (consequent) and a "else" (alternative)

```
(print (if
        (= 3 3)
        "3 is 3"
        "wtf" ))
```

- `begin` is a function to execute several functions one by one, and just keep the result of the last on.

Ok, let's put all the piece together

```rkt
(define (recursive-function n)
  (let ([msg1 "the end!"]
        [msg2 (string-append
               "n is now "
               (number->string n))])
    (if
     (<= n 0)
     (print msg1)
     (begin (print msg2)
            (recursive-function (- n 1))))))

(recursive-function 10)
```

![recursion](/blog/2021-09-08-one_day_with_racket/img/11-recursion.png)

If we want to append recursively pictures to a previous pictures,
we have to begin with some kind of "empty" picture.

Indeed, a function that add "42" to nothing (null / undefined) will break: it must at least add "1" to a "0".

This empty-picture base-case is named [blank](https://docs.racket-lang.org/pict/Basic_Pict_Constructors.html?q=pict#%28def._%28%28lib._pict%2Fmain..rkt%29._blank%29%29)
in the library.

And now, we can apply recursion to our example:

```rkt
; draw function
(define (draw n color thing [pict (blank)])
  (if (> n 0) ; n greater than 0
      (draw (- n 1); continue to combine picts
            color
            thing
            (hc-append pict (thing color)))
      pict)); else return the final pict
```

![draw me](/blog/2021-09-08-one_day_with_racket/img/12-draw_me.png)

Hey, what is this unknown [pict (blank)] ? It's a way to provide an optional parameters with a default value.

In ES6, it could be mirrored with:

```javascript
function draw(n, color, thing, pict = new Pict()) {
  // ...
}
```

assuming there is a `Pict` constructor that return an empty pict.

In fact, our case is a beautiful illustration of what mathematician calls a `Monoid`. We have a special algebra for `pict` where we can add them infinitely, producing a new `pict`, beginning thoses operations with the `blank` neutral element.

This case is so common in Computer Science
(addition with 0 as neutral, multiplication with 1 as neutral, concat with "" as neutral, etc.) that the type/class `Monoid` itself exists in different languages and frameworks.

## First Conclusions

> 2:16 PM - Sorry but I'm starving. it's time for a lunch.
>
> 3:15 PM - Wow. We have made a lot this morning, but time flies. Let' take stock, then move on to the next idea: a animated game.

Racket (and so LISP) appears to be incredibely simple to write. Final expressions like `draw me a sheep` are easy to read too, very close to natural language if definitions are done that way.

Nonetheless, sometimes it still difficult for me to read implementation details, especially when a definition goes crazy. So I recommend to do little steps and focus on quality and modularization of ideas from the beginning.

The first big secret that Racket teach me is the following: you can do more with less. It sounds like Taoism, but indeed clarity grows because the field is almost empty. Very few building blocks, but they contains an unlimited power, by the law of combinations (like so much other fields in nature).

If you dive in a definition, you will see other definitions that look the same. Declarativness is always preserved (and I advocate for that in all language, so I'm filled).

Imperativeness can be always avoided, it's not idiomatic here. And because everything is finally a simple list of stuff that begin with an identifier, you can understand the all language mechanics in few hours.

Which identifier exists or not is not the real question: you take the fewest - or a enormous backed-in DSL - as you wish.

- (define x y)
- (define (x y) z)
- (+ 1 2)
- (if x y z)
- (list "blue" "red" "green")
- (map (lambda (x) (\* x x)) a-list)
- and so on

We know that LISP stands for **LIS**t **P**rocessor and we understand why. We see clearly why it's a good language for learning basics of CS, and even why [Uncle Bob](https://fr.wikipedia.org/wiki/Robert_C._Martin) itself says that maybe in the future a lot a disparate language will converge on some kind of LISP.

If one day hardware capacity is no more a limitation, it can be indeed the only language to produce any DSL you want, that all developer could understand around the world without struggling with new weird language mechanics, but focus on a syntax + algebra that describe perfectly a domain...

## Go Back To Work

Now 2 new crazy challenges:

- What about asking for "4 big blue houses"?
- How to make stuff moving in time?

### Scaling

Diving the docs, I discovered that that Racket is strongly typed.
WTF? I didn't write any type since the beginning!

Indeed, it's dynamically typed, but it's not weakly typed: those are 2 different concepts.
In JavaScript "number" is a weak type for all kinds of numbers.
In racket, a number have a stonger type, like "integer"... but still being automatically assigned (like in JS).

One very smart thing about the `pict-lib` provided by `#lang/slideshow`,
is that almost all function takes `pict` typed value and return a `pict` as well. That's why we can combine them, and reuse them. More generally, that's how you make a good DSL, and not only a framework/library.

So this should work perfectly:

```
(scale (house "orangered") 2)
(scale (rotate
        (car "powderblue")
        (/ pi 5))
       0.5)
```

![scale 1](/blog/2021-09-08-one_day_with_racket/img/13-scale1.png)

Now let's enhance our legacy code. If we want to be able to ask for a big, small or normal-sized house we will need some kind of `switch` or `else if` statement.

That switch is feasable using [case](https://docs.racket-lang.org/guide/case.html) where else-if is more like [cond](https://docs.racket-lang.org/reference/if.html)

```rkt
(define
  (draw n size color thing [pict (blank)])
  (if
   (> n 0) ; condition
   ; if true
   (let*
       ([scale-size
         (case size
           [("small") 0.5]
           [("big") 2]
           [else 1]
           )]
        [next-pict (hc-append
                    pict
                    (scale
                     (thing color)
                     scale-size))])
     (draw (- n 1) size color thing next-pict))
   ; if false
   pict))
```

![scale 2](/blog/2021-09-08-one_day_with_racket/img/14-scale2.png)

### Moving

The future snake will be moving in a 2d plane.
Is it even possible with our current `lang/slideshow` ? There is indeed an [animation documentation](https://docs.racket-lang.org/pict/Animation_Helpers.html), but it appears to be highly related to slideshow stuff.

And it's not only about moving: we will need a window, a game loop, collision stuff and so own.
Let's take some time to choose a better `lang` than slideshow for this advanced visual stuff...

> It's already 4:45 PM. Do we have a chance to run something before midnight ? Differents tools appears to make games, dependant on new stuff.
> Like this [racket/gui](https://docs.racket-lang.org/gui/index.html), but it will force us to learn a new way to draw: the `draw-lib`...
> I continue but [Searching](https://pkgd.racket-lang.org/pkgn/search?q=game) takes time. I even found a [fully working snake game](https://github.com/Bogdanp/hebi/blob/master/hebi.rkt), but the code is too avanced for me...

> 5:09. Finaly, my choice falls for the [r-cade packages](https://docs.racket-lang.org/r-cade/index.html) - it seems to contains everything we need, and claim to have snake-game example (that I will avoid now, but comparate at the end as correct version)

## A Snake Game

### R-cade Setup

Let's try the simplest example game

```rkt
#lang racket
(require r-cade)

; main function, called once per frame
(define (game-loop)
  (cls) ; clear view each frame
  (text 2 2 (frame))) ; print view each frame, with the frame number as text

; 128px window runing a loop at 60frame/s speed
(run game-loop 128 128)
```

Oh no! `r-cade` is not know by DrRacket. Hopefully the error provide me an install link... that work directly.

Oh no! `r-cade` needs some dependencies on windows to run!
It's well documented [here](https://r-cade.io/setup). I install [csfml](https://www.sfml-dev.org/download/csfml/) (I unzip in a freshly made `C:\other_program\csfml` folder to be sure to not pollute my computer), and add the path to the windows Path environment variable.

![env csfml](/blog/2021-09-08-one_day_with_racket/img/15-env_csfml.png)

I had to install [OpenAL](https://www.openal.org/downloads/) as well, then fully restart DrRacket to be able to run my sample.

![r-cade](/blog/2021-09-08-one_day_with_racket/img/16-r-cade.png)

### Snake Specification

What is a Snake Game? Here is my very opinionated vision of a simplified version:

- a 20x20 grid, made of tiles that have x/y coordinate
- a tile can be

  - a wall tile (all edges)
  - an apple tile
  - a part of the snake: a snake-tile
  - a blank-tile

- the snake

  - is made of 1+ consecutive snake-tiles
  - is always moving in the previous setted direction (each 500ms)
  - the head can take any cardinal direction (NESW)
  - the body follow the head
  - when the head collide an apple-tile
    - the apple disapear
    - the snake grow by 1 snake-tiles
  - when the head collide a wall-tile or snake tile: game over

- apples
  - there is always one in a randow position in the field
  - if it's ate, it disappear a new one pop on a ramdom empty tile
  - if there is no more empty tile: game over

### implementation

#### Window And Walls

Let's try to make a 20x20 window with 4 walls
Sadly, I now nothing about videogame development.
My first reflex is just to draw walls.
Indeed,

```rkt
#lang racket
(require r-cade)
(define (game-loop)
  (cls)
  (begin
    (color 4)
    (rect 0 0 20 1 #:fill #t)))
    ; and so on for all stuff to draw
  (run game-loop grid-size grid-size)
```

will draw on top-left a 1x20 sized rectangle, filled with a brown color.

![r-cade rect](/blog/2021-09-08-one_day_with_racket/img/17-r-cade_rect.png)

Do you remember `begin`, that allow series of functions?

I execute first the function `color` to pick a color in a [16 color palette](https://docs.racket-lang.org/r-cade/index.html?q=r-cade#%28def._%28%28lib._r-cade%2Fmain..rkt%29._color%29%29) (4 = braun) for the next steps.

`rect` takes `x y` coordinates, `h w` sizes, and this strange `#:fill #t`. It's a "fill" unordered named argument (how smart!) that takes the value `True` or `False`: `#t` or `#f` in racket.

I can continue with other walls, apples and snake. But this method is a dead-lock because it don't track anything. It just produce a picture without state, without life.

What I really want is a representation of the state of the game, that can change and be redrawn. A grid with the state of all it tiles.

I opt for a grid that is a list of list: (rows) containing tiles (cells). A tile will be a tuple (a list with few ordered members): (coord-x coord-y tile-type), like `(12 3 "apple")`.

Each game frame of the main loop will draw this grid findind the current state of each tile.

```rkt
;; grid values
(define grid-size 20)
(define grid
  (build-list
   grid-size
   (lambda (y)
     (build-list grid-size (lambda (x) (list x y "blank"))))))
```

Here `build-list n value-as-lambda` create a list of n items with cohesive values. Thoses values are based on a `lambda`: an anonymous and temporary function to call for create the value. The lambda takes the current index as argument. In fact, we operate in nested lists to obtain this full grid of `(x y tile-type)` tuples.

Now, my walls definition:

```rkt
; wall definitions
(define max-grid-index (- grid-size 1))
(define wall-coords
  (let ([top (build-list grid-size (lambda (x)(list x 0)))]
        [bottom (build-list grid-size (lambda (x)(list x max-grid-index)))]
        [left (build-list (- grid-size 2) (lambda (y)(list 0 (+ y 1))))]
        [right (build-list (- grid-size 2) (lambda (y)(list max-grid-index (+ y 1))))]

        )
    (append top bottom left right)))
```

Nothing new exept this `append` used to concatenate lists.
But were is the glue? How to update the grid ?

In functional programming in general, you avoid state, mutability and side effect. But my approach of this game imply a changing state: the grid.
`(set! var-name new-value)` is the way to procede. `for-each`, `list-update`, `list-set` are identifiers coming from [list docs](https://docs.racket-lang.org/reference/pairs.html)

```rkt
; -- update 1 tile in grid
(define (update-tile coord val)
  (let* ([row-idx (list-ref coord 1)]
         [cell-idx (list-ref coord 0)]
         [row (list-ref grid row-idx )]
         [tile (list-ref row cell-idx)]
         [updated (list-set tile 2 val)])
    (set!
     grid (list-set grid row-idx
                    (list-set row cell-idx updated)))))

; -- update a list of tiles
(define (update-tiles coords val)
  (for-each
   (lambda (coord)(update-tile coord val))
   coords))
```

What we need now is some function to draw that on the window:

```rkt
; draw definitions
(define (color-code tile-type)
  (case tile-type
    [("wall") 4]
    [("snake") 11]
    [("apple") 8]
    [else 7]))

; -- draw colored grid on screen with
(define (draw-grid grid)
  (for-each
   (lambda (row)
     (for-each
      (lambda (tile)
        (let ([type (list-ref tile 2)]
              [x (list-ref tile 0)]
              [y (list-ref tile 1)])
          (begin
            (color (color-code type)); color setted for next function
            (rect x y 1 1 #:fill #t))))
      row))
   grid))

; game definitions
(define (game-loop)
  (cls)
  (begin
    (draw-grid grid)))

; procedure
(update-tiles wall-coords "wall")
(run game-loop grid-size grid-size)
```

We just produce brown rectangles (or other colors) for each related info we have in the grid.

![r-cade walls](/blog/2021-09-08-one_day_with_racket/img/18-r-cade_walls.png)

> hum... 8:12 PM. Let's take a final dinner-pause. I feel some doubts about my capacity to end up this challenge...
> But hope drives me !
> I want to brag in work tomorrow at work, so failing is not an option.

#### The Snake

##### Show it

I wanted a centered snake, so I change my grid size to 21. The center should be (10 10) and I calculate it (because I want to be able to change the size of wy grid).

If I want it to move 2 times per seconds, I have to change the framerate too.

```rkt
(define grid-size 21)
; ...
; snake definitions
(define snake-coords
  (let ([val (round (- ( / grid-size 2) 1))])
    (list val val)))

; procedure
(update-tiles wall-coords "wall")
(update-tile snake-coords "snake")
(run game-loop grid-size grid-size #:fps 2)
```

![r-cade snake](/blog/2021-09-08-one_day_with_racket/img/19-r-cade_snake.png)

##### Move it

Make it move will happen just after each draw, for the next. What we want to do is make the head of the snake follow a direction each redraw, until an event.

For now, it simply goes up:

```rkt
(define (snake-position-update)
  (begin (update-tile snake-coords "blank")
         (let [(new-coords (list (list-ref snake-coords 0) (- (list-ref snake-coords 1) 1)))]
           (set! snake-coords new-coords)
           (update-tile new-coords "snake"))))

;...

; game definitions
(define (game-loop)
  (cls)
  (snake-position-update)
  (draw-grid grid))
```

What about a collision with a wall ?
We can use `quit` that stops the game when it occurs.

```rkt
(define (snake-position-update)
  (begin (update-tile snake-coords "blank")
         (let* ([new-coords (list (list-ref snake-coords 0) (- (list-ref snake-coords 1) 1))]
                [next-tile (read-tile new-coords)])
           (if (equal? (list-ref next-tile 2) "blank")
               (begin
                 (set! snake-coords new-coords)
                 (update-tile new-coords "snake"))
               (quit)))))
```

##### Control it

I suspect an awesome lang like r-cade to embed every thing we need
to change the direction of the snake when press arrows.

```rkt
(define snake-direction "top")

(define (move direction) (set! snake-direction direction))

(define (snake-action)
  (let ([direction (cond [(btn-up) "up"]
                         [(btn-right) "right"]
                         [(btn-down) "down"]
                         [(btn-left) "left"]
                         [else snake-direction])])
    (move direction)))
```

Isn't it self explanatory ?
When `snake-action` will be called.
We will check which button is currently pressed and move in the related direction.
We have to plug that is the loop and wait to see the effect!

```rkt
(define (game-loop)
  (cls)
  (snake-action)
  (snake-position-update)
  (draw-grid grid))
```

Ready for the final step, make the move itself dependant to this direction.
We just have to adujst the next `x` and `y` differently according to this direction.

```rkt
;; snake update
(define (snake-position-update)
  (begin
    (update-tile snake-coords "blank")
    (let*
        ([x (list-ref snake-coords 0)]
         [y (list-ref snake-coords 1)]
         [new-coords
          (case snake-direction
            [("top")(list x (- y 1))]
            [("down")(list x (+ y 1))]
            [("right")(list (+ x 1) y)]
            [("left")(list (- x 1) y)]
            [else (list x (- y 1))])]

         [next-tile (read-tile new-coords)])
      (if (equal? (list-ref next-tile 2) "blank")
          (begin
            (set! snake-coords new-coords)
            (update-tile new-coords "snake"))
          (quit)))))

```

![r-cade move](/blog/2021-09-08-one_day_with_racket/img/20-r-cade_move.png)

And... it work well, despite the fact that the loop reiterate every 500ms,
which is not sufficient to get all the input when I press too quickly the buttons.

```rkt
; game definitions
(define game-speed 3)
(define (game-loop)
  (cls); clear screen
  (snake-action); get user inputs
  (when
      (=
       (modulo (frame) (/ 60 game-speed))
       0)
    (snake-position-update)); change snake position
  (draw-grid grid))
; procedure
(update-tiles wall-coords "wall")
(update-tile snake-coords "snake")
(run game-loop grid-size grid-size #:fps 60)
```

To ensure every `keypress` events are taken, I revert the fps to 60,
then I define a game-speed that will slow the view update process.
`when` is what you find when you search for "if without else in racket".
The `modulo` makes sleeps the update all turns excepts the chosen one.

> It's 10:20 PM and we still don't have beat the main complexity of the snake problem.
> I can't sleep with that it mind, so I'll continue. As usual in informatics: devil is in the details, and estimation is fortune-telling.

#### The apples

The specs I made says that there is always only one apple in the fields, that could be eaten by the snake: in this case a new one will pop. But it have to pop on a non-blank tile, so I suspect I will need something like:

```rkt
;;; read 1 tile
(define (read-tile coord)
  (let* ([row (list-ref grid (list-ref coord 1))]
         [tile (list-ref row (list-ref coord 0))])
    tile))
;;; check if a tile is blank
(define (is-tile-blank coords)
  (let* ([tile (read-tile coords)]
         [type (list-ref tile 2)])
    (equal? type "blank")))
```

We will need some randomisation here. You can imagine it exists in `racket`:

```rkt
; apples
(define (draw-random-apple)
  (let* ([x (random 1 20)]
         [y (random 1 20)]
         [coords (list x y)])
    (if (is-tile-blank coords)
        (update-tile coords "apple")
        (draw-random-apple))))
;...
(draw-random-apple)
(run game-loop grid-size grid-size #:fps 60)
```

![r-cade apple](/blog/2021-09-08-one_day_with_racket/img/21-r-cade_apple.png)

The recursion act as a loop here: until the coords are not blank, let's retry.

When it's ok, we get the result. We just make sure to draw one before the start, here we go.

#### Collisions

When the snake meet an apple

- the apple is removed
- the snake grow
- a new apple pop

The first and the second step could be a common step: we decide to replace the apple with a snake part.
I will change the name of `snake-update-position` to `game-update` that reflect better the situation.

```rkt
(define (game-update)
  (begin
    (update-tile snake-coords "blank")
    (let*
        ([x (list-ref snake-coords 0)]
         [y (list-ref snake-coords 1)]
         [new-coords
          (case snake-direction
            [("top")(list x (- y 1))]
            [("down")(list x (+ y 1))]
            [("right")(list (+ x 1) y)]
            [("left")(list (- x 1) y)]
            [else (list x (- y 1))])])
      (cond [(is-tile-blank new-coords)
             (begin
               (set! snake-coords new-coords)
               (update-tile new-coords "snake"))]
            [(is-tile-apple new-coords)
             (begin
               (set! snake-coords new-coords)
               (update-tile new-coords "snake")
               (draw-random-apple))]
            [else (quit)]))))
```

Works well... if we forget that the snake should grow.
And this part sounds to me like the real complexity: now the snake have to be a list of following coords and not a point.

> Late, so late, I'm tired. Let's try, but I can't promise anything.

Snake as a list:

```rkt
; snake definitions
(define snake-coords
  (let ([val (round (- ( / grid-size 2) 1))])
    (list (list val val))))
(define snake-direction "top")
```

Now, let's replace all

```rkt
(update-tile snake-coords "snake")
```

with (see the extra "s" ?)

```rkt
(update-tiles snake-coords "snake")
```

and

```
(list-ref snake-coords 0)
```

with

```
(list-ref (first snake-coords) 0)
```

Indeed, `first` returns the first element of a list.

Amazingly it work directly!

Now, the part that makes me afraid. To grow the snake, we will add a tail to the list just after the moment it eat an apple.

The snake is now a list of coordinates, that follow each others. When the snake will move, a new coordinate will replace the head of this list, and the tail of this list will disappear. So the re-draw will reflect this list shift.

```rkt
(cond [(is-tile-blank new-coords)
        (begin
          (update-tile (last snake-coords) "blank")
          (set! snake-coords
                (drop-right
                (append (list new-coords) snake-coords) 1))
          (update-tiles snake-coords "snake"))]
      [(is-tile-apple new-coords)
        (begin
          (set! snake-coords
                (append (list new-coords) snake-coords))
          (update-tiles snake-coords "snake")
          (draw-random-apple))]
      [else (quit)])))
```

`append` to "update immutably" the list and `drop-right` to do the remove job. In other word, we do some insert first/remove last, treating our snake as a [linked list](https://en.wikipedia.org/wiki/Linked_list).

![r-cade size](/blog/2021-09-08-one_day_with_racket/img/22-r-cade_size.png)

The very last defect is the fact that, when we press the opposite direction of the current one, the game quit.
Indeed, the head of the snake eat itself, because the tail of the snake is here.

We want to prevent the user to go back, so we can add a condition that say depending your current direction, you can't go back.
The logic looks like:

```rkt
(define snake-direction "up")
(define opposite-direction "down")
(define (set-opposite-direction dir)
  (set! opposite-direction
        (case dir
          [("up") "down"]
          [("right") "left"]
          [("down") "up"]
          [("left") "right"])))
```

Then in `game-update`, when the move is really made:

```rkt
(cond [(is-tile-blank new-coords)
        (begin
          (update-tile (last snake-coords) "blank")
          (set! snake-coords (drop-right new-snake 1))
          (update-tiles snake-coords "snake")
          (set-opposite-direction snake-direction))]
      [(is-tile-apple new-coords)
        (begin
          (set! snake-coords new-snake)
          (update-tiles snake-coords "snake")
          (set-opposite-direction snake-direction)
          (draw-random-apple))]
      [else (quit)])))
```

Here we are! A real snake game, made with racket, working corretly!
Happiness fills my soul and tired body.

![r-cade final-snake](/blog/2021-09-08-one_day_with_racket/img/23-r-cade_final-snake.png)

> 00:01 it was a long, but also an amazing and rewarding experience.
> Racket bring simplicity, expressiveness and well-made baked-in community DSLs on the table.
>
> Before publishing this article, I'll take the time to refacto my final code that you can find on [this github repo](https://github.com/ltruchot/1day/tree/master/racket).
>
> I'll find as well resources to go further, shared in this article. Thank you for your reading me, following me, sharing that and for you patience during this looooong journey.
>
> Hope to see you soon!

## Resources to go further

I just discovered this language and this LISP world, but after one day with racket,
I decided to dive a little more into podcast and videos. Here is what I found.

- On YouTube:

  - [Language-Oriented Programming with Racket - Matthias Felleisen](https://www.youtube.com/watch?v=z8Pz4bJV3Tk)
  - [Lisp with Uncle Bob Martin](https://youtu.be/wr4eqx3UYPc?t=319)

- ## Podcasts
