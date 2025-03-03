open Owl
open Owl_plplot

let _ = 
  let x, y = Mat.meshgrid (-1.) 1. (-1.) 1. 50 50 in
  let z = Mat.(tanh ((x * x) + (y * y))) in
  let h = Plot.create ~m:2 ~n:3 "plot_021.png" in

  Plot.subplot h 0 0;
  Plot.(surf ~h ~spec:[ ] x y z);

  Plot.subplot h 0 1;
  Plot.(surf ~h ~spec:[ Faceted ] x y z);

  Plot.subplot h 0 2;
  Plot.(surf ~h ~spec:[ NoMagColor ] x y z);

  Plot.subplot h 1 0;
  Plot.(surf ~h ~spec:[ Contour ] x y z);

  Plot.subplot h 1 1;
  Plot.(surf ~h ~spec:[ Curtain ] x y z);

  Plot.subplot h 1 2;
  Plot.(surf ~h ~spec:[ Altitude 10.; Azimuth 125. ] x y z);

  Plot.output h