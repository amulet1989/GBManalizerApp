% List of open inputs
function [BW_mask,out]=skull_striping(vol_ch1, vol_ch2, vol_ch3, vol_ch4, vol_ref)
% recive all de path of corregistering MRI as
%{'...\3TBRAINROUTINEHUNTERFSPGR3D_0014\s1999-09-24_11-26-122739-00001-00001-1.nii,1'}
% T1 -> s
% Flair, T2, T1C -> rs
TPM1 = strcat(vol_ref, ',1');
TPM2 = strcat(vol_ref, ',2');
TPM3 = strcat(vol_ref, ',3');
TPM4 = strcat(vol_ref, ',4');
TPM5 = strcat(vol_ref, ',5');
TPM6 = strcat(vol_ref, ',6');
%% MAtlabbatch
matlabbatch{1}.spm.spatial.preproc.channel(1).vols = {vol_ch1};%{'D:\Alexander\1_Doctorado\Software\GUI\Linear interpolation 3D\TCGA-02-0075\09-24-1999-MRI BRAIN WWO CONTRAST-32875\14-FSPGR 3D-90164\3TBRAINROUTINEHUNTERFSPGR3D_0014\s1999-09-24_11-26-122739-00001-00001-1.nii,1'};
matlabbatch{1}.spm.spatial.preproc.channel(1).biasreg = 0.001;
matlabbatch{1}.spm.spatial.preproc.channel(1).biasfwhm = 60;
matlabbatch{1}.spm.spatial.preproc.channel(1).write = [0 0];
matlabbatch{1}.spm.spatial.preproc.channel(2).vols = {vol_ch2};%{'D:\Alexander\1_Doctorado\Software\GUI\Linear interpolation 3D\TCGA-02-0075\09-24-1999-MRI BRAIN WWO CONTRAST-32875\10-FSE T2-35736\3TBRAINROUTINEHUNTERFSET2_0010\rs1999-09-24_11-26-121744-00001-00001-1.nii,1'};
matlabbatch{1}.spm.spatial.preproc.channel(2).biasreg = 0.001;
matlabbatch{1}.spm.spatial.preproc.channel(2).biasfwhm = 60;
matlabbatch{1}.spm.spatial.preproc.channel(2).write = [0 0];
matlabbatch{1}.spm.spatial.preproc.channel(3).vols = {vol_ch3};%{'D:\Alexander\1_Doctorado\Software\GUI\Linear interpolation 3D\TCGA-02-0075\09-24-1999-MRI BRAIN WWO CONTRAST-32875\11-T2 FLAIR-76096\3TBRAINROUTINEHUNTERT2FLAIR_0011\rs1999-09-24_11-26-121950-00001-00001-1.nii,1'};
matlabbatch{1}.spm.spatial.preproc.channel(3).biasreg = 0.001;
matlabbatch{1}.spm.spatial.preproc.channel(3).biasfwhm = 60;
matlabbatch{1}.spm.spatial.preproc.channel(3).write = [0 0];
matlabbatch{1}.spm.spatial.preproc.channel(4).vols = {vol_ch4};%{'D:\Alexander\1_Doctorado\Software\GUI\Linear interpolation 3D\TCGA-02-0075\09-24-1999-MRI BRAIN WWO CONTRAST-32875\17-Ax SE T1 Post-08723\3TBRAINROUTINEHUNTERAxSET1Post_0017\rs1999-09-24_11-26-123743-00001-00001-1.nii,1'};
matlabbatch{1}.spm.spatial.preproc.channel(4).biasreg = 0.001;
matlabbatch{1}.spm.spatial.preproc.channel(4).biasfwhm = 60;
matlabbatch{1}.spm.spatial.preproc.channel(4).write = [0 0];
matlabbatch{1}.spm.spatial.preproc.tissue(1).tpm = {TPM1}; %'TPM.nii,1'
matlabbatch{1}.spm.spatial.preproc.tissue(1).ngaus = 2; %1
matlabbatch{1}.spm.spatial.preproc.tissue(1).native = [1 0];
matlabbatch{1}.spm.spatial.preproc.tissue(1).warped = [0 0];
matlabbatch{1}.spm.spatial.preproc.tissue(2).tpm = {TPM2};%'TPM.nii,2'
matlabbatch{1}.spm.spatial.preproc.tissue(2).ngaus = 2; %1
matlabbatch{1}.spm.spatial.preproc.tissue(2).native = [1 0];
matlabbatch{1}.spm.spatial.preproc.tissue(2).warped = [0 0];
matlabbatch{1}.spm.spatial.preproc.tissue(3).tpm = {TPM3};%'TPM.nii,3'
matlabbatch{1}.spm.spatial.preproc.tissue(3).ngaus = 2;
matlabbatch{1}.spm.spatial.preproc.tissue(3).native = [1 0];
matlabbatch{1}.spm.spatial.preproc.tissue(3).warped = [0 0];
matlabbatch{1}.spm.spatial.preproc.tissue(4).tpm = {TPM4};%'TPM.nii,4'
matlabbatch{1}.spm.spatial.preproc.tissue(4).ngaus = 3;
matlabbatch{1}.spm.spatial.preproc.tissue(4).native = [1 0];
matlabbatch{1}.spm.spatial.preproc.tissue(4).warped = [0 0];
matlabbatch{1}.spm.spatial.preproc.tissue(5).tpm = {TPM5};%'TPM.nii,5'
matlabbatch{1}.spm.spatial.preproc.tissue(5).ngaus = 4;
matlabbatch{1}.spm.spatial.preproc.tissue(5).native = [1 0];
matlabbatch{1}.spm.spatial.preproc.tissue(5).warped = [0 0];
matlabbatch{1}.spm.spatial.preproc.tissue(6).tpm = {TPM6};%'TPM.nii,6'
matlabbatch{1}.spm.spatial.preproc.tissue(6).ngaus = 2;
matlabbatch{1}.spm.spatial.preproc.tissue(6).native = [0 0];
matlabbatch{1}.spm.spatial.preproc.tissue(6).warped = [0 0];
matlabbatch{1}.spm.spatial.preproc.warp.mrf = 1;
matlabbatch{1}.spm.spatial.preproc.warp.cleanup = 1;
matlabbatch{1}.spm.spatial.preproc.warp.reg = [0 0.001 0.5 0.05 0.2];
matlabbatch{1}.spm.spatial.preproc.warp.affreg = 'mni';
matlabbatch{1}.spm.spatial.preproc.warp.fwhm = 0;
matlabbatch{1}.spm.spatial.preproc.warp.samp = 3;
matlabbatch{1}.spm.spatial.preproc.warp.write = [0 0];
matlabbatch{1}.spm.spatial.preproc.warp.vox = NaN;
matlabbatch{1}.spm.spatial.preproc.warp.bb = [NaN NaN NaN
                                              NaN NaN NaN];


%%
nrun = 1; % enter the number of runs here
% jobfile = {'D:\Alexander\1_Doctorado\Software\GUI\Linear interpolation 3D\TCGA-02-0075\09-24-1999-MRI BRAIN WWO CONTRAST-32875\Preprocesing\skull_striping_job.m'};
% jobs = repmat(jobfile, 1, nrun);
inputs = cell(0, nrun);
for crun = 1:nrun
end
spm('defaults', 'FMRI');
out=spm_jobman('run',matlabbatch, inputs{:});

%% Binary Mask
[c1p,c2p,c3p,c4p,c5p]=out{1,1}.tiss.c;

c1=niftiread(c1p{1,1});
c2=niftiread(c2p{1,1});
c3=niftiread(c3p{1,1});
c4=niftiread(c4p{1,1}); % añadir otra 
c5=niftiread(c5p{1,1});

delete(c1p{1,1}, c2p{1,1}, c3p{1,1}, c4p{1,1}, c5p{1,1});

brain_mask=c1+c2+c3; % añadir otra 
level = graythresh(brain_mask);
BW_mask = imbinarize(brain_mask,level);
BW_mask= imfill(BW_mask,'holes');
