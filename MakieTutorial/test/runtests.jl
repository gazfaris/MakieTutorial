```
used to run tests

```
#file runtests.jl
using Test
using MakieTutorial
using Makie-Tutorial


println("hello!")
#print(read("Makie/MakieTutorial/test/runtests.jl", String))
println("Testing...")

import Pkg; Pkg.add("mypkg")
