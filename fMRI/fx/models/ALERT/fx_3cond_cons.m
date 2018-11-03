%-----------------------------------------------------------------------
% Job saved on 25-Oct-2018 16:39:17 by cfg_util (rev $Rev: 6460 $)
% spm SPM - SPM12 (6906)
%-----------------------------------------------------------------------
matlabbatch{1}.spm.stats.fmri_est.spmmat = {'/projects/sanlab/shared/CAPS/bids_data/derivatives/fMRI/fx/models/ALERT/wave1/3cond/sub-108p/SPM.mat'};
matlabbatch{1}.spm.stats.fmri_est.write_residuals = 1;
matlabbatch{1}.spm.stats.fmri_est.method.Classical = 1;
matlabbatch{2}.spm.stats.con.spmmat(1) = cfg_dep('Model estimation: SPM.mat File', substruct('.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','spmmat'));
matlabbatch{2}.spm.stats.con.consess{1}.tcon.name = 'ERNeg';
matlabbatch{2}.spm.stats.con.consess{1}.tcon.weights = [1 0 0 0 0 0 0 0];
matlabbatch{2}.spm.stats.con.consess{1}.tcon.sessrep = 'repl';
matlabbatch{2}.spm.stats.con.consess{2}.tcon.name = 'ERNeutral';
matlabbatch{2}.spm.stats.con.consess{2}.tcon.weights = [0 1 0 0 0 0 0 0];
matlabbatch{2}.spm.stats.con.consess{2}.tcon.sessrep = 'repl';
matlabbatch{2}.spm.stats.con.consess{3}.tcon.name = 'ALNeg';
matlabbatch{2}.spm.stats.con.consess{3}.tcon.weights = [0 0 1 0 0 0 0 0];
matlabbatch{2}.spm.stats.con.consess{3}.tcon.sessrep = 'repl';
matlabbatch{2}.spm.stats.con.consess{4}.tcon.name = 'ALNeutral';
matlabbatch{2}.spm.stats.con.consess{4}.tcon.weights = [0 0 0 1 0 0 0 0];
matlabbatch{2}.spm.stats.con.consess{4}.tcon.sessrep = 'repl';
matlabbatch{2}.spm.stats.con.consess{5}.tcon.name = 'JNeg';
matlabbatch{2}.spm.stats.con.consess{5}.tcon.weights = [0 0 0 0 1 0 0 0];
matlabbatch{2}.spm.stats.con.consess{5}.tcon.sessrep = 'repl';
matlabbatch{2}.spm.stats.con.consess{6}.tcon.name = 'JNeutral';
matlabbatch{2}.spm.stats.con.consess{6}.tcon.weights = [0 0 0 0 0 1 0 0];
matlabbatch{2}.spm.stats.con.consess{6}.tcon.sessrep = 'repl';
matlabbatch{2}.spm.stats.con.consess{7}.tcon.name = 'instruction';
matlabbatch{2}.spm.stats.con.consess{7}.tcon.weights = [0 0 0 0 0 0 1 0];
matlabbatch{2}.spm.stats.con.consess{7}.tcon.sessrep = 'repl';
matlabbatch{2}.spm.stats.con.consess{8}.tcon.name = 'rating';
matlabbatch{2}.spm.stats.con.consess{8}.tcon.weights = [0 0 0 0 0 0 0 1];
matlabbatch{2}.spm.stats.con.consess{8}.tcon.sessrep = 'repl';
matlabbatch{2}.spm.stats.con.consess{9}.tcon.name = 'ERNeg_JLNeg';
matlabbatch{2}.spm.stats.con.consess{9}.tcon.weights = [1 0 0 0 -1 0 0 0];
matlabbatch{2}.spm.stats.con.consess{9}.tcon.sessrep = 'repl';
matlabbatch{2}.spm.stats.con.delete = 0;
