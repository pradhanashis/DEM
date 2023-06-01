#STEPS to execute and visualize DEM of sample input image "7_Reconnection.png" 

1. Program to plot DEM of sample processed image named "7_Reconnection.png"  available at "DEM/Final Op/7", execute "DEM1.m" available at "DEM/Final Op/". 

2. All additional extra line has been removed manually and are available at directory "postprocessing" available at "DEM/Final Op"

3. This sample input image is a processed image after interpolating contour lines, noise removal. The feature present is a superimposition of interpolated points over input image named "org.png" available at "DEM/Final Op/7".

4. The following are the series of program executed to extract, refine to obtain the desired input to "DEM1.m" for creating a DEM of sample input.

	a) The "Updated_One_Raster.m" program extract all significant pixels and stores in "plot_data1.xlsx", for further plotting the same in 3D space.

	b) The "ashis_thin_v1.m" program implements thinning algorithm to thin the image to generate singly connected set of pixels.

	c) The "m_connectivity_v1.m" program ensure m-connectivity by removing common pixels.
	
	d) The "spiral.m" program implements efficient contour tracing rather than tradtional raster scan method.

5. The detailed output and corresponding program for various samples for Interpolation of contours and lines are available at "DEM\interpolated pts\Final Interpolation"

6. The detailed output and corresponding program for super-imposing original inputs and corresponding Interpolated points are available at "DEM\interpolated pts\Final Interpolation\SuperImpose".

7. The detailed output and corresponding program for extraction of various morphological operators (unsupervised method) for traversal is available  "\DEM\mor_op_direction".






