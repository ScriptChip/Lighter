# Examples
## <a href="https://github.com/ScriptChip/Lighter/blob/master/examples/hello-world.lighter">Hello world</a>
Logs "Hello world!" to console.<br>
`print("Hello world!")`<br>
This function print the text into console, accepts only one argument - `print("Hello", "wolrd")` won't work<br>
To print more than one variable use `log("Variable 1", "Variable 2", "Variable 3")`

## <a href="https://github.com/ScriptChip/Lighter/blob/master/examples/variables.lighter">Variables</a>
Introducing 2 new functions: `do()` and `define()`<br>
In Lighter you can only execute one command inside a file, unless you use a `do()` function:<br>
```
do(
    print("Hello"),
    print("world")
)
```
In such way you can run as many functions as you want, but remember to put comma after every function inside `do()`!<br>
`define()` defines new or overwrites already existing variable<br>
`define(hello, 10)` defines a variable with name "hello" with value of Number 10<br>
`define(hello, +(hello, 10))` adds 10 to "hello" variable
You can also use `-, *, /` instead of plus

## <a href="https://github.com/ScriptChip/Lighter/blob/master/examples/if.lighter">If's</a>
`if()` is one of the most important functions in everyprogramming language.
Here is how to use it:
```
if(OPERATOR(VARIABLE, TESTER),
    print("Test passed (You can replace this function with do())"),
    print("Test did not pass, also can be replaced with do()")
)
```
For example:
```
if(==(10, 10),
    print("10 is equal 10"),
    print("I have no idea what happened here...")
)
```
You can use all of this operators: `==, <, >`
