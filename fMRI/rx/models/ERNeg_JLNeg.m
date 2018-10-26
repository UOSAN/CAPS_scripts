%-----------------------------------------------------------------------
% Job saved on 13-Sep-2018 12:04:04 by cfg_util (rev $Rev: 6942 $)
% spm SPM - SPM12 (7219)
% cfg_basicio BasicIO - Unknown
%-----------------------------------------------------------------------
matlabbatch{1}.spm.stats.factorial_design.dir = {'/projects/sanlab/shared/CAPS/bids_data/derivatives/fMRI/rx/models/ALERT/wave1/3cond/ERNeg_JLNeg'};
%%
matlabbatch{1}.spm.stats.factorial_design.des.t1.scans = {
                                                          '/projects/sanlab/shared/CAPS/bids_data/derivatives/fMRI/fx/models/ALERT/wave1/3cond/sub-108p/con_0009.nii'
                                                          '/projects/sanlab/shared/CAPS/bids_data/derivatives/fMRI/fx/models/ALERT/wave1/3cond/sub-201p/con_0009.nii'
                                                          '/projects/sanlab/shared/CAPS/bids_data/derivatives/fMRI/fx/models/ALERT/wave1/3cond/sub-203p/con_0009.nii'
                                                          '/projects/sanlab/shared/CAPS/bids_data/derivatives/fMRI/fx/models/ALERT/wave1/3cond/sub-219p/con_0009.nii'
                                                          };
%%
matlabbatch{1}.spm.stats.factorial_design.cov = struct('c', {}, 'cname', {}, 'iCFI', {}, 'iCC', {});
matlabbatch{1}.spm.stats.factorial_design.multi_cov = struct('files', {}, 'iCFI', {}, 'iCC', {});
matlabbatch{1}.spm.stats.factorial_design.masking.tm.tm_none = 1;
matlabbatch{1}.spm.stats.factorial_design.masking.im = 0;
matlabbatch{1}.spm.stats.factorial_design.masking.em = {''};
matlabbatch{1}.spm.stats.factorial_design.globalc.g_omit = 1;
matlabbatch{1}.spm.stats.factorial_design.globalm.gmsca.gmsca_no = 1;
matlabbatch{1}.spm.stats.factorial_design.globalm.glonorm = 1;
matlabbatch{2}.spm.stats.fmri_est.spmmat(1) = cfg_dep('Factorial design specification: SPM.mat File', substruct('.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','spmmat'));
matlabbatch{2}.spm.stats.fmri_est.write_residuals = 0;
matlabbatch{2}.spm.stats.fmri_est.method.Classical = 1;
matlabbatch{3}.spm.stats.con.spmmat(1) = cfg_dep('Model estimation: SPM.mat File', substruct('.','val', '{}',{2}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','spmmat'));
matlabbatch{3}.spm.stats.con.consess{1}.tcon.name = 'ERNeg > JLNeg';
matlabbatch{3}.spm.stats.con.consess{1}.tcon.weights = 1;
matlabbatch{3}.spm.stats.con.consess{1}.tcon.sessrep = 'none';
matlabbatch{3}.spm.stats.con.consess{2}.tcon.name = 'JLNeg > ERNeg';
matlabbatch{3}.spm.stats.con.consess{2}.tcon.weights = -1;
matlabbatch{3}.spm.stats.con.consess{2}.tcon.sessrep = 'none';
matlabbatch{3}.spm.stats.con.delete = 1;
