baremodule DZBase

export +, ⊕, -, ⊖, *, ⊗, /, ⊘, %, ==, !=, <, >, <=, >=,
    Array, Vector, Matrix, length

##################################################### UNARY ARITHMETIC OPERATORS

+(x::Int8   ) = x
+(x::Int16  ) = x
+(x::Int32  ) = x
+(x::Int64  ) = x
+(x::Int128 ) = x
+(x::UInt8  ) = x
+(x::UInt16 ) = x
+(x::UInt32 ) = x
+(x::UInt64 ) = x
+(x::UInt128) = x
+(x::Float16) = x
+(x::Float32) = x
+(x::Float64) = x

-(x::Int8   ) = Core.Intrinsics.neg_int(x)
-(x::Int16  ) = Core.Intrinsics.neg_int(x)
-(x::Int32  ) = Core.Intrinsics.neg_int(x)
-(x::Int64  ) = Core.Intrinsics.neg_int(x)
-(x::Int128 ) = Core.Intrinsics.neg_int(x)
-(x::UInt8  ) = Core.Intrinsics.neg_int(x)
-(x::UInt16 ) = Core.Intrinsics.neg_int(x)
-(x::UInt32 ) = Core.Intrinsics.neg_int(x)
-(x::UInt64 ) = Core.Intrinsics.neg_int(x)
-(x::UInt128) = Core.Intrinsics.neg_int(x)

-(x::Float16) = Core.Intrinsics.llvmcall("
    %res = fneg fast half %0
    ret half %res
", Float16, Tuple{Float16}, x)

-(x::Float32) = Core.Intrinsics.llvmcall("
    %res = fneg fast float %0
    ret float %res
", Float32, Tuple{Float32}, x)

-(x::Float64) = Core.Intrinsics.llvmcall("
    %res = fneg fast double %0
    ret double %res
", Float64, Tuple{Float64}, x)

⊖(x::Float16) = Core.Intrinsics.llvmcall("
    %res = fneg nnan ninf nsz half %0
    ret half %res
", Float16, Tuple{Float16}, x)

⊖(x::Float32) = Core.Intrinsics.llvmcall("
    %res = fneg nnan ninf nsz float %0
    ret float %res
", Float32, Tuple{Float32}, x)

⊖(x::Float64) = Core.Intrinsics.llvmcall("
    %res = fneg nnan ninf nsz double %0
    ret double %res
", Float64, Tuple{Float64}, x)

*(x::Int8   ) = x
*(x::Int16  ) = x
*(x::Int32  ) = x
*(x::Int64  ) = x
*(x::Int128 ) = x
*(x::UInt8  ) = x
*(x::UInt16 ) = x
*(x::UInt32 ) = x
*(x::UInt64 ) = x
*(x::UInt128) = x
*(x::Float16) = x
*(x::Float32) = x
*(x::Float64) = x

#################################################### BINARY ARITHMETIC OPERATORS

+(x::Int8   , y::Int8   ) = Core.Intrinsics.add_int(x, y)
+(x::Int16  , y::Int16  ) = Core.Intrinsics.add_int(x, y)
+(x::Int32  , y::Int32  ) = Core.Intrinsics.add_int(x, y)
+(x::Int64  , y::Int64  ) = Core.Intrinsics.add_int(x, y)
+(x::Int128 , y::Int128 ) = Core.Intrinsics.add_int(x, y)
+(x::UInt8  , y::UInt8  ) = Core.Intrinsics.add_int(x, y)
+(x::UInt16 , y::UInt16 ) = Core.Intrinsics.add_int(x, y)
+(x::UInt32 , y::UInt32 ) = Core.Intrinsics.add_int(x, y)
+(x::UInt64 , y::UInt64 ) = Core.Intrinsics.add_int(x, y)
+(x::UInt128, y::UInt128) = Core.Intrinsics.add_int(x, y)

+(x::Float16, y::Float16) = Core.Intrinsics.llvmcall("
    %res = fadd fast half %0, %1
    ret half %res
", Float16, Tuple{Float16, Float16}, x, y)

+(x::Float32, y::Float32) = Core.Intrinsics.llvmcall("
    %res = fadd fast float %0, %1
    ret float %res
", Float32, Tuple{Float32, Float32}, x, y)

+(x::Float64, y::Float64) = Core.Intrinsics.llvmcall("
    %res = fadd fast double %0, %1
    ret double %res
", Float64, Tuple{Float64, Float64}, x, y)

⊕(x::Float16, y::Float16) = Core.Intrinsics.llvmcall("
    %res = fadd nnan ninf nsz half %0, %1
    ret half %res
", Float16, Tuple{Float16, Float16}, x, y)

⊕(x::Float32, y::Float32) = Core.Intrinsics.llvmcall("
    %res = fadd nnan ninf nsz float %0, %1
    ret float %res
", Float32, Tuple{Float32, Float32}, x, y)

⊕(x::Float64, y::Float64) = Core.Intrinsics.llvmcall("
    %res = fadd nnan ninf nsz double %0, %1
    ret double %res
", Float64, Tuple{Float64, Float64}, x, y)

-(x::Int8   , y::Int8   ) = Core.Intrinsics.sub_int(x, y)
-(x::Int16  , y::Int16  ) = Core.Intrinsics.sub_int(x, y)
-(x::Int32  , y::Int32  ) = Core.Intrinsics.sub_int(x, y)
-(x::Int64  , y::Int64  ) = Core.Intrinsics.sub_int(x, y)
-(x::Int128 , y::Int128 ) = Core.Intrinsics.sub_int(x, y)
-(x::UInt8  , y::UInt8  ) = Core.Intrinsics.sub_int(x, y)
-(x::UInt16 , y::UInt16 ) = Core.Intrinsics.sub_int(x, y)
-(x::UInt32 , y::UInt32 ) = Core.Intrinsics.sub_int(x, y)
-(x::UInt64 , y::UInt64 ) = Core.Intrinsics.sub_int(x, y)
-(x::UInt128, y::UInt128) = Core.Intrinsics.sub_int(x, y)

-(x::Float16, y::Float16) = Core.Intrinsics.llvmcall("
    %res = fsub fast half %0, %1
    ret half %res
", Float16, Tuple{Float16, Float16}, x, y)

-(x::Float32, y::Float32) = Core.Intrinsics.llvmcall("
    %res = fsub fast float %0, %1
    ret float %res
", Float32, Tuple{Float32, Float32}, x, y)

-(x::Float64, y::Float64) = Core.Intrinsics.llvmcall("
    %res = fsub fast double %0, %1
    ret double %res
", Float64, Tuple{Float64, Float64}, x, y)

⊖(x::Float16, y::Float16) = Core.Intrinsics.llvmcall("
    %res = fsub nnan ninf nsz half %0, %1
    ret half %res
", Float16, Tuple{Float16, Float16}, x, y)

⊖(x::Float32, y::Float32) = Core.Intrinsics.llvmcall("
    %res = fsub nnan ninf nsz float %0, %1
    ret float %res
", Float32, Tuple{Float32, Float32}, x, y)

⊖(x::Float64, y::Float64) = Core.Intrinsics.llvmcall("
    %res = fsub nnan ninf nsz double %0, %1
    ret double %res
", Float64, Tuple{Float64, Float64}, x, y)

*(x::Int8   , y::Int8   ) = Core.Intrinsics.mul_int(x, y)
*(x::Int16  , y::Int16  ) = Core.Intrinsics.mul_int(x, y)
*(x::Int32  , y::Int32  ) = Core.Intrinsics.mul_int(x, y)
*(x::Int64  , y::Int64  ) = Core.Intrinsics.mul_int(x, y)
*(x::Int128 , y::Int128 ) = Core.Intrinsics.mul_int(x, y)
*(x::UInt8  , y::UInt8  ) = Core.Intrinsics.mul_int(x, y)
*(x::UInt16 , y::UInt16 ) = Core.Intrinsics.mul_int(x, y)
*(x::UInt32 , y::UInt32 ) = Core.Intrinsics.mul_int(x, y)
*(x::UInt64 , y::UInt64 ) = Core.Intrinsics.mul_int(x, y)
*(x::UInt128, y::UInt128) = Core.Intrinsics.mul_int(x, y)

*(x::Float16, y::Float16) = Core.Intrinsics.llvmcall("
    %res = fmul fast half %0, %1
    ret half %res
", Float16, Tuple{Float16, Float16}, x, y)

*(x::Float32, y::Float32) = Core.Intrinsics.llvmcall("
    %res = fmul fast float %0, %1
    ret float %res
", Float32, Tuple{Float32, Float32}, x, y)

*(x::Float64, y::Float64) = Core.Intrinsics.llvmcall("
    %res = fmul fast double %0, %1
    ret double %res
", Float64, Tuple{Float64, Float64}, x, y)

⊗(x::Float16, y::Float16) = Core.Intrinsics.llvmcall("
    %res = fmul nnan ninf nsz half %0, %1
    ret half %res
", Float16, Tuple{Float16, Float16}, x, y)

⊗(x::Float32, y::Float32) = Core.Intrinsics.llvmcall("
    %res = fmul nnan ninf nsz float %0, %1
    ret float %res
", Float32, Tuple{Float32, Float32}, x, y)

⊗(x::Float64, y::Float64) = Core.Intrinsics.llvmcall("
    %res = fmul nnan ninf nsz double %0, %1
    ret double %res
", Float64, Tuple{Float64, Float64}, x, y)

/(x::Int8   , y::Int8   ) = Core.Intrinsics.sdiv_int(x, y)
/(x::Int16  , y::Int16  ) = Core.Intrinsics.sdiv_int(x, y)
/(x::Int32  , y::Int32  ) = Core.Intrinsics.sdiv_int(x, y)
/(x::Int64  , y::Int64  ) = Core.Intrinsics.sdiv_int(x, y)
/(x::Int128 , y::Int128 ) = Core.Intrinsics.sdiv_int(x, y)
/(x::UInt8  , y::UInt8  ) = Core.Intrinsics.udiv_int(x, y)
/(x::UInt16 , y::UInt16 ) = Core.Intrinsics.udiv_int(x, y)
/(x::UInt32 , y::UInt32 ) = Core.Intrinsics.udiv_int(x, y)
/(x::UInt64 , y::UInt64 ) = Core.Intrinsics.udiv_int(x, y)
/(x::UInt128, y::UInt128) = Core.Intrinsics.udiv_int(x, y)

/(x::Float16, y::Float16) = Core.Intrinsics.llvmcall("
    %res = fdiv fast half %0, %1
    ret half %res
", Float16, Tuple{Float16, Float16}, x, y)

/(x::Float32, y::Float32) = Core.Intrinsics.llvmcall("
    %res = fdiv fast float %0, %1
    ret float %res
", Float32, Tuple{Float32, Float32}, x, y)

/(x::Float64, y::Float64) = Core.Intrinsics.llvmcall("
    %res = fdiv fast double %0, %1
    ret double %res
", Float64, Tuple{Float64, Float64}, x, y)

⊘(x::Float16, y::Float16) = Core.Intrinsics.llvmcall("
    %res = fdiv nnan ninf nsz half %0, %1
    ret half %res
", Float16, Tuple{Float16, Float16}, x, y)

⊘(x::Float32, y::Float32) = Core.Intrinsics.llvmcall("
    %res = fdiv nnan ninf nsz float %0, %1
    ret float %res
", Float32, Tuple{Float32, Float32}, x, y)

⊘(x::Float64, y::Float64) = Core.Intrinsics.llvmcall("
    %res = fdiv nnan ninf nsz double %0, %1
    ret double %res
", Float64, Tuple{Float64, Float64}, x, y)

%(x::Int8   , y::Int8   ) = Core.Intrinsics.srem_int(x, y)
%(x::Int16  , y::Int16  ) = Core.Intrinsics.srem_int(x, y)
%(x::Int32  , y::Int32  ) = Core.Intrinsics.srem_int(x, y)
%(x::Int64  , y::Int64  ) = Core.Intrinsics.srem_int(x, y)
%(x::Int128 , y::Int128 ) = Core.Intrinsics.srem_int(x, y)
%(x::UInt8  , y::UInt8  ) = Core.Intrinsics.urem_int(x, y)
%(x::UInt16 , y::UInt16 ) = Core.Intrinsics.urem_int(x, y)
%(x::UInt32 , y::UInt32 ) = Core.Intrinsics.urem_int(x, y)
%(x::UInt64 , y::UInt64 ) = Core.Intrinsics.urem_int(x, y)
%(x::UInt128, y::UInt128) = Core.Intrinsics.urem_int(x, y)

########################################################### COMPARISON OPERATORS

==(x::Int8   , y::Int8   ) = Core.Intrinsics.eq_int(x, y)
==(x::Int16  , y::Int16  ) = Core.Intrinsics.eq_int(x, y)
==(x::Int32  , y::Int32  ) = Core.Intrinsics.eq_int(x, y)
==(x::Int64  , y::Int64  ) = Core.Intrinsics.eq_int(x, y)
==(x::Int128 , y::Int128 ) = Core.Intrinsics.eq_int(x, y)
==(x::UInt8  , y::UInt8  ) = Core.Intrinsics.eq_int(x, y)
==(x::UInt16 , y::UInt16 ) = Core.Intrinsics.eq_int(x, y)
==(x::UInt32 , y::UInt32 ) = Core.Intrinsics.eq_int(x, y)
==(x::UInt64 , y::UInt64 ) = Core.Intrinsics.eq_int(x, y)
==(x::UInt128, y::UInt128) = Core.Intrinsics.eq_int(x, y)

!=(x::Int8   , y::Int8   ) = Core.Intrinsics.ne_int(x, y)
!=(x::Int16  , y::Int16  ) = Core.Intrinsics.ne_int(x, y)
!=(x::Int32  , y::Int32  ) = Core.Intrinsics.ne_int(x, y)
!=(x::Int64  , y::Int64  ) = Core.Intrinsics.ne_int(x, y)
!=(x::Int128 , y::Int128 ) = Core.Intrinsics.ne_int(x, y)
!=(x::UInt8  , y::UInt8  ) = Core.Intrinsics.ne_int(x, y)
!=(x::UInt16 , y::UInt16 ) = Core.Intrinsics.ne_int(x, y)
!=(x::UInt32 , y::UInt32 ) = Core.Intrinsics.ne_int(x, y)
!=(x::UInt64 , y::UInt64 ) = Core.Intrinsics.ne_int(x, y)
!=(x::UInt128, y::UInt128) = Core.Intrinsics.ne_int(x, y)

<(x::Int8   , y::Int8   ) = Core.Intrinsics.slt_int(x, y)
<(x::Int16  , y::Int16  ) = Core.Intrinsics.slt_int(x, y)
<(x::Int32  , y::Int32  ) = Core.Intrinsics.slt_int(x, y)
<(x::Int64  , y::Int64  ) = Core.Intrinsics.slt_int(x, y)
<(x::Int128 , y::Int128 ) = Core.Intrinsics.slt_int(x, y)
<(x::UInt8  , y::UInt8  ) = Core.Intrinsics.ult_int(x, y)
<(x::UInt16 , y::UInt16 ) = Core.Intrinsics.ult_int(x, y)
<(x::UInt32 , y::UInt32 ) = Core.Intrinsics.ult_int(x, y)
<(x::UInt64 , y::UInt64 ) = Core.Intrinsics.ult_int(x, y)
<(x::UInt128, y::UInt128) = Core.Intrinsics.ult_int(x, y)

>(x::Int8   , y::Int8   ) = Core.Intrinsics.slt_int(y, x)
>(x::Int16  , y::Int16  ) = Core.Intrinsics.slt_int(y, x)
>(x::Int32  , y::Int32  ) = Core.Intrinsics.slt_int(y, x)
>(x::Int64  , y::Int64  ) = Core.Intrinsics.slt_int(y, x)
>(x::Int128 , y::Int128 ) = Core.Intrinsics.slt_int(y, x)
>(x::UInt8  , y::UInt8  ) = Core.Intrinsics.ult_int(y, x)
>(x::UInt16 , y::UInt16 ) = Core.Intrinsics.ult_int(y, x)
>(x::UInt32 , y::UInt32 ) = Core.Intrinsics.ult_int(y, x)
>(x::UInt64 , y::UInt64 ) = Core.Intrinsics.ult_int(y, x)
>(x::UInt128, y::UInt128) = Core.Intrinsics.ult_int(y, x)

<=(x::Int8   , y::Int8   ) = Core.Intrinsics.sle_int(x, y)
<=(x::Int16  , y::Int16  ) = Core.Intrinsics.sle_int(x, y)
<=(x::Int32  , y::Int32  ) = Core.Intrinsics.sle_int(x, y)
<=(x::Int64  , y::Int64  ) = Core.Intrinsics.sle_int(x, y)
<=(x::Int128 , y::Int128 ) = Core.Intrinsics.sle_int(x, y)
<=(x::UInt8  , y::UInt8  ) = Core.Intrinsics.ule_int(x, y)
<=(x::UInt16 , y::UInt16 ) = Core.Intrinsics.ule_int(x, y)
<=(x::UInt32 , y::UInt32 ) = Core.Intrinsics.ule_int(x, y)
<=(x::UInt64 , y::UInt64 ) = Core.Intrinsics.ule_int(x, y)
<=(x::UInt128, y::UInt128) = Core.Intrinsics.ule_int(x, y)

>=(x::Int8   , y::Int8   ) = Core.Intrinsics.sle_int(y, x)
>=(x::Int16  , y::Int16  ) = Core.Intrinsics.sle_int(y, x)
>=(x::Int32  , y::Int32  ) = Core.Intrinsics.sle_int(y, x)
>=(x::Int64  , y::Int64  ) = Core.Intrinsics.sle_int(y, x)
>=(x::Int128 , y::Int128 ) = Core.Intrinsics.sle_int(y, x)
>=(x::UInt8  , y::UInt8  ) = Core.Intrinsics.ule_int(y, x)
>=(x::UInt16 , y::UInt16 ) = Core.Intrinsics.ule_int(y, x)
>=(x::UInt32 , y::UInt32 ) = Core.Intrinsics.ule_int(y, x)
>=(x::UInt64 , y::UInt64 ) = Core.Intrinsics.ule_int(y, x)
>=(x::UInt128, y::UInt128) = Core.Intrinsics.ule_int(y, x)

################################################################################

const Array = Core.Array
const Vector{T} = Core.Array{T, 1}
const Matrix{T} = Core.Array{T, 2}

length(a::Array{T, N}) where {T, N} = Core.Intrinsics.arraylen(a)

################################################################################

function two_sum(a::T, b::T) where {T}
    sum = a ⊕ b
    b_prime = sum ⊖ a
    a_prime = sum ⊖ b_prime
    a_err = a ⊖ a_prime
    b_err = b ⊖ b_prime
    return (sum, a_err ⊕ b_err)
end

function two_diff(a::T, b::T) where {T}
    diff = a ⊖ b
    b_prime = a ⊖ diff
    a_prime = diff ⊕ b_prime
    a_err = a ⊖ a_prime
    b_err = b ⊖ b_prime
    return (sum, a_err ⊖ b_err)
end

function two_prod(a::T, b::T) where {T}
    p = a * b
    p, Core.Intrinsics.fma_float(a, b, -p)
end

end # baremodule DZBase
