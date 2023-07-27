function [out_path]= reslice_with_corr(ref, sources)
% ref -> string with the path of reference MRI
% sources -> list of string with paths of MRI to reslice

%% Matlab batch
% matlabbatch{1}.spm.spatial.coreg.write.ref = {'D:\Alexander\1_Doctorado\Software\GUI\Linear interpolation 3D\TCGA-02-0075\09-24-1999-MRI BRAIN WWO CONTRAST-32875\14-FSPGR 3D-90164\3TBRAINROUTINEHUNTERFSPGR3D_0014\ws1999-09-24_11-26-122739-00001-00001-1.nii,1'};
% matlabbatch{1}.spm.spatial.coreg.write.source = {
%                                                  'D:\Alexander\1_Doctorado\Software\GUI\Linear interpolation 3D\TCGA-02-0075\01-30-1999-MRI BRAIN WWO CONTR-29853\5-AX T1-84008\unknownAXT1_0005\s1999-01-30_22-27-223746-00000-00001-1.nii,1'
%                                                  'D:\Alexander\1_Doctorado\Software\GUI\Linear interpolation 3D\TCGA-02-0075\01-30-1999-MRI BRAIN WWO CONTR-29853\3-AX T2 FSE-87118\unknownAXT2FSE_0003\s1999-01-30_22-27-223019-00000-00001-1.nii,1'
%                                                  'D:\Alexander\1_Doctorado\Software\GUI\Linear interpolation 3D\TCGA-02-0075\01-30-1999-MRI BRAIN WWO CONTR-29853\4-AX FLAIR-14351\unknownAXFLAIR_0004\s1999-01-30_22-27-223246-00000-00001-1.nii,1'
%                                                  'D:\Alexander\1_Doctorado\Software\GUI\Linear interpolation 3D\TCGA-02-0075\01-30-1999-MRI BRAIN WWO CONTR-29853\6-AX T1 POST-23335\unknownAXT1POST_0006\s1999-01-30_22-27-224007-00000-00001-1.nii,1'
%                                                  };
% file_name=ref;
% folder = pwd;
% ref =folder + file_name;

matlabbatch{1}.spm.spatial.coreg.write.ref = {ref};
matlabbatch{1}.spm.spatial.coreg.write.source = {sources};
                                             
matlabbatch{1}.spm.spatial.coreg.write.roptions.interp = 4;%1, 4
matlabbatch{1}.spm.spatial.coreg.write.roptions.wrap = [0 0 0];
matlabbatch{1}.spm.spatial.coreg.write.roptions.mask = 0;
matlabbatch{1}.spm.spatial.coreg.write.roptions.prefix = 'r_';
%%
nrun = 1; % enter the number of runs here
inputs = cell(0, nrun);
spm('defaults', 'FMRI');
out=spm_jobman('run', matlabbatch, inputs{:});
out_path=out{1,1}.rfiles;
out_path=erase(out_path{1,1},',1');

