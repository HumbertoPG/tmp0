; ModuleID = "prueba_dowhile"
target triple = "arm64-apple-darwin25.5.0"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"

declare i32 @"printf"(i8* %".1", ...)

define i32 @"main"()
{
entry:
  %"contador" = alloca i32
  %"suma" = alloca i32
  store i32 1, i32* %"contador"
  store i32 0, i32* %"suma"
  br label %"do-body"
do-body:
  %"suma.1" = load i32, i32* %"suma"
  %"contador.1" = load i32, i32* %"contador"
  %".5" = add i32 %"suma.1", %"contador.1"
  store i32 %".5", i32* %"suma"
  %"contador.2" = load i32, i32* %"contador"
  %".7" = add i32 %"contador.2", 1
  store i32 %".7", i32* %"contador"
  br label %"do-head"
do-head:
  %"contador.3" = load i32, i32* %"contador"
  %".10" = icmp sle i32 %"contador.3", 3
  br i1 %".10", label %"do-body", label %"do-exit"
do-exit:
  %".12" = bitcast [41 x i8]* @"str_2" to i8*
  %"suma.2" = load i32, i32* %"suma"
  %".13" = call i32 (i8*, ...) @"printf"(i8* %".12", i32 %"suma.2")
  ret i32 0
}

@"str_2" = internal constant [41 x i8] c"Resultado final de DO/WHILE (suma): %d\5cn\00"