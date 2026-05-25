; ModuleID = "prueba_for"
target triple = "arm64-apple-darwin25.5.0"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"

declare i32 @"printf"(i8* %".1", ...)

define i32 @"main"()
{
entry:
  %"x" = alloca i32
  %"y" = alloca i32
  store i32 0, i32* %"x"
  store i32 10, i32* %"y"
  store i32 1, i32* %"x"
  br label %"for-head"
for-head:
  %"x.1" = load i32, i32* %"x"
  %".6" = icmp slt i32 %"x.1", 5
  br i1 %".6", label %"for-body", label %"for-exit"
for-body:
  %"y.1" = load i32, i32* %"y"
  %".8" = mul i32 %"y.1", 2
  store i32 %".8", i32* %"y"
  br label %"for-incr"
for-incr:
  %"x.2" = load i32, i32* %"x"
  %".11" = add i32 %"x.2", 1
  store i32 %".11", i32* %"x"
  br label %"for-head"
for-exit:
  %".14" = bitcast [40 x i8]* @"str_2" to i8*
  %"y.2" = load i32, i32* %"y"
  %".15" = call i32 (i8*, ...) @"printf"(i8* %".14", i32 %"y.2")
  ret i32 0
}

@"str_2" = internal constant [40 x i8] c"Resultado final del ciclo FOR (y): %d\5cn\00"