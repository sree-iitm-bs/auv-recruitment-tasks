## Task 1

### Question 2

edge detection essential for computer vision  
used  for oblect detection video compression etc  
countour detection detects only the boundaries of the object  
edge detection higlights the change in pixel intensity of an image  

edge detection 2 types  
we dont need color info to detect the edges so we can cnvert it to grayscale  
blur the gray scale to smooth the pixel intensity variation and to reduce noise  

kernels can basically be thought of as a filter , there can be many types of kernels for specific operations  
kernels here are 2d arrays as images are represented as 2d arrays we can go to frequency domain to see the function of kernels more clearly a very basic kernel can act as a band pass filter  
there are gaussian kernels and laplacian kernels who details ill leave out from explaining  

1) canny-uses a gaussian kernel similar to sobel calculates gradient of image intensity but this method thins out the edges(non maximum supression) gradient operator gives max min  
it uses two threshold values to determine which edges are strong to be considered edges  
gives better result when we use gaussian blur  

2) sobel-calculates gradient of image intensity emphasises edges in horizontal or vertical(dx=0, dy=0)  
computes the gradient(del operator) which gives info about intensity variation  
then uses 2 kernels one for detection in horizontal and the other in vertical axis  

learnt that we can use cv.videocapture() by indexing the cams when run on the auv  

ros timestamp is composed of two parts: seconds (secs) and nanoseconds (nsecs).  
secs gives you the number of whole seconds since the epoch (January 1, 1970).  
nsecs gives the number of nanoseconds within the current second.
