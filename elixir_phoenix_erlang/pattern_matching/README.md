# PatternMatching

Lets learn how to pattern match in Elixir.

## The match operator

In elixir = is called match operator. 

```
Elixir|iex|1▶ x = 7
7
Elixir|iex|2▶ 7 = x
7
Elixir|iex|3▶ 
```

When you do x = 7 elixir tries to match whats left and whats right.

7 = x also matches because x is 7 which matchex 7 on the right side.


## Why is pattern matching so useful

The match operator is not only used for matching but used to match complex data structures like lists, maps, structs and tuples among other. When used like this its what is called pattern maching in Elixir

Pattern matching Tuples
```
Elixir|iex|3▶ {a, b, c} = {:hello, "world", 2019}  
{:hello, "world", 2019}
Elixir|iex|4▶ a
:hello
Elixir|iex|5▶ b
"world"
Elixir|iex|6▶ c
2019
Elixir|iex|7▶
```

Pattern matching Lists

```
Elixir|iex|8▶ [a, b, c, d] = [:one, :two, "three", 4]
[:one, :two, "three", 4]
Elixir|iex|9▶ a
:one
Elixir|iex|10▶ b
:two
Elixir|iex|11▶ c
"three"
Elixir|iex|12▶ d
4
Elixir|iex|13▶
```

## Using patter matching

### Map Reduce List into a Map
Check the function named `reduce_list`
```
Elixir|iex|2▶ PatternMatching.reduce_list(["one", "two", "three"], %{})
%{"one" => "Done", "three" => "Done", "two" => "Done"}
Elixir|iex|3▶ 
```