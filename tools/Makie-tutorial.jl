#using CairoMakie  #imports Makie  (w/ different plot functions )
module main()

function main()

    include("sinCos.jl")

        #--- Array Attributes
    include("arrayAttribs.jl"  )


        #--- Simple legend
    include("simplelegend.jl")

        #---Subplots
    include("legend.jl");
        #------ Legend

        #include(src\legend.jl)
    include("legend.jl");

    #import "legend.jl"

end

end  # module
