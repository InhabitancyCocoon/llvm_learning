Read function definition:define double @fibi(double %x) {
entry:
  br label %loop

loop:                                             ; preds = %loop, %entry
  %a.0 = phi double [ 1.000000e+00, %entry ], [ %b.0, %loop ]
  %b.0 = phi double [ 1.000000e+00, %entry ], [ %addtmp, %loop ]
  %i.0 = phi double [ 3.000000e+00, %entry ], [ %nextvar, %loop ]
  %addtmp = fadd double %a.0, %b.0
  %binop = call double @"binary:"(double %addtmp, double %b.0)
  %binop6 = call double @"binary:"(double %binop, double %addtmp)
  %cmptmp = fcmp ult double %i.0, %x
  %nextvar = fadd double %i.0, 1.000000e+00
  br i1 %cmptmp, label %loop, label %afterloop

afterloop:                                        ; preds = %loop
  %binop11 = call double @"binary:"(double 0.000000e+00, double %addtmp)
  ret double %binop11
}