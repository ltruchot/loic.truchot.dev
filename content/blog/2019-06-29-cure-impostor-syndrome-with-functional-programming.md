+++
title="Cure Impostor Syndrome with Functional Programming"
description="Journey of a senior developer switching to functional programming"
slug ="cure-impostor-syndrome-with-functional-programming"
+++
Ten years of web development made me feel like Neo, before he met Morpheus. Something was wrong in this world. I had some clues, but I couldn't explain exactly what it was.

My everyday language was JavaScript. I eventually decided to become a teacher and explain how to make real-world webapps to beginners and juniors.

I didn't switch careers because I felt established, in fact, it was the opposite. I wanted to be a teacher so I could upgrade my skills, question them, and cure my own impostor syndrome.

Who, after a degree and ten years of practice in a field, can feel like an impostor; an eternal newbie? Programmers, of course.

But why? I'll try to explain what I discovered.

I used to start my programming lessons with something like: "You don't need maths at all to be a good programmer. We need problem solvers."

And of course: "There is a tool for everything. You don't even need to be a good coder if you know where to find, and use, the right resources."

And even: "As the industry is changing so fast, you have to learn a framework per year to keep up with the trends."

When we speak about quality, I always promote wisely-chosen camelCase variable names. When someone asks me why the web is so messy, I describe JavaScript's weaknesses and fatigue (JS, a language that nobody learns), coders' laziness, lack of tests/DevOps/design patterns/quality tools, etc.

When it comes to impostor syndrome, even if I suffer from it, I just try to reassure people to: "Continue to deliver apps, it's in your head, it will vanish with your achievements."

Yet, my impostor syndrome didn't vanish in time - my achievements did.

The entirety of my websites and apps disappeared. My first PHP & ASP.NET custom CMS, my Java & early Node back ends, my jQuery plugins, my Dojo apps, my Ruby on Rails projects, my AngularJS landing pages and Ionic mobile apps, even my recent work with Vue 1, Angular 2 beta and early React are not online anymore.

And I know why. Those projects were too big to change and too buggy - the technology was perishable, investment flow was inconsistent, and the new coders were too inexperienced to grow the existing codebase.

Even the work done with the best practices are lost, dead and burning in (callback) hell. DDD, design patterns, API, microservices, TDD, linters + prettiers, comments, GitFlow, best frameworks and libraries, Docker, CI/CD and DevOps, KISS, Redux, ReactiveX, Agile management, task runners and transpilers, pair programming and reviews, etc.

We tried everything. But after all of that, something in the projects is still bad. The codebases will continue to be updated until it's too big; then we want to re-code it from scratch. It's obviously a vicious circle.

What if I was wrong all this time? Ten years of errors?

What if there is a different explanation for the mess we made in web development, and in computer science in general?

What if the thing we missed was in fact the exact opposite of what I was teaching?

If so let's reverse the instructions.
- Stop trying to solve the problem as enthusiastic monkey patchers.
- Stop combining unreliable tools without knowing the basics.
- Stop placing every code in cages, terrorized by the monsters we know we will create.
- Stop filling the endless void with more code.
- Stop choosing names or developing static APIs bound to versatile problems, with perishable purpose.
- Stop developing new data structures, without expressing the potential of existing ones.
- Stop changing technology, frameworks and code base every month - modify them in a way that they'll be more reliable and usable in 10 years time.
- Stop being an impostor.

## Functional Programming

Have you heard about functional programming?

Yes of course, because every big language, company, and thought leader has taken steps in this direction for a few years now.

But what is Functional Programming about?

Two years ago, I went to my nearest university library, trying to find books about monads, Lambda calculus, semigroups, combinators, linear algebra, higher-order functions, and others subjects that pops when we discover FP.

I was naively searching for computer science books and found nothing.

A few weeks ago, I went to the same place for a book about Boolean algebra, to prepare for class.

The library assistant took me to the mathematics shelves, and there I discovered the Grail - 50 old books about everything you can find in the fantasy-land of Functional Programming.

Monoïds, and the operations you can do with them, were clearly explained in the first dusty book I opened.

It was a moment of enlightenment, the Morpheus pill was this shelf. The answer I was searching since 10 years was incredibly simple: "math matters". I still don't understand everything about Monoïds, but I can clearly see the path now, with the green characters of the matrix falling all around me.

Why don't programs work?

Why do we need to completely rewrite them every two years?

Because they lack mathematics. Of course.

We want to manipulate the "zero" and the "one" all day, but we don't even know about simple (Boolean) algebra like identity, commutativity, associability, idempotency, etc.

Problem solving is not the skill - spending your time reinventing and patching (even smartly) will still increase the codebase, creating a form of "technical debt" that nobody wants to pay.

So what do we need?

What we need is less code.

What we need is proof that it works. Not "TDD proof" that is costly, but an approach that will surely solve every case.

What we need is a scalability level that doesn't require any name for variables other than a, b, or c. Our functions will be so simple, so generic, so stable, so composable, so future-proof that they can be read and use the same way now and in 30 years.

What we need isn't artificial limits and tools everywhere to avoid bad code or bad practices, but algebra everywhere.

What we need is to stop being impostors, and eventually begin to think for the computer, think like it. This machine we are programming, this concept of being able to cleverly calculate everything. It will be hard. At least it's tough for me.

What does a computer do when it's powered up?

It takes data from DD as input, and computes it as outputs that our devices need. Then, it waits for new inputs, allowing us to develop programs or apps to map certain outputs again.
There are only two cases:
- If it's already computed then we just need memory.
- If it will be computed we need a function.

Why did we take something so simple and complicate it? Instead of learning math, we chose to invent a cryptic world of pop-cultured languages and tools that can more or less solve any kind of problem.

Every time we try to play it by ear we create more problems.

It's bug oriented programming.

In informatics' early days, ways to perform calculations still needed to be discovered. Back then, it was okay to find workarounds in order to organize everything, to create new vocabulary and languages to re-use basic calculations.

It's now a shame to not know and use what we have. Computers and languages are so reliable that they can compute trillions of data without error, from a well made function. Besides the effects on the nanoscopic transistors, it is still reliable and we can say that the function is "pure".

Who is good with functions and knows all their dirty little secrets? The mathematicians of course.

Just use that power! CPU engineers have done their work. Now, let's show them what we can do on our side. Not to mention that new problems in the informatics field are about asynchronicity, multithreading, and concurrency - the main purpose of FP, its reason for being.

So what will I teach now?

Do not change the language or framework, instead change your mind.

Continue with docker, linters, DDD, TDD, anything that helps you to deliver reliable apps.
But, in your everyday work:
- Stop writing more code, more data structures, APIs and classes. Write less until you get a core one-line, one-argument reusable pure function. Go to the smallest bits.
- Try to use these functions like a professional, and keep real world "effects" for before and after the beautiful process you wrote.
- Begin to learn, step-by-step, about Functional Programming. See it as a mathematical prerequisite to become a confident senior programmer.
- Begin to use functions from the FP world, just to see where they lead you (map, filter, reduce, pipe, etc.).
- Begin to write your own higher-order functions. Then benefit from their useful mathematical properties.

Do you want a design pattern to begin with?
Here is an "onion" pattern (aka [stratified design](https://dspace.mit.edu/bitstream/handle/1721.1/6064/AIM-986.pdf) for any size of project:

- Your programming language is an implicit layer with primitives that you have to thoroughly learn.
- Code a layer for core functions which are lacking in your language such as "log", "not", "even", "odd", "concat", "map", "reduce", "filter", "compose", "pipe", and so on. Or you can use an existing one, like Ramda or Lodash, but if so, learn it well. Let's call them utils.
- A layer for your "domain" functions and data models that you can reuse in every project in your domain, company or business. Let's call them helpers.
- A layer for your current program functions and data models. Let's call them services.
- A top layer, which is your program and where you use data, functions, and effects under control. Ideally, this is the only place where you intricate your codebase with some front end framework. Therefore, you can keep all the rest if you change your framework.

Each layer is simply a composition of previous ones. If you respect this order then you can drop the upper layer at any time and use the previous one.

For a little project or POC, just use two or three layers.

A new generation of coders is coming. Millions of people around the world are currently learning and training; amplified by the 'suction effect' of well paid and interesting jobs.

The majority think that being a problem solver or 'learning what public static void method is' or 'getting started with a trendy framework', is sufficient to create working apps. This is the case if you only need disposable programs.

You can spend an entire career with those illusions, finding comfort around others with the same belief system, as I had. As a consequence, the problems with everyday production updates for unfinished and unfinishable products will increase, just like JavaScript fatigue itself.

But there is hope too. A lot of young coders are not formatted by the OO classic journey, or imperative approach. They don't want to just solve problems with spaghetti code. Some are already fascinated with functional programming.

So, jump on the FP train before it's too late. The internet is in primitive chaos but we will remodel it together. It will make a difference for the future, and you will become the colleague, mentor or teacher we so desperately need.

But, be kind to the people who don't already know the good news, we don't want to leave them behind. Revelation could take time.

I want to make a hypothesis, to better explain my own journey.

Why did JavaScript become so popular so quickly? Why do some coders fall in love with it, despite its obvious defects? I think it's only because of its function as values, that it seduced every coder that used it.

They don't know why it feels so good, but they stay there, naturally becoming eloquent, asking for more. Maybe this intuition will lead you to FP, just like me. Don't wait years to open your eyes, begin today.

But be careful, if JavaScript seduced you for this reason and you never learned how to manage it, ultimately you will end up with a defective code.

What about me? Since I started using this paradigm, my programs are not only better, but more real, under control, and finally truly reliable. My codebase reduces everyday. I have never felt happier in my programmer/teacher life, because I finally know what I'm doing.

Refactoring is now a pleasure. It feels like a game where I say: "Oh! I can factorize that in this way and it was just a combination of simple things I already know!"

I still have everything to learn from math, because I avoided it for all those years.

But now, my impostor syndrome begins to vanish. I will never fully get rid of it, since I still believe in Shoshin (beginners mind - Zen Buddhism), but it doesn't scare me anymore.

PS: If you want to dive into front end FP, in place of just starting incrementally in your language, you can try to learn PureScript, ClojureScript, ReasonReact, fp-ts or Elm (my personal favorite). They target JavaScript, but force you to think as a functional programmer.