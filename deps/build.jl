using Libdl

cd(joinpath(dirname(@__FILE__), "src"))
run(`make`)
if (!ispath("../lib"))
    run(`mkdir ../lib`)
end

run(`mv mpfr_float128.$(Libdl.dlext) ../lib`)

