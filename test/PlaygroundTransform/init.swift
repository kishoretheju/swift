// RUN: rm -rf %t
// RUN: mkdir %t
// RUN: cp %s %t/main.swift
// RUN: %target-build-swift -Xfrontend -playground -Xfrontend -debugger-support -o %t/main %S/Inputs/PlaygroundsRuntime.swift %t/main.swift
// RUN: %target-run %t/main | FileCheck %s
class B {
  init() {
  }
}

class C : B {
  var i : Int
  var j : Int
  override init() {
    i = 3
    j = 5
    i + j
  }
}
let c = C()
// CHECK: [{{.*}}] $builtin_log_scope_entry
// CHECK-NEXT: [{{.*}}] $builtin_log[='8']
// CHECK-NEXT: [{{.*}}] $builtin_log_scope_exit
// CHECK-NEXT: [{{.*}}] $builtin_log_scope_entry
// CHECK-NEXT: [{{.*}}] $builtin_log_scope_exit
// CHECK-NEXT: [{{.*}}] $builtin_log[c='main.C']
