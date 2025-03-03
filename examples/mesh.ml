open Owl
open Owl_plplot

let x, y = Mat.meshgrid (-2.5) 2.5 (-2.5) 2.5 50 50
let z = Mat.(sin ((x * x) + (y * y)))
let h = Plot.create ~m:2 ~n:3 "plot_020.png"

let _ = 
Plot.subplot h 0 0;
Plot.(mesh ~h ~spec:[ ZLine XY ] x y z);

Plot.subplot h 0 1;
Plot.(mesh ~h ~spec:[ ZLine X ] x y z);

Plot.subplot h 0 2;
Plot.(mesh ~h ~spec:[ ZLine Y ] x y z);

Plot.subplot h 1 0;
Plot.(mesh ~h ~spec:[ ZLine Y; NoMagColor ] x y z);

Plot.subplot h 1 1;
Plot.(mesh ~h ~spec:[ ZLine Y; Contour ] x y z);

Plot.subplot h 1 2;
Plot.(mesh ~h ~spec:[ ZLine XY; Curtain ] x y z);

Plot.output h


let _ = 
  let x, y = Mat.meshgrid (-3.) 3. (-3.) 3. 50 50 in
  let z = Mat.(
    3. $* ((1. $- x) **$ 2.) * exp (neg (x **$ 2.) - ((y +$ 1.) **$ 2.)) -
    (10. $* (x /$ 5. - (x **$ 3.) - (y **$ 5.)) * (exp (neg (x **$ 2.) - (y **$ 2.)))) -
    ((1./.3.) $* exp (neg ((x +$ 1.) **$ 2.) - (y **$ 2.)))
    )
  in

  let h = Plot.create ~m:2 ~n:3 "plot_016.png" in
  Plot.subplot h 0 0;
  Plot.surf ~h x y z;
  Plot.subplot h 0 1;
  Plot.mesh ~h x y z;
  Plot.subplot h 0 2;
  Plot.(surf ~h ~spec:[ Contour ] x y z);
  Plot.subplot h 1 0;
  Plot.(mesh ~h ~spec:[ Contour; Azimuth 115.; NoMagColor ] x y z);
  Plot.subplot h 1 1;
  Plot.(mesh ~h ~spec:[ Azimuth 115.; ZLine X; NoMagColor; RGB (61,129,255) ] x y z);
  Plot.subplot h 1 2;
  Plot.(mesh ~h ~spec:[ Azimuth 115.; ZLine Y; NoMagColor; RGB (130,255,40) ] x y z);
  Plot.output h


let _ = 
  let x, y = Mat.meshgrid (-3.) 3. (-3.) 3. 100 100 in
  let z = Mat.(
    3. $* ((1. $- x) **$ 2.) * exp (neg (x **$ 2.) - ((y +$ 1.) **$ 2.)) -
    (10. $* (x /$ 5. - (x **$ 3.) - (y **$ 5.)) * (exp (neg (x **$ 2.) - (y **$ 2.)))) -
    ((1./.3.) $* exp (neg ((x +$ 1.) **$ 2.) - (y **$ 2.)))
    )
  in

  let h = Plot.create ~m:2 ~n:2 "plot_017.png" in
  Plot.subplot h 0 0;
  Plot.(mesh ~h ~spec:[ Contour ] x y z);
  Plot.subplot h 0 1;
  Plot.heatmap ~h x y z;
  Plot.subplot h 1 0;
  Plot.mesh ~h x y z;
  Plot.subplot h 1 1;
  Plot.contour ~h x y z;
  Plot.output h
