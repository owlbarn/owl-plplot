open Owl
open Owl_plplot

let _ = 
  let x = Mat.uniform 1 30 in
  let y = Mat.uniform 1 30 in
  let h = Plot.create ~m:3 ~n:3 "plot_006.png" in
  Plot.set_background_color h 255 255 255;
  Plot.subplot h 0 0;
  Plot.(scatter ~h ~spec:[ Marker "#[0x2295]"; MarkerSize 5. ] x y);
  Plot.subplot h 0 1;
  Plot.(scatter ~h ~spec:[ Marker "#[0x229a]"; MarkerSize 5. ] x y);
  Plot.subplot h 0 2;
  Plot.(scatter ~h ~spec:[ Marker "#[0x2206]"; MarkerSize 5. ] x y);
  Plot.subplot h 1 0;
  Plot.(scatter ~h ~spec:[ Marker "#[0x229e]"; MarkerSize 5. ] x y);
  Plot.subplot h 1 1;
  Plot.(scatter ~h ~spec:[ Marker "#[0x2217]"; MarkerSize 5. ] x y);
  Plot.subplot h 1 2;
  Plot.(scatter ~h ~spec:[ Marker "#[0x2296]"; MarkerSize 5. ] x y);
  Plot.subplot h 2 0;
  Plot.(scatter ~h ~spec:[ Marker "#[0x2666]"; MarkerSize 5. ] x y);
  Plot.subplot h 2 1;
  Plot.(scatter ~h ~spec:[ Marker "#[0x22a1]"; MarkerSize 5. ] x y);
  Plot.subplot h 2 2;
  Plot.(scatter ~h ~spec:[ Marker "#[0x22b9]"; MarkerSize 5. ] x y);
  Plot.output h