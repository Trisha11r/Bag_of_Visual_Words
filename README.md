# Logo Spotting using Bag of Visual Words Model

Implementation of basic ‘bag of visual words’ model using two different approaches for feature descriptor extraction(SIFT Algorithm and  Shape Context Matching) to identify and match company logos on scanned documents.

## Bag of Visual Words

- Used in image classification
- adopted from NLP's Bag of words concept, where we count the number of times each word appears in a document and use this frequency to know keywords of the document and make a frequency histogram from it. The document is treated as a bag of words.
- For BoVW, instead of words we use the features of the image. Image features are unique patterns that we can find in an image.
- Image -> set of features -> consists of keypoints and descriptors. Keypoints and descriptors are used to construct vocabularies and represent each image as a frequency histoogram of features that are in the image. Frequency hitograms are the bag of visual words (BoVW).
    
      Keypoints: standout points in an image, no matter whether the img rotated/shrunk/exapnded, keypoints will always be same
      Descriptors: description of the keypoints

## SIFT (Scale Invariant Feature Transform)

- Invariant to scale, rotation, illummination and viewpoint of image.
- Steps
  - Constructing a scale space
  
        generate seven octaves of original image, each octave's image size is half the previous one
        within an octave images arew progressively blurred using Gaussian Blur
        
- LoG approximation (Laplace of Gaussian): used to blur images using Gaussian Blur
- Finding the keypoints
  
      maxima and minima of DoG image by comparing neighbourhood pixels in current scale, scale above and scale below

- Get rid of bad keypoints

      edges and low contrast regions use technique similar to Harris Corner Detector

- Assign orientation to the keypoints to achieve rotation invariance. Assign orientation to each keypoint and do all calculations relative to that.
- Generate sift features to uniquely identify features
        
## Shape Matching using Shape Context

- Shape context is the feature descriptor used in object recognition
- take points from contours of shape
- translational invariance possible, complete rotational and scaling invariance also possible after modifications

- Steps:
    - Solve for correspondences between points on the 2 shapes (using shape contexts)

          compute marching costs using Chi-squared distance, minimize total cost of matching such that matching is one to one
    - Use correspondences to estimate an aligning transform, using regularized thin plate splines

          thin plate spline: physical analogy involving bending sheet of metal
          thin plate spline interpolation: minimize bend energy
    - Compute distance between 2 shapes
