# SSHS-Matlab
 Matlab implementation of the Scale-Space Histogram Segmentation algorithm as described in 
 J.Gilles, K.Heal, "A parameterless scale-space approach to find meaningful modes in histograms - 
 Application to image and spectrum segmentation". International Journal of Wavelets, 
 Multiresolution and Information Processing, Vol.12, No.6, 1450044-1--1450044-17, December 2014.

 Note this implementation is an updated version of the code that was used to generate the experiments
 in the article. In particular, a discrete version of the Gaussian kernel is now used, and sparse 
 matrices are used to store the scale-space domain to save a lot of memory use (hence allowing to
 manipulate very long histograms).

 See the script Test1D.m to see how to use the functions.
