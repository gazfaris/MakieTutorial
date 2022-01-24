```
If you add label attributes to your plots, you can call the axislegend function to add a legend with all labeled plots to the current axis.
```

include("includes.jl")

x = range(0, 10, length=100)
y1 = sin.(x)
y2 = cos.(x)

lines(x, y1, color = :red, label = "sin")
lines!(x, y2, color = :blue, label = "cos")
axislegend()
current_figure()
