; ModuleID = "prueba_switch"
target triple = "arm64-apple-darwin25.5.0"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"

declare i32 @"printf"(i8* %".1", ...)

define i32 @"main"()
{
entry:
  %"selector" = alloca i32
  %"resultado" = alloca i32
  store i32 2, i32* %"selector"
  store i32 0, i32* %"resultado"
  %"selector.1" = load i32, i32* %"selector"
  switch i32 %"selector.1", label %"switch-default" [i32 1, label %"case-1" i32 2, label %"case-2"]
switch-exit:
  %".11" = bitcast [33 x i8]* @"str_2" to i8*
  %"resultado.1" = load i32, i32* %"resultado"
  %".12" = call i32 (i8*, ...) @"printf"(i8* %".11", i32 %"resultado.1")
  ret i32 0
switch-default:
  store i32 999, i32* %"resultado"
  br label %"switch-exit"
case-1:
  store i32 100, i32* %"resultado"
  br label %"switch-exit"
case-2:
  store i32 200, i32* %"resultado"
  br label %"switch-exit"
}

@"str_2" = internal constant [33 x i8] c"Resultado final del SWITCH: %d\5cn\00"