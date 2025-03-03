open Owl
open Owl_plplot

let _ = 
  let x = Mat.linspace 0.5 2.5 25 in
  let y = Mat.map (Stats.exponential_pdf ~lambda:0.1) x in
  let h = Plot.create ~m:1 ~n:2 "plot_009.png" in
  Plot.set_background_color h 255 255 255;
  Plot.subplot h 0 0;
  Plot.set_foreground_color h 0 0 0;
  Plot.stem ~h x y;
  Plot.subplot h 0 1;
  Plot.(stem ~h ~spec:[ Marker "#[0x2295]"; MarkerSize 5.; LineStyle 1 ] x y);
  Plot.output h


let _ = 
  let x = Mat.linspace 0. 8. 30 in
  let y0 = Mat.map Maths.sin x in
  let y1 = Mat.uniform 1 30 in
  let h = Plot.create ~m:1 ~n:2 "plot_010.png" in
  Plot.subplot h 0 0;
  Plot.set_title h "Sine";
  Plot.autocorr ~h y0;
  Plot.subplot h 0 1;
  Plot.set_title h "Gaussian";
  Plot.autocorr ~h y1;
  Plot.output h