open Owl
open Owl_plplot

let _ = 
  let y1 = Mat.uniform 1 10 in
  let y2 = Mat.uniform 10 100 in
  let h = Plot.create ~m:1 ~n:2 "plot_008.png" in
  Plot.subplot h 0 0;
  Plot.(bar ~h ~spec:[ RGB (0,153,51); FillPattern 3 ] y1);
  Plot.subplot h 0 1;
  Plot.(boxplot ~h ~spec:[ RGB (0,153,51) ] y2);
  Plot.output h


let _ = 
  let x = Mat.gaussian 200 1 in
  let h = Plot.create ~m:1 ~n:2 "plot_012.png" in
  Plot.subplot h 0 0;
  Plot.set_title h "histogram";
  Plot.histogram ~h ~bin:25 x;
  Plot.subplot h 0 1;
  Plot.set_title h "empirical cdf";
  Plot.ecdf ~h x;
  Plot.output h