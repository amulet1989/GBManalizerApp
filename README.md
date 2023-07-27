# GBManalizerApp
Glioblastoma multiforme (GBM) is an aggressive brain tumor with a poor prognosis and high recurrence rate. GBManalizer (*Figure 1*), a Windows application, is introduced to automatically segment GBM and its components in magnetic resonance imaging (MRI) images. It utilizes preprocessing techniques and a neural network to achieve 83.9% accuracy. 

*Figure 1 GBManalizerApp*

![Imgur](https://i.imgur.com/zyxesdQ.png)

The GBManalizerApp is designed primarily to load and visualize series of MRI images from patients with GBM in their four basic structural modalities, namely: T1, T1c (T1 with gadolinium contrast), T2, and FLAIR (fluid attenuated inversion recovery) (Figure 2). These images can be loaded in the most common formats of medical images, DICOM (.dcm) or NifTi (.nii), through the "File" menu. If the images are loaded in DICOM format, the application will convert all DICOM files into a single NifTi file.

*Figure 2 Loading of the different MRI modalities*

![Imgur](https://i.imgur.com/wgeoBXL.png)

## Image Preprocessing
The segmentation algorithm used requires preprocessing of the images beforehand. If the images are not loaded preprocessed, you should press the "PREPROCESSING" button in the segmentation panel for the application to perform the preprocessing (coregistration to the same anatomical template, interpolation to a common resolution of 1 mm3, and skull extraction).

## Image Segmentation
Once the images are preprocessed, you should press the "SEGMENT" button in the segmentation panel for the application to execute the segmentation algorithm described in [Mulet de los Reyes 2023](https://github.com/amulet1989/GBManalizer). This algorithm achieves an accuracy of 83.9% and Dice similarity coefficients of 89.3%, 80.7%, 79.7%, and 66.4% for the whole region of interest (ROI), active tumor, edema, and necrosis, respectively. In summary, this supervised algorithm combines classical image processing methods (multithreshold Otsu method [Xu 2011] and Chan-Vese active contours [Chan & Vese 2000]) with training a Perceptron-type neural network with a hidden layer that is fed with radiomic features extracted and selected from the images.

*Figure 3 Segmentation*
![Imgur](https://i.imgur.com/HM9DVTc.png)


# Instalation
For preprocessing you will need to have Matlab R2021a or higher installed with SPM12 added to the access path. SPM12 should be downloaded from its official website [https://www.fil.ion.ucl.ac.uk/spm/software/spm12/](https://www.fil.ion.ucl.ac.uk/spm/software/spm12/) and added to Matlab files path.

### Add the SPM12 to MATLAB's path: There are two ways to do it:

a. **Using the Graphical User Interface (GUI):**
- Open MATLAB and navigate to the "Set Path" dialog box by clicking on the "Set Path" button in the "Home" tab.
- Click on the "Add Folder" button and select the folder that you want to add to the path. Make sure to select the checkbox "Include subfolders" to add all subfolders to the path.
- Click on the "Save" button to save the changes to the path.th.

b. **Using the addpath command in the command line:**

- Alternatively, you can use the addpath function in MATLAB to add a folder with subfolders to the path. For example, if you want to add the folder "C:\SPM12" and all its subfolders to the path, you can use the following command:

``` Matlab
addpath(genpath('C:\SPM12'));
```
Press Enter to execute the command and add the folder with subfolders to the path.

Verify the addition: You can verify that all the folders have been added to MATLAB's path by typing the following command in the command line:
```
path
```

The result will display all the folders included in MATLAB's path, and the folder you added should be present in the list.

### 
Now clone or download the repository, finally load in Matlab and run the file [GBManalizerApp.mlapp](https://github.com/amulet1989/GBManalizerApp/blob/main/GBManalizerApp.mlapp)

## References
- Chan T, Vese L; Active contours without edges; IEEE Transactions on Image Processing 10 (2):
266–277, 2000
- Xu X, Xu S, Jin L, Song E; Characteristic analysis of Otsu threshold and its applications; Pattern
Recognition Letters 32 (7): 956-961, 2011
- [https://www.fil.ion.ucl.ac.uk/spm/software/spm12/](https://www.fil.ion.ucl.ac.uk/spm/software/spm12/)
