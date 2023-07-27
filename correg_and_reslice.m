% List of open inputs
function [out, out_str]=correg_and_reslice(NiiFilenames_ref, NiiFilenames_s)

%% Set paths
% directory image ref
% [filename_ref, pathname_ref,filterindex_ref] = uigetfile({'*.nii','Image-files (*.dcm)'}, ... %;'*.*', 'All Files (*.*)'
%     'Abrir', 'Imagen.dcm','MultiSelect', 'on');
% %Essentials=1;
% [x,y,~]=size(filename_ref);
% DicomFilenames_ref=repmat({pathname_ref},y,x);
% DicomFilenames_ref=strcat(DicomFilenames_ref,filename_ref');
% 
% % directory image source
% [filename_s, pathname_s,filterindex_s] = uigetfile({'*.nii','Image-files (*.nii)'}, ... %;'*.*', 'All Files (*.*)'
%     'Abrir', 'Imagen.dcm');
% %Essentials=1;
% [x,y,~]=size(filename_s);
% DicomFilenames_s=repmat({pathname_s},y,x);
% DicomFilenames_s=strcat(DicomFilenames_s,filename_s');
%% Matlabbatch
matlabbatch{1}.spm.spatial.coreg.estwrite.ref ={NiiFilenames_ref}; %{'D:\Alexander\1_Doctorado\Software\GUI\Linear interpolation 3D\TCGA-02-0075\09-24-1999-MRI BRAIN WWO CONTRAST-32875\14-FSPGR 3D-90164\3TBRAINROUTINEHUNTERFSPGR3D_0014\s1999-09-24_11-26-122739-00001-00001-1.nii,1'};
matlabbatch{1}.spm.spatial.coreg.estwrite.source = {NiiFilenames_s}; %{'D:\Alexander\1_Doctorado\Software\GUI\Linear interpolation 3D\TCGA-02-0075\09-24-1999-MRI BRAIN WWO CONTRAST-32875\17-Ax SE T1 Post-08723\3TBRAINROUTINEHUNTERAxSET1Post_0017\s1999-09-24_11-26-123743-00001-00001-1.nii,1'};
matlabbatch{1}.spm.spatial.coreg.estwrite.other = {''};
matlabbatch{1}.spm.spatial.coreg.estwrite.eoptions.cost_fun = 'nmi';
matlabbatch{1}.spm.spatial.coreg.estwrite.eoptions.sep = [4 2];
matlabbatch{1}.spm.spatial.coreg.estwrite.eoptions.tol = [0.02 0.02 0.02 0.001 0.001 0.001 0.01 0.01 0.01 0.001 0.001 0.001];
matlabbatch{1}.spm.spatial.coreg.estwrite.eoptions.fwhm = [7 7];
matlabbatch{1}.spm.spatial.coreg.estwrite.roptions.interp = 4;%1
matlabbatch{1}.spm.spatial.coreg.estwrite.roptions.wrap = [0 0 0];
matlabbatch{1}.spm.spatial.coreg.estwrite.roptions.mask = 0;
matlabbatch{1}.spm.spatial.coreg.estwrite.roptions.prefix = 'cr_';

 %% run
nrun = 1; % enter the number of runs here
% jobfile = {'D:\Alexander\1_Doctorado\Software\GUI\Linear interpolation 3D\TCGA-02-0075\09-24-1999-MRI BRAIN WWO CONTRAST-32875\Preprocesing\correg_and_reslice_job.m'};
% jobs = repmat(jobfile, 1, nrun);
inputs = cell(0, nrun);
for crun = 1:nrun
end
spm('defaults', 'FMRI');
out=spm_jobman('run', matlabbatch, inputs{:});
out_str=out{1,1}.rfiles;
out_str=out_str{1,1};
end
