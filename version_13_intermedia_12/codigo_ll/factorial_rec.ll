; ModuleID = "factorial_rec"
target triple = "arm64-apple-darwin25.5.0"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"

declare i32 @"printf"(i8* %".1", ...)

define i32 @"factorial_rec"(i32 %"n")
{
entry:
  %"n.1" = alloca i32
  store i32 %"n", i32* %"n.1"
  %"n.2" = load i32, i32* %"n.1"
  %".4" = icmp sle i32 %"n.2", 1
  br i1 %".4", label %"if-true", label %"if-false"
if-true:
  ret i32 1
if-false:
  br label %"if-merge"
if-merge:
  %"n.3" = load i32, i32* %"n.1"
  %"n.4" = load i32, i32* %"n.1"
  %".8" = sub i32 %"n.4", 1
  %".9" = call i32 @"factorial_rec"(i32 %".8")
  %".10" = mul i32 %"n.3", %".9"
  ret i32 %".10"
}

define i32 @"main"()
{
entry:
  %"resultado" = alloca i32
  %".2" = call i32 @"factorial_rec"(i32 5)
  store i32 %".2", i32* %"resultado"
  %".4" = bitcast [34 x i8]* @"str_3" to i8*
  %"resultado.1" = load i32, i32* %"resultado"
  %".5" = call i32 (i8*, ...) @"printf"(i8* %".4", i32 %"resultado.1")
  ret i32 0
}

@"str_3" = internal constant [34 x i8] c"Factorial recursivo de 5 es: %d\5cn\00"