; ModuleID = "fibonacci"
target triple = "arm64-apple-darwin25.5.0"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"

declare i32 @"printf"(i8* %".1", ...)

define i32 @"fibonacci"(i32 %"n")
{
entry:
  %"n.1" = alloca i32
  store i32 %"n", i32* %"n.1"
  %"a" = alloca i32
  %"b" = alloca i32
  %"c" = alloca i32
  %"i" = alloca i32
  store i32 0, i32* %"a"
  store i32 1, i32* %"b"
  store i32 2, i32* %"i"
  %"n.2" = load i32, i32* %"n.1"
  %".7" = icmp eq i32 %"n.2", 0
  br i1 %".7", label %"if-true", label %"if-false"
if-true:
  %"a.1" = load i32, i32* %"a"
  ret i32 %"a.1"
if-false:
  br label %"if-merge"
if-merge:
  br label %"while-head"
while-head:
  %"i.1" = load i32, i32* %"i"
  %"n.3" = load i32, i32* %"n.1"
  %".12" = icmp sle i32 %"i.1", %"n.3"
  br i1 %".12", label %"while-body", label %"while-exit"
while-body:
  %"a.2" = load i32, i32* %"a"
  %"b.1" = load i32, i32* %"b"
  %".14" = add i32 %"a.2", %"b.1"
  store i32 %".14", i32* %"c"
  %"b.2" = load i32, i32* %"b"
  store i32 %"b.2", i32* %"a"
  %"c.1" = load i32, i32* %"c"
  store i32 %"c.1", i32* %"b"
  %"i.2" = load i32, i32* %"i"
  %".18" = add i32 %"i.2", 1
  store i32 %".18", i32* %"i"
  br label %"while-head"
while-exit:
  %"b.3" = load i32, i32* %"b"
  ret i32 %"b.3"
}

define i32 @"main"()
{
entry:
  %"posicion" = alloca i32
  %"res" = alloca i32
  store i32 7, i32* %"posicion"
  %"posicion.1" = load i32, i32* %"posicion"
  %".3" = call i32 @"fibonacci"(i32 %"posicion.1")
  store i32 %".3", i32* %"res"
  %".5" = bitcast [49 x i8]* @"str_3" to i8*
  %"res.1" = load i32, i32* %"res"
  %".6" = call i32 (i8*, ...) @"printf"(i8* %".5", i32 %"res.1")
  ret i32 0
}

@"str_3" = internal constant [49 x i8] c"El numero de Fibonacci en la posicion 7 es: %d\5cn\00"