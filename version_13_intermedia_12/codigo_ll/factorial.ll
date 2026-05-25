; ModuleID = "factorial"
target triple = "arm64-apple-darwin25.5.0"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"

declare i32 @"printf"(i8* %".1", ...)

define i32 @"factorial"(i32 %"n")
{
entry:
  %"n.1" = alloca i32
  store i32 %"n", i32* %"n.1"
  %"f" = alloca i32
  %"i" = alloca i32
  store i32 1, i32* %"f"
  store i32 1, i32* %"i"
  br label %"while-head"
while-head:
  %"i.1" = load i32, i32* %"i"
  %"n.2" = load i32, i32* %"n.1"
  %".7" = icmp sle i32 %"i.1", %"n.2"
  br i1 %".7", label %"while-body", label %"while-exit"
while-body:
  %"f.1" = load i32, i32* %"f"
  %"i.2" = load i32, i32* %"i"
  %".9" = mul i32 %"f.1", %"i.2"
  store i32 %".9", i32* %"f"
  %"i.3" = load i32, i32* %"i"
  %".11" = add i32 %"i.3", 1
  store i32 %".11", i32* %"i"
  br label %"while-head"
while-exit:
  %"f.2" = load i32, i32* %"f"
  ret i32 %"f.2"
}

define i32 @"main"()
{
entry:
  %"num" = alloca i32
  %"result" = alloca i32
  store i32 5, i32* %"num"
  %"num.1" = load i32, i32* %"num"
  %".3" = call i32 @"factorial"(i32 %"num.1")
  store i32 %".3", i32* %"result"
  %".5" = bitcast [27 x i8]* @"str_3" to i8*
  %"result.1" = load i32, i32* %"result"
  %".6" = call i32 (i8*, ...) @"printf"(i8* %".5", i32 %"result.1")
  ret i32 0
}

@"str_3" = internal constant [27 x i8] c"El factorial de 5 es: %d\5cn\00"