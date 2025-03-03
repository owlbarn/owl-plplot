open Owl
open Owl_plplot

let _ = 
  let f x = Maths.sin x /. x in
  let h = Plot.create "plot_001.png" in

  Plot.set_title h "Function: f(x) = sine x / x";
  Plot.set_xlabel h "x-axis";
  Plot.set_ylabel h "y-axis";
  Plot.set_font_size h 8.;
  Plot.set_pen_size h 3.;
  Plot.plot_fun ~h f 1. 15.;

  Plot.output h


let _ = 
  let x = Mat.logspace (-1.5) 2. 50 in
  let y = Mat.map Maths.exp x in
  let h = Plot.create ~m:2 ~n:2 "plot_013.png" in

  Plot.subplot h 0 0;
  Plot.set_xlabel h "Input Data X";
  Plot.set_ylabel h "Input Data Y";
  Plot.(loglog ~h ~spec:[ RGB (0,255,0); LineStyle 2; Marker "+" ] ~x:x y);

  Plot.subplot h 0 1;
  Plot.set_xlabel h "Index of Input Data Y";
  Plot.set_ylabel h "Input Data Y";
  Plot.(loglog ~h ~spec:[ RGB (0,0,255); LineStyle 1; Marker "*" ] y);

  Plot.subplot h 1 0;
  Plot.set_xlabel h "Input Data X";
  Plot.set_ylabel h "Input Data Y";
  Plot.semilogx ~h ~x:x y;

  Plot.subplot h 1 1;
  Plot.set_xlabel h "Index of Input Data Y";
  Plot.set_ylabel h "Input Data Y";
  Plot.semilogy ~h y;

  Plot.output h