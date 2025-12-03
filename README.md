# AOC2025

## Randomizer
Each day randomizer should be run like this
``` 
~/randomizer/a.out >> README.md
```

## Day 01
This Advent Of Code should be done using: Zig
### Day 01 - opinions and details
This was basically the first time I used Zig or indeed had a deeper look at Zig
in any way/shape/form. The general feel for language is that it feels like C but
with some nice things added. There were a couple of moments where I hit a hurdle
(which to be fair is competely my fault since I just started writing code based
on looking at a quick overview). The first one was me not understading that `try`
basically does:

```Go
if err != nil { return err }
```
After reading [Learning Zig](https://www.openmymind.net/learning_zig/) - which
was done in parallel with writing the code - I started to get a better picture
what and why `try` didn't work as I expected it. Please note that this means
I've kinda overcomplicated things (which probably won't happen when a language
I'm completley at home with (e.g. Java and Kotlin) gets selected) like using
`struct` and `enum` when everything could be handled with chars (or `u8`) and
regular ints (or `i32`).
Next big hurdle was after reading the file put everything in an array of
rotations and then actually perform the rotations to get the correct result.


