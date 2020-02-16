###############################################################################
## play around
###############################################################################

function test(arg::Int64, arg2::Int64)
    return arg + arg2
end

function test(arg::Float64, arg2::Float64)
    return arg + arg2
end

function test(arg::Number, arg2::Number)
    return arg + arg2
end

#@time test(1.0, 1)


###############################################################################
## Exercise 3
###############################################################################
# 2
"""
rightjustify orientates everything to the right (last digit is in the 79
position)
"""
function rightjustify(s::String)
    len = length(s)
    whitespace = " " ^ (79 - len)
    println(string(whitespace, s))
end

# 3
"""
dotwice takes a function and an input and calls the given function twice
"""
function dotwice(f::Function, s::String)
    f(s)
    f(s)
end

# 4
"""
hor_part is helper function of printgrid. it prints horizontal seperator
lines of grid
"""
function hor_part(l::Int64)
    base = "+ - - - -"
    stop = "+"
    hor = base ^ l
    println(hor, stop)
end

"""
vert_part is helper function of printgrid. it prints vertical seperator
    lines of grid
"""
function vert_part(l::Int64)
    base = "|        "
    stop = "|"
    ver = base ^ l
    println(ver, stop)
end

"""
printgrid prints a grid to terminal
"""
function printgrid(c::Int64, r::Int64)
    for i = 1:c
        hor_part(r)
        vert_part(r)
        vert_part(r)
        vert_part(r)
        vert_part(r)
    end
    hor_part(r)
end


###############################################################################
## Exercise 3
###############################################################################
# 3
using ThinkJulia
"""
turtlesquare draws a squar with turtle
"""
function turtlesquare(θ::Turtle)
    pendown(θ)
    @svg begin
        for i in 1:4
            forward(θ, 100)
            turn(θ, -90)
        end # for
    end # svg begin
    penup(θ)
end # function turtlesquare

# 4
"""
square draws a squar with turtle with a sidelength len
"""
function square(θ::Turtle, len::Int64)
    pendown(θ)
    @svg begin
        for i in 1:4
            forward(θ, len)
            turn(θ, -90)
        end # for
    end # svg begin
    penup(θ)
end # function turtlesquare

# 5
"""
polygon draws a n-sided regula polygon with turtle
"""
function polygon(θ::Turtle, len::Int64, n::Int64)
    pendown(θ)
    @svg begin
        for i in 1:n
            forward(θ, len)
            turn(θ, -(360/n))
        end # for
    end # svg begin
    penup(θ)
end # function turtlesquare

#6
"""
circle draws circle with Turtle θ and radius r
remember:
    circumference = 2πr
    len * n = circumference
    → len * n = 2πr
"""
function circle(θ::Turtle, r::Int64)
    x = sqrt(2*π*r)
    len = floor(Int64, x)
    n = floor(Int64, x) + 1
    println("Radius is of by $(round(r-(len * n)/(2π), digits=3))")
    polygon(θ, floor(Int64, x), floor(Int64, x)+1)
end


function arc(θ, r, angle)
    arc_len = 2 * π * r * angle / 360
    x = sqrt(arc_len)
    step_len = arc_len / x
    step_angle = angle / x
    polyline(θ, x, step_len, step_angle)
end

function polyline(θ, n, len, angle)
    pendown(θ)
    @svg begin
        for i in 1:n
            forward(θ, len)
            turn(θ, -angle)
        end # for
    end # begin
end #function name(args)

text = readline(
)

arc(Turtle(), 25, 360)

function draw(t, length, n)
    if n == 0
        return
    end
    angle = 15
    println("n is $(n)")
    forward(t, length*n)
    turn(t, -angle)
    draw(t, length, n-1)
    turn(t, 2*angle)
    draw(t, length, n-1)
    turn(t, -angle)
    forward(t, -length*n)
end

@svg draw(Turtle(), 10, 5)
