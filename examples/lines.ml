open Owl
open Owl_plplot

let _  = 
  let h = Plot.create "plot_024.png" in
  Plot.(plot_fun ~h ~spec:[ RGB (0,0,255); Marker "#[0x2299]"; MarkerSize 8. ] Maths.sin 0. 9.);
  Plot.(plot_fun ~h ~spec:[ RGB (255,0,0); Marker "#[0x0394]"; MarkerSize 8. ] Maths.cos 0. 9.);
  Plot.legend_on h [|"Sine function"; "Cosine function"|];
  Plot.output h


let _ = 
  let g x = (Stats.gaussian_pdf x ~mu:0. ~sigma:1.) *. 100. in
  let y = Mat.gaussian ~mu:0. ~sigma:1. 1 1000 in

  (* plot multiple data sets *)
  let h = Plot.create "plot_025.png" in
  Plot.set_background_color h 255 255 255;
  Plot.(histogram ~h ~spec:[ RGB (255,0,50) ] ~bin:100 y);
  Plot.(plot_fun ~h ~spec:[ RGB (0,0,255); LineWidth 2. ] g (-4.) 4.);
  Plot.legend_on h [|"data"; "model"|];

  Plot.output h


let _ = 
  let x = Mat.(uniform 1 20 *$ 10.) in
  let y = Mat.(uniform 1 20) in
  let z = Mat.gaussian 1 20 in

  (* plot multiple data sets *)
  let h = Plot.create "plot_026.png" in
  Plot.(plot_fun ~h ~spec:[ RGB (0,0,255); LineStyle 1; Marker "*" ] Maths.sin 1. 8.);
  Plot.(plot_fun ~h ~spec:[ RGB (0,255,0); LineStyle 2; Marker "+" ] Maths.cos 1. 8.);
  Plot.scatter ~h x y;
  Plot.stem ~h x z;

  let u = Mat.(abs(gaussian 1 10 *$ 0.3)) in
  Plot.(bar ~h ~spec:[ RGB (255,255,0); FillPattern 3 ] u);

  let v = Mat.(neg u *$ 0.3) in
  let u = Mat.sequential 1 10 in
  Plot.(area ~h ~spec:[ RGB (0,255,0); FillPattern 4 ] u v);

  (* set up legend *)
  Plot.(legend_on h ~position:NorthEast [|"test 1"; "test 2"; "scatter"; "stem"; "bar"; "area"|]);
  Plot.output h


let _ = 
  let h = Plot.create "plot_004.png" in
  Plot.set_background_color h 255 255 255;
  Plot.set_pen_size h 2.;
  Plot.(draw_line ~h ~spec:[ LineStyle 1 ] 1. 1. 9. 1.);
  Plot.(draw_line ~h ~spec:[ LineStyle 2 ] 1. 2. 9. 2.);
  Plot.(draw_line ~h ~spec:[ LineStyle 3 ] 1. 3. 9. 3.);
  Plot.(draw_line ~h ~spec:[ LineStyle 4 ] 1. 4. 9. 4.);
  Plot.(draw_line ~h ~spec:[ LineStyle 5 ] 1. 5. 9. 5.);
  Plot.(draw_line ~h ~spec:[ LineStyle 6 ] 1. 6. 9. 6.);
  Plot.(draw_line ~h ~spec:[ LineStyle 7 ] 1. 7. 9. 7.);
  Plot.(draw_line ~h ~spec:[ LineStyle 8 ] 1. 8. 9. 8.);
  Plot.set_xrange h 0. 10.;
  Plot.set_yrange h 0. 9.;
  Plot.output h


let _ = 
  let h = Plot.create "plot_005.png" in

  Array.init 9 (fun i ->
    let x0, y0 = 0.5, float_of_int i +. 1.0 in
    let x1, y1 = 4.5, float_of_int i +. 0.5 in
    Plot.(draw_rect ~h ~spec:[ FillPattern i ] x0 y0 x1 y1);
    Plot.(text ~h ~spec:[ RGB (0,255,0) ] 2.3 (y0-.0.2) ("pattern: " ^ (string_of_int i)))
  ) |> ignore;

  Plot.output h


let _ = 
  let x = Mat.linspace 0. 2. 100 in
  let y0 = Mat.sigmoid x in
  let y1 = Mat.map Maths.sin x in
  let h = Plot.create "plot_022.png" in
  Plot.(plot ~h ~spec:[ RGB (255,0,0); LineStyle 1; Marker "#[0x2299]"; MarkerSize 8. ] x y0);
  Plot.(plot ~h ~spec:[ RGB (0,255,0); LineStyle 2; Marker "#[0x0394]"; MarkerSize 8. ] x y1);
  Plot.(legend_on h ~position:SouthEast [|"sigmoid"; "sine"|]);
  Plot.output h


let _ =
  let x = Mat.linspace 0. 6.5 20 in
  let y = Mat.map Maths.sin x in
  let h = Plot.create ~m:1 ~n:2 "plot_007.png" in
  Plot.set_background_color h 255 255 255;
  Plot.subplot h 0 0;
  Plot.plot_fun ~h Maths.sin 0. 6.5;
  Plot.(stairs ~h ~spec:[ RGB (0,128,255) ] x y);
  Plot.subplot h 0 1;
  Plot.(plot ~h ~spec:[ RGB (0,0,0) ] x y);
  Plot.(stairs ~h ~spec:[ RGB (0,128,255) ] x y);
  Plot.output h


let _ = 
  let x = Mat.linspace 0. 8. 100 in
  let y = Mat.map Maths.atan x in
  let h = Plot.create ~m:1 ~n:2 "plot_011.png" in
  Plot.subplot h 0 0;
  Plot.(area ~h ~spec:[ FillPattern 1 ] x y);
  let x = Mat.linspace 0. (2. *. 3.1416) 100 in
  let y = Mat.map Maths.sin x in
  Plot.subplot h 0 1;
  Plot.(area ~h ~spec:[ FillPattern 2 ] x y);
  Plot.output h