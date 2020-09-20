+++
title="One Day With Racket"
description="Not enough parentheses!"
slug ="one-day-with-racket"
+++

> 7:56 AM - What brought me here? I'm a JavaScript Senior, and it's often mentioned that JS was inspired by Scheme.
>
> Scheme is a dialect of LISP (an old family of languages), where everything is a workable list, looking like `(function-name, arg1, arg2, arg3...)`.
> It is very promising for A.I., and allows you to easily define Domain Specific Languages (DSL) with your own keywords and identifiers.
>
> Scheme is a classic academic LISP from MIT, and Racket is a scholar's attempt at making LISP even more universally accessible (Logo is another well-known dialect).
> So, let's do some Racket at least one day in our developer life!

## Find Basic Documentation

There are thousands of programming languages available, and plenty of websites for each of them. We can often find the official documentation for a particular one by just typing: \<language\>-lang.org: rust-lang.org, elm-lang.org, etc.

Upon arriving at https://racket-lang.org, I'm happy to discover a clean and modern website with lively content. Before diving into in-depth documentation, I hope to find a clear introduction of the language.  
After a few clicks, I reach
[Quick Introduction to Racket with Pictures](https://docs.racket-lang.org/quick/index.html).

## Quick Introduction

It seems I have to install [Racket/DrRacket installer](https://download.racket-lang.org/) (~175Mb) to be able to run the examples. A very simple and smooth process on Windows 10. Let's open it now.

It's a clean IDE interface with a menu, an empty document (named "definitions area") and a REPL ("interactions area") with some hints displayed.

The introduction continues, however the documentation missed a small step: before copying and pasting the samples provided, I had to choose "racket lang" in the "languages" menu. Then I had to paste `#lang slideshow` in the def area, and press the "run" button.

![Getting ready](/blog/2021-09-08-one_day_with_racket/img/01-getting_rdy.png)

My first lines of code will take place in the REPL part.
Writing `(circle 10)` and pressing \[Enter\] draws a 10px circle in the same area.  
Guess what the following commands will do?

```rkt
(circle 10)
(circle 50)
(rectangle 100 20)
(arrow 20 10)
```

It draws shapes (and makes coffee)!  
So I can also guess that:

- `#lang slideshow` contains useful functions to display certain shapes
- `circle`, `rectangle`, `arrow` are function names
- I can execute these functions by putting them in parentheses, passing arguments separated by spaces.
- the REPL is enough to directly interpret these inputs, then ouput the result.

![REPL](/blog/2021-09-08-one_day_with_racket/img/02-repl.png)

I play around without checking the docs, and ultimately make deliberate errors to see how useful the interpreter is.

```rkt
(triangle 30)
(rectangle 10)
rectangle 10
```

- Errors concerning undefined identifier seem easy to catch.
- Errors linked to arguments are a little more frightening: the technical word "arity" refers to the expected number of arguments of a function.
- Missing parentheses did not give me an error, just an unexpected result that I suspect to mean "this function as a value" (not executed).

By diving deeper, I discover that I can add several shapes on the same line...

```rkt
(hc-append
    (rectangle 20 20)
    (circle 20)
)
```

I'm assuming `hc-append` means "horizontal-centered append", but something already seems inevitable: any function name will be important, as they are so curial here.

!["REPL](/blog/2021-09-08-one_day_with_racket/img/03-line_of_shapes.png)

...and so it begins!

The famous LISP parentheses festival that shows the order of execution of functions has begun.  
Despite its reputation, I feel like it's clean and natural at the moment. The language itself seems to contain very few symbols, and mostly for simple instructions.

## Create my own stuff

Until now, I used some premade functions.
But how do I make my own?

The quick-start guide tells me how to do it with the `define` identifier:

```rkt
(define c10 (circle 10))
c10
(hc-append c10 c10 c10 c10)
```

![define](/blog/2021-09-08-one_day_with_racket/img/04-define.png)

`define` acts as a function that takes 2 arguments: a variable name, and a value. Now `c10` is available as a classic variable.

> 9:18 AM - It feels astonishingly simple to manipulate graphics, so I decide to write a snake-game in Racket before the sun goes down. After all, I've got the whole day...

I can define a lot of stuff very easily:

```rkt
(define eye (circle 10))
(define nose (rectangle 10 20))
(ht-append eye nose eye)
(define face (ht-append eye nose eye))
face
face
```

But I reach the point where the code loses some visiblity, so I'll start using the "def area" to define instructions, and keep the REPL to execute them...

![my stuff](/blog/2021-09-08-one_day_with_racket/img/05-my_stuff.png)

It's clearer now, and I get a program I can save on my disk: `quick-start.rkt`.  
This is not the usual approach of programming, of course. I'm used to a "soup" where everything is mixed.  
Here, definitions stay "pure", and the process of creating the program is REPL-oriented, playing with code until it works.

A few remarks:

- `ht-append` can take any number of arguments. If the first argument is a number, it represents the white-space between picts. It reminds me of the [overloading practice](https://www.w3schools.com/java/java_methods_overloading.asp) in OOP.
- `vc-append` stands for vertical-centered, and so on with `hb-append` (horizontal-bottom), `vt-append` (vertical-top)...
- when the mouse hovers a defined name, DrRacket shows an arrow to find its definition - I discovered that by accident, and it's amazing!
- there is no fatality about parentheses hell, as long as I define names smartly along the way.
- Racket already feels like a DSL maker. I can imagine a function that creates a triangle, another to make a square, another to combine them and make a little house, and a house function just to wrap all of this... It reminds me of the [SHRDLU](https://en.wikipedia.org/wiki/SHRDLU) initiative in A.I.

What about defining my own function? i.e. there is no `square` function in this package, so let's create one.

Nothing too new:

```rkt
(define (square n)
  (rectangle n n))
```

In place of taking a variable name, `define` takes a function name and some arguments surrounded by parentheses.  
Then, a second pair of parentheses contains the actual code to run on execution.  
And here is my little 30px square:

![square](/blog/2021-09-08-one_day_with_racket/img/06-square.png)

## My first challenge

> 10:10 AM - I just decided to challenge myself. Can I create a function able to draw coloured cars?

I don't want to only stick to the tutorial. If I found `circle` and `hc-append` in the documentation, I'm pretty sure I will find the other shapes available, and all the ways to combine them.

Here we go, unsurprisingly:

![docs](/blog/2021-09-08-one_day_with_racket/img/07-docs.png)

All I need is a kind of `disk` for the wheel, and it exists. Now, how would I put a white disk in a slightly bigger black disk?

It appears there is a `colorize` function that takes any "pict" (our shape) and [x11 color](https://docs.racket-lang.org/draw/color-database___.html) as a 2d argument.

```rkt
(disk 30) ; a disk, black by default
(colorize (disk 25) "lightgray") ; a gray disk
```

I can even put them together with the `cc-superimpose` function, a way to superimpose on center - center!

```rkt
(define black-disk
    (disk 30))
(define gray-disk
    (colorize
        (disk 25)
        "white"))
(cc-superimpose black-disk gray-disk)
```

So my final definitions could be:

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

And let's try it:

![cars](/blog/2021-09-08-one_day_with_racket/img/08-cars.png)

OMG, so easy. What is this strange feeling? Am I a wizard or something? It works so well, and it was just some instinct and a little RTFM work. Thank you DrRacket!

As you can see, I tried to define a function in a function for the body of my car. I was not sure it would work, but it did!

Going further in the documentation, it appears that's the job of the `let`/`let*` identifier too (the `*` authorizes several `let` to use each other).

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

This little recfactoring limits the scope of my definitions, and that's always good practice. I can go further, and put everything in the car definition.

![use let*](/blog/2021-09-08-one_day_with_racket/img/09-violet_car.png)

## First citizen

One of the big strenghts of JavaScript is the "function as value", which implies that a function can take another one as an argument (also known as higher-order functions).

```javascript
function example(callback) {
  console.log("hello");
  callback();
}
example(() => console.log("world!"));
```

And of course you can put functions in variables, or even make a function that returns another one (aka currying, thanks EcmaGod for the arrow function).

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

This is the heritage of LISP, so in Racket we can also pass a function to another as an argument, and so on. Functions are values like the others (aka first-class citizen function)

Ok, but in which case will this happen?

> 10:51 AM - I have an idea of a good use case. I want to be able to ask the program a specific number of colored cars or houses. I suspect it will request using "functions as value".

Let's make a house first. I had to dive in the documentation to find `rotate`, `inset`, `pi`, `sqrt`, without any surprise.

Before you read this code, be prepared: in LISP, math operators are functions, defined and working like any other.  
So:

```rkt
(+ 1 2) ; returns 3
(* 4 3) ; returns 12
(/ 8 2) ; returns 4
(= 5 5) ; returns true (#t) since it checks number equality
; and so on.
```

In other words, no more "infix" operators (symbol in between the 2 operands): an addition is no more than a simple function and its signature is `(number, number) -> number`.

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

This is improvisation, but it works! Even if this piece of code appears complex, I swear it was easy to write! And now, let's just use `(house "color")` everywhere...

![blue house](/blog/2021-09-08-one_day_with_racket/img/10-blue_house.png)

Now let's write this very special function. I just want to say "draw 3 blue houses" and get them. The signature would look like `(n, color, thing) -> pict`.

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

It works, and I can see here that `thing` is a "function as value", where `draw` is an "higher order function": a function in charge of executing another.

The next challenge is to do something with this `n` parameter. I need a "for loop", but guess what, it's not [idiomatic](Programming idiom) Racket!

Indeed, Racket is not a big set of reserved imperative keywords like other languages are. On the contrary, it's a very small set of powerful identifiers (`define`, `let`...), just enough to create our own language (And indeed, some forms of "for" or "while" exist in Racket langs/libraries/modules as defined functions).

Basic iteration will be built on top of recursion. In JavaScript, recursion looks like this:

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

The loop occurs because the function calls itself until a condition is met - or "while" a condition is still valid (just like any loop in fact - but recursion shows that functions can be loops, and "for" or "while" are an optional tool).

Let's try recursion in Racket. Before that, I'll need a few new tools that I easily found in the documentation:

- `print` that writes in the console like `console.log` in JS
- `string-append` for string concatenation
- `number->string` to cast a number as a string

```rkt
(define (recursive-function n)
  (print (string-append
          "n is now "
          (number->string n))))
```

Last but not least:

- `if` is a function like all the others, it takes 3 arguments: a "test" (condition), a "then" (consequent) and an "else" (alternative)

```
(print (if
        (= 3 3)
        "3 is 3"
        "wtf" ))
```

- `begin` is a function that executes several functions one by one, and just keeps the result of the last one.

Ok, let's put all the pieces together:

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

If I want to append a picture to previous pictures recursively, I have to begin with some kind of "empty" picture.

Indeed, a function that adds "42" to nothing (null / undefined) will break: it must at least add "1" to "0".

This empty-picture base-case is named [blank](https://docs.racket-lang.org/pict/Basic_Pict_Constructors.html?q=pict#%28def._%28%28lib._pict%2Fmain..rkt%29._blank%29%29) in the library.

And now, I can apply recursion to my example:

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

Hey, what is this unknown `[pict (blank)]`? It's a way to provide an optional parameter with a default value.

In ES6, it could be mirrored with:

```javascript
function draw(n, color, thing, pict = new Pict()) {
  // ...
}
```

...assuming there is a `Pict` constructor that returns an empty pict.

In fact, this case is a beautiful illustration of what mathematicians call a `Monoid`. There's special algebra for `pict` where I can add them infinitely, producing a new `pict`, starting those operations with the `blank` neutral element.

This case is so common in Computer Science (addition with 0 as neutral, multiplication with 1 as neutral, concatenation with "" as neutral, etc.) that the type/class `Monoid` itself exists in different languages and frameworks.

## First Conclusions

> 2:16 PM - Sorry, but I'm starving. It's time for lunch.
>
> 3:15 PM - Wow. We did a lot this morning, but time flies. Let's take stock, and move on to the next idea: an animated game.

Racket (and therefore LISP) appears to be incredibly simple to write. Final expressions like `draw me a sheep` are equally easy to read, very close to natural (human) language if definitions are done that way.

Nonetheless, sometimes it still is difficult for me to read implementation details, especially when a definition goes crazy. So I recommend to take it one step at a time, focusing on quality and modularization of ideas from the beginning.

The first big secret that Racket teaches me is the following: you can do more with less. It sounds like Taoism, but indeed clarity grows because the field is almost empty. There are very few building blocks, but they contain an unlimited power, by the law of combination (like so much other fields in nature).

If you dive in a definition, you will see other definitions that look the same. Declarativeness is always preserved (and I advocate for that in all languages, so I'm thrilled).

Imperativeness can always be avoided, it's not idiomatic here. And because everything is finally a simple list of stuff that begins with an identifier, you can understand the whole language mechanics in a few hours.

Wether or not an identifier exists is not the real question: you take as little (or an enormous backed-in DSL) as you wish.

- (define x y)
- (define (x y) z)
- (+ 1 2)
- (if x y z)
- (list "blue" "red" "green")
- (map (lambda (x) (\* x x)) a-list)
- and so on

I know that LISP stands for **LIS**t **P**rocessor and I understand why. I clearly get why it's a good language to learn the basics of CS, and even why [Uncle Bob](https://fr.wikipedia.org/wiki/Robert_C._Martin) himself says that maybe in the future, a lot of disparate languages will converge on some kind of LISP.

If one day hardware capacity is no more a limitation, it indeed can become the only language to produce any DSL you want, that every developer could understand around the world without struggling with new weird language mechanics, while focusing on a syntax and algebra that perfectly describe a domain...

## Back To Work

Now, 2 new crazy challenges:

- What about asking for "4 big blue houses"?
- How to make stuff move in time?

### Scaling

Back to the docs! I discover that Racket is strongly typed.
WTF? I didn't write any type since the beginning!

Indeed, it's dynamically typed, but it's not weakly typed: those are 2 different concepts.
In JavaScript "number" is a weak type, for all kinds of numbers.
In racket, a number has a stonger type, like "integer"... but still is automatically assigned (like in JS).

One very smart thing about the `pict-lib` provided by `#lang/slideshow`, is that almost all functions take a `pict` typed value and return a `pict` as well. That's why I can combine them, and reuse them. More generally, that's how you make a good DSL, and not only a framework/library.

So this should work perfectly:

```
(scale (house "orangered") 2)
(scale (rotate
        (car "powderblue")
        (/ pi 5))
       0.5)
```

![scale 1](/blog/2021-09-08-one_day_with_racket/img/13-scale1.png)

Now I'll enhance my legacy code. If I want to be able to ask for a big, small or normal-sized house I'll need some kind of `switch` or `else if` statement.

That switch can be done using [case](https://docs.racket-lang.org/guide/case.html) whereas else-if is more like [cond](https://docs.racket-lang.org/reference/if.html)

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
Is it even possible with my current `lang/slideshow`? There is indeed an [animation documentation](https://docs.racket-lang.org/pict/Animation_Helpers.html), but it appears to be highly related to slideshow stuff.

And it's not only about moving: I'll need a window, a game loop, collision stuff and so on.
Let's take some time to choose a better `lang` than slideshow for this advanced visual stuff...

> It's already 4:45 PM - Will I get a chance to get something running before midnight? Differents tools appear to make games, dependant on new stuff.
> A bit like this [racket/gui](https://docs.racket-lang.org/gui/index.html), but it will force me to learn a new way to draw: the `draw-lib`...
> I continue but [searching](https://pkgd.racket-lang.org/pkgn/search?q=game) takes time. I even find a [fully working snake game](https://github.com/Bogdanp/hebi/blob/master/hebi.rkt), but the code is too avanced for me...

> 5:09 PM - In the end, my choice falls on the [r-cade packages](https://docs.racket-lang.org/r-cade/index.html) - it seems to contain everything I need, and claims to have a snake-game example (that I will avoid for now, but will compare with in the end)

## A Snake Game

### R-cade Setup

Let's try the simplest example game:

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

Oh no! `r-cade` is not know by DrRacket. Thankfully the error provides me with a link to install it... which works directly.

Oh no! `r-cade` needs some dependencies on windows to run!  
It's well documented [here](https://r-cade.io/setup). I therefore install [csfml](https://www.sfml-dev.org/download/csfml/) (I unzip it in a freshly made `C:\other_program\csfml` folder to be sure not to pollute my computer), and add the path to the Windows Path environment variable.

![env csfml](/blog/2021-09-08-one_day_with_racket/img/15-env_csfml.png)

I had to install [OpenAL](https://www.openal.org/downloads/) as well, then fully restart DrRacket to be able to run my sample.

![r-cade](/blog/2021-09-08-one_day_with_racket/img/16-r-cade.png)

### Snake Specifications

What is a Snake Game? Here is my very opinionated vision of a simplified version:

- a 20x20 grid, made of tiles that have x/y coordinates
- a tile can be:

  - a wall tile (all edges)
  - an apple tile
  - a part of the snake: a snake-tile
  - a blank-tile

- the snake:

  - is made of 1+ consecutive snake-tiles
  - is always moving in the previously set direction (every 500ms)
  - the head can take any cardinal direction (NESW)
  - the body follows the head
  - when the head collides an apple-tile:
    - the apple disapears
    - the snake grows by 1 snake-tile
  - when the head collides a wall-tile or snake-tile: Game Over.

- apples:
  - there is always one in a random position in the field
  - if it's eaten, it disappears and a new one pops on a ramdom empty tile
  - if there is no empty tile left: Game Over

### Implementation

#### Window And Walls

Let's try to make a 20x20 window with 4 walls.  
Sadly, I know nothing about videogame development.  
My first reflex is just to draw walls as such:

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

This will draw on top-left a 1x20 sized rectangle, filled with a brown color.

![r-cade rect](/blog/2021-09-08-one_day_with_racket/img/17-r-cade_rect.png)

Do you remember about `begin`, allowing a series of functions?

I execute first the function `color` to pick a color in a [16 colors palette](https://docs.racket-lang.org/r-cade/index.html?q=r-cade#%28def._%28%28lib._r-cade%2Fmain..rkt%29._color%29%29) (4 = brown) for the next steps.

`rect` takes `x y` coordinates, `h w` sizes, and this strange `#:fill #t`. It's a "fill" unordered named argument (how smart!) that takes the value `True` or `False`: `#t` or `#f` in Racket.

I then continue with other walls, apples and a snake. But this method is a dead end because it doesn't track anything. It just produces a picture without state, without life.

What I really want is a representation of the state of the game, that can change and be re-drawn. A grid with the state of all its tiles.

I opt for a grid that is a list of lists: (rows) containing tiles (cells). A tile will be a tuple (a list with a few ordered members): (coord-x coord-y tile-type), like `(12 3 "apple")`.

Each game frame of the main loop will draw this grid, finding the current state of each tile.

```rkt
;; grid values
(define grid-size 20)
(define grid
  (build-list
   grid-size
   (lambda (y)
     (build-list grid-size (lambda (x) (list x y "blank"))))))
```

Here `build-list n value-as-lambda` creates a list of n items with cohesive values. Thoses values are based on a `lambda`: an anonymous and temporary function to call for the creation of the value. The lambda takes the current index as argument. In fact, I operate in nested lists to obtain this full grid of `(x y tile-type)` tuples.

Now, my wall's definition:

```rkt
; wall definition
(define max-grid-index (- grid-size 1))
(define wall-coords
  (let ([top (build-list grid-size (lambda (x)(list x 0)))]
        [bottom (build-list grid-size (lambda (x)(list x max-grid-index)))]
        [left (build-list (- grid-size 2) (lambda (y)(list 0 (+ y 1))))]
        [right (build-list (- grid-size 2) (lambda (y)(list max-grid-index (+ y 1))))]

        )
    (append top bottom left right)))
```

Nothing new here except for this `append` used to concatenate lists.
But where is the glue? How do I update the grid ?

In functional programming in general, you avoid state, mutability and side effects. But my approach of this game implies a changing state: the grid.
`(set! var-name new-value)` is the way to proceed. `for-each`, `list-update`, `list-set` are identifiers coming from [list docs](https://docs.racket-lang.org/reference/pairs.html).

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

What I need now is a function to draw that on the window:

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

I just produced a brown rectangle (or other colors) for each related info we have in the grid.

![r-cade walls](/blog/2021-09-08-one_day_with_racket/img/18-r-cade_walls.png)

> hmm... 8:12 PM - Let's take a final pause for dinner. I have some doubts about my ability to finish this challenge in time...
> But I have hope acting as fuel!
> I want to brag at work tomorrow, so failing is not an option.

#### The Snake

##### Show it

I want a centered snake, so I change my grid size to 21. The center should be (10 10) and I calculate it (because I want to be able to change the size of my grid).

If I want it to move 2 times per second, I have to change the framerate too.

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

A move will happen just after each draw. What I want to do is make the head of the snake follow a direction with each re-draw, until a given event.

For now, it simply goes like:

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

What about a collision with a wall?  
I can use `quit`, which stops the game when it occurs.

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

I suspect an awesome lang like r-cade to embed everything I need to change the direction of the snake when an arrow is pressed.

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

Isn't it self explanatory?  
When `snake-action` is called, check which button is currently pressed and move in the related direction.  
I just have to plug it in the loop and wait to see the effect!

```rkt
(define (game-loop)
  (cls)
  (snake-action)
  (snake-position-update)
  (draw-grid grid))
```

I'm getting ready for the final step: making the move itself depend on this direction.
I just have to adujst the next `x` and `y` accordingly.

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

And... it works well, despite the fact that the loop reiterates every 500ms, which is not enough to get all the inputs if I press the buttons too quickly.

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

To ensure every `keypress` event is taken, I revert the fps to 60,
then define a game-speed that will slow the view's update process.
`when` is what you find when you search for "if without else in racket".
The `modulo` makes the update "sleep" every turn except during the chosen one.

> It's 10:20 PM and I still haven't reached the main complexity of the snake problem.
> I can't sleep with that it mind, so I'll continue. As usual in computer science: devil is in the details, and estimation is fortune telling.

#### Apples

The specs I made say that there is always only one apple in the field, that could get eaten by the snake: in this case a new one will pop. But it has to pop on a blank tile, so I suspect I will need something like:

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

I will also need some randomisation here. You can imagine it exists in `racket`:

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

Recursion acts as a loop here: until the coordinates are not a blank tile, try again.

When it's a blank tile, I get the result. I just need to make sure to draw one before the start. Here we go.

#### Collisions

When the snake meets an apple:

- the apple is removed
- the snake grows
- a new apple pops

The first and second step could be a common step: replace the apple with a snake part.
I will change the name of `snake-update-position` to `game-update` which reflects the situation better.

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

Works well... until I remember that the snake should grow.  
And this part sounds to me like it's the real complexity: now the snake has to be a list of coordinates following each other and not just a point.

> Late, so late, I'm tired. I'll try, but I can't promise anything.

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

Amazingly, it works!

Now, the part that makes me afraid. For the snake to grow, I need to add a tail to the list just after the moment it eats an apple.

The snake is now a list of coordinates, following each other. When the snake moves, a new coordinate will replace the head of this list, and the tail of this list will disappear. So the re-draw will reflect this list shift.

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

Here I have `append` to update the list "immutably" and `drop-right` to do the "remove" job. In other words, I do some insert first/remove last, treating the snake like a [linked list](https://en.wikipedia.org/wiki/Linked_list).

![r-cade size](/blog/2021-09-08-one_day_with_racket/img/22-r-cade_size.png)

The very last shortcoming is the fact that when I press the opposite direction of the current one, the game quits.  
Indeed, the snake eats itself, because the tail of the snake is here.

I want to prevent the user to go back, so I'll add a condition that says "depending your current direction, you can't go back".  
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

Then in `game-update`, when the move is done:

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

Here we go! A real snake game, made with racket, working properly!
Happiness fills my soul and my tired body.

![r-cade final-snake](/blog/2021-09-08-one_day_with_racket/img/23-r-cade_final-snake.png)

> 00:01 AM - it was a long, but also an amazing and rewarding experience.
> Racket brings simplicity, expressiveness and well-made baked-in community DSLs on the table.
>
> Before publishing this article, I'll take the time to refactor my final code. You can find it on [this github repository](https://github.com/ltruchot/1day/tree/master/racket).
>
> I'll also find resources to go further to share. Thank you for your reading me, following me, sharing this piece and for your patience during this looooong journey.
>
> Hope to see you soon!
>
> Loïc TRUCHOT

_Proofreading & revisions by [Jordane Frechet](https://twitter.com/joruonk)_

## Resources to go further

I just discovered this language and this LISP world, but after one day with racket,
I decided to dive a little more into podcasts and videos. Here is what I found.

- On YouTube:

  - [Language-Oriented Programming with Racket - Matthias Felleisen](https://www.youtube.com/watch?v=z8Pz4bJV3Tk)
  - [Lisp with Uncle Bob Martin](https://youtu.be/wr4eqx3UYPc?t=319)
  - [Lisp: A language for stratified design](https://www.youtube.com/watch?v=GbZpTHg0KfQ)
