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