```
Makie uses a powerful layout system under the hood, which allows you to create very complex figures with many subplots. For the easiest way to do this, we need a Figure object. So far, we haven't seen this explicitly, it was created in the background in the first plotting function call.

We can also create a Figure directly and then continue working with it. We can make subplots by giving the location of the subplot in our layout grid as the first argument to our plotting function. The basic syntax for specifying the location in a figure is fig[row, col].
```
include("includes.jl")
#using CairoMakie

x = LinRange(0, 10, 100)
y = sin.(x)

fig = Figure()
lines(fig[1, 1], x, y, color = :red)
lines(fig[1, 2], x, y, color = :blue)
lines(fig[2, 1:2], x, y, color = :green)

fig

#---Each lines call creates a new axis in the position given as the first argument, that's why we use lines and not lines! here.

```
Constructing axes manually
Like Figures, we can also create axes manually. This is useful if we want to prepare an empty axis to then plot into it later.

The default 2D axis that we have created implicitly so far is called Axis and can also be created in a specific position in the figure by passing that position as the first argument.

For example, we can create a figure with three axes.
```

#using CairoMakie

fig = Figure()
ax1 = Axis(fig[1, 1])
ax2 = Axis(fig[1, 2])
ax3 = Axis(fig[2, 1:2])
fig

#---
```
And then we can continue to plot into these empty axes.
```

lines!(ax1, 0..10, sin)
lines!(ax2, 0..10, cos)
lines!(ax3, 0..10, sqrt)
fig
#prints 3 plots: Two vertical against other, ax1, ax2; 1 below them

#---

```
Note, the notation 0..10 above creates a closed interval from 0 to 10 (see IntervalSets.jl for further details).

Axes also have many attributes that you can set, for example to give them a title, or labels.
```

ax1.title = "sin"
ax2.title = "cos"
ax3.title = "sqrt"

ax1.ylabel = "amplitude"
ax3.ylabel = "amplitude"
ax3.xlabel = "time"
fig
