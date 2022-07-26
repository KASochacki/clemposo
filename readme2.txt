lmmalignapp.mlapp (run with no input arguments)

1) A dialogue pops up to ask for the EM map file. choose this file. It should be a tif format. 

2) A dialogue pops up to ask for the fluorescence map file. This should also be a tif format. It can be grayscale 16 bit, 8 bit or rgb. I personally like to use an rgb file that shows all my channels. This is the most useful for good correlation. Please note that once you fine a good correlation, you will later be able to perform the same transformation on other files in bulk so you don't have to worry about this image being the image that you need for your final product. It should be the image that helps you correlate the best. 

3) Press the "rotate 90" button to rotate the fluorescence image 90 degrees CCW at a time so that it is aligned with your EM image a bit better. This button is a bit slow so each rotation may take a few seconds if you have a large file. 

4) Zoom in or out or pan on each image using the panel that pops up in the right corner of each image. 

5) Look for landmarks that are visible in both the EM and fluorescence image. You should use five or more landmarks. It won't work at all if you use fewer than 3 but more is better. Also, it is better if they are spread out a bit. I frequently just use the grid squares as landmarks. If I can see the center of the grid, I pick a bunch of grid square corners that I can recognize in the two cases.  

6) Press "EM pick". This will allow you to pick several positions on the EM image that will serve as correlation landmarks between the EM and fluorescence image. When you get to the last point that you would like to select, double click to end your selection. 

7) Press "Fluor pick". Pick the same positions in the fluorescence image and again double click on your last selection. You must pick the same number of positions as was used in "EM pick".

8) If you are not happy with your selections, you can press "reset picks" and try again. 

9) If you are happy with your selections, you press "submit". After a few seconds, the transformed image overlay will show up on the right axes. If the correlation is not even close, you may want to press "reset picks" and try again. 

10) You now need to refine your correlation. Zoom in on your newly correlated overlay (using the tools that pop up on the upper right of the image). Go throughout your image correct the correlation by clicking "new gold" and clicking and dragging on the map from a landmark you see in the fluorescence to the same landmark that you see in the EM. Do this many times all over the map. This refinement is not using any of the information from your first image transformation so you will need to do this at least three times again but I suggest you do it 9-10 times all over your map. 

11) Click "test" to use those landmarks to do an affine image transformation to your fluorescence image to get your images aligned. Your X and Y residuals for each fiducial will show up in column 1 and column 2 respectively. You may want to use these numbers to get rid of specific fiducials. Next to the "remove" button, the edit field will automatically fill with the number of the fiducial with the worst reisduals. You can also enter a number of your choosing there. If you press "remove", this fiducial will be removed from your fit and the transformation will be performed again. 

12) You can still add more "new gold" after you have pressed "test" to improve the transformation more and more to get a closer fit. Please note that the image transformation being performed is always being calculated from the original image so you are not creating an increasingly more interpolated image, the more that you test different transformations. 

13) When you are happy with the transformation, click "transform". This will save the fluorescence file in a new file (in the same folder you got the image files from) that has a "_TT" appended to the filename. 

14) If you would like to transform other related image files using the same image transform, click "transform other". A dialogue will pop up asking you to pick all of the files that you would like the program to transform. I use this to transform all of the channels separately. I have designed the program this way so that an unlimited number of channels can be correlated. 

15) If you would like to pick grid squares to make higher magnification maps in SerialEM, you can continue. If you just wanted to get your maps correlated, you can finish here. Your correlated images are saved.

16) Click "pick MMM ROI", then click on the middle of a grid square that you would like to map. Do this on as many grid squares as you would like. You can remove these points if you make a mistake with the "MMMremove" button. It will remove whichever ROI is typed into the editable region next to it. 

17) When you are happy with your regions, and would like to create a Navigator file, Click "create MMM Nav". This will ask you for your existing Navigator file. So, it requires the Navigator file that you used when you acquired the grid map. Whatever grid map you used, it should be listed first in your Navigator file. The new Navigator file will just include the first "map" entry with the additional items that you just chose. When you import it into SerialEM, you can merge it with whatever Navigator file you are currently using. 

18) Frequently, my original map was created on a screening microscope and my new map looks slightly different on the new microscope. If you have made a new map on a different microscope, you will need to do a map transformation to get the coordinates from the two maps to align. Since I specifically was trying to avoid correlating many higher magnification maps at this stage (while using precious microscope time), I usually try to fix alignment to a higher precision prior to getting on the tomography scope. To do this, I click "adj. alignment of squares". This opens the next program (roishiftapp.mlapp). 

roishiftapp.mlapp

1) when you click on "adj. alignment of squares" in lmmalignapp, roishiftapp.mlapp opens and shows ROI #1.
You probably want to bring the minumum fluorescence value up pretty high here so that you can just see your bright fiducials in the fluorescence and you can clearly see the dark grey spots in the EM that they will need to align to. Here, we usually use 500 nm plastic fluospheres. There are usually at least 10-20 in each grid square so that you don't need to be able to see all of them to align. The magnification and rotation are generally all set from the previous steps so in this program we are just going to quickly translate the fluorescence image to get it to align more precisely with the EM in that specific ROI.  

2) click "define shift" and click and drag the mouse from the fluorescence marker to the EM marker. The image should very quickly shift to align. You can do this many times if you don't get it exactly right the first time. The total X and Y shift that you performed will show up in column 1 and 2 respectively in the table. 

3) Once you have finished the first ROI, you can click "go to" to go to the next ROI and do the same thing. 

4) Once you have found the shift for all of the ROIs, click "export". This will save all of the cropped images (EM and fluorescence) with the alignment adjusted in the way that you chose. It will also ask if you would like to crop and translate other files. Here, you probably want to crop any of the additional channel files that you transformed in lmmalignapp. 

Future: A final program will allow these images to automatically map to your higher resolution grid square maps. At this point, you can pick the exact locations for your tomograms and create a new SerialEM navigator file for importing into your SerialEM imaging session. 