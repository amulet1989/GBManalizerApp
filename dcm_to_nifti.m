function [out, outstr]=dcm_to_nifti(DicomFilenames, pathname)

%% Matlabbatch
% directory
% [filename, pathname,filterindex] = uigetfile({'*.dcm','Image-files (*.dcm)'}, ... %;'*.*', 'All Files (*.*)'
%     'Abrir', 'Imagen.dcm','MultiSelect', 'on');
% %Essentials=1;
% 
%     [x,y,~]=size(filename);
%     DicomFilenames=repmat({pathname},y,x);
%     DicomFilenames=strcat(DicomFilenames,filename');
%if isdeployed
    matlabbatch{1}.spm.util.import.dicom.data = DicomFilenames;
    matlabbatch{1}.spm.util.import.dicom.root = 'series';
    matlabbatch{1}.spm.util.import.dicom.outdir = {pathname};
    matlabbatch{1}.spm.util.import.dicom.protfilter = '.*';
    matlabbatch{1}.spm.util.import.dicom.convopts.format = 'nii';
    matlabbatch{1}.spm.util.import.dicom.convopts.meta = 0;
    matlabbatch{1}.spm.util.import.dicom.convopts.icedims = 0;
    
    %%
    % DCMfiles={
    %     'D:\Alexander\1_Doctorado\Software\GUI\Linear interpolation 3D\TCGA-02-0075\09-24-1999-MRI BRAIN WWO CONTRAST-32875\11-T2 FLAIR-76096\000000.dcm'
    %     'D:\Alexander\1_Doctorado\Software\GUI\Linear interpolation 3D\TCGA-02-0075\09-24-1999-MRI BRAIN WWO CONTRAST-32875\11-T2 FLAIR-76096\000001.dcm'
    %     'D:\Alexander\1_Doctorado\Software\GUI\Linear interpolation 3D\TCGA-02-0075\09-24-1999-MRI BRAIN WWO CONTRAST-32875\11-T2 FLAIR-76096\000002.dcm'
    %     'D:\Alexander\1_Doctorado\Software\GUI\Linear interpolation 3D\TCGA-02-0075\09-24-1999-MRI BRAIN WWO CONTRAST-32875\11-T2 FLAIR-76096\000003.dcm'
    %     ...
    %     };
    
    %%
    nrun = 1; % enter the number of runs here
    % jobfile = {'D:\Alexander\1_Doctorado\Software\GUI\Linear interpolation 3D\TCGA-02-0075\09-24-1999-MRI BRAIN WWO CONTRAST-32875\Preprocesing\dcm_to_nifti_job.m'};
    % jobs = repmat(jobfile, 1, nrun);
    inputs = cell(0, nrun);
    % for crun = 1:nrun
    % end
    spm('defaults', 'FMRI');
    out=spm_jobman('run', matlabbatch, inputs{:});
    outstr=out{1,1}.files{1,1};
%end
end
