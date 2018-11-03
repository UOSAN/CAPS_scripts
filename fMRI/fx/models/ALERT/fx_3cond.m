%-----------------------------------------------------------------------
% Job saved on 25-Oct-2018 16:26:36 by cfg_util (rev $Rev: 6460 $)
% spm SPM - SPM12 (6906)
%-----------------------------------------------------------------------
matlabbatch{1}.spm.util.exp_frames.files = {'/gpfs/projects/sanlab/shared/CAPS/bids_data/derivatives/fmriprep/sub-108p/ses-1/func/s6_sub-108p_ses-1_task-ALERT_acq-01_bold_space-MNI152NLin2009cAsym_preproc.nii,1'};
matlabbatch{1}.spm.util.exp_frames.frames = Inf;
matlabbatch{2}.spm.util.exp_frames.files = {'/gpfs/projects/sanlab/shared/CAPS/bids_data/derivatives/fmriprep/sub-108p/ses-1/func/s6_sub-108p_ses-1_task-ALERT_acq-02_bold_space-MNI152NLin2009cAsym_preproc.nii,1'};
matlabbatch{2}.spm.util.exp_frames.frames = Inf;
matlabbatch{3}.spm.stats.fmri_spec.dir = {'/projects/sanlab/shared/CAPS/bids_data/derivatives/fMRI/fx/models/ALERT/wave1/3cond/sub-108p'};
matlabbatch{3}.spm.stats.fmri_spec.timing.units = 'secs';
matlabbatch{3}.spm.stats.fmri_spec.timing.RT = 2;
matlabbatch{3}.spm.stats.fmri_spec.timing.fmri_t = 72;
matlabbatch{3}.spm.stats.fmri_spec.timing.fmri_t0 = 36;
matlabbatch{3}.spm.stats.fmri_spec.sess(1).scans(1) = cfg_dep('Expand image frames: Expanded filename list.', substruct('.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','files'));
matlabbatch{3}.spm.stats.fmri_spec.sess(1).cond = struct('name', {}, 'onset', {}, 'duration', {}, 'tmod', {}, 'pmod', {}, 'orth', {});
matlabbatch{3}.spm.stats.fmri_spec.sess(1).multi = {'/projects/sanlab/shared/CAPS/CAPS_BxData/pilot/tasks/ALERT/vecs/3cond/CAPS108_run1_3cond.mat'};
matlabbatch{3}.spm.stats.fmri_spec.sess(1).regress = struct('name', {}, 'val', {});
matlabbatch{3}.spm.stats.fmri_spec.sess(1).multi_reg = {'/projects/sanlab/shared/CAPS/CAPS_scripts/fMRI/fx/motion/auto-motion-fmriprep/rp_txt/rp_108p_1_ALERT_1.txt'};
matlabbatch{3}.spm.stats.fmri_spec.sess(1).hpf = 128;
matlabbatch{3}.spm.stats.fmri_spec.sess(2).scans(1) = cfg_dep('Expand image frames: Expanded filename list.', substruct('.','val', '{}',{2}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','files'));
matlabbatch{3}.spm.stats.fmri_spec.sess(2).cond = struct('name', {}, 'onset', {}, 'duration', {}, 'tmod', {}, 'pmod', {}, 'orth', {});
matlabbatch{3}.spm.stats.fmri_spec.sess(2).multi = {'/projects/sanlab/shared/CAPS/CAPS_BxData/pilot/tasks/ALERT/vecs/3cond/CAPS108_run1_3cond.mat'};
matlabbatch{3}.spm.stats.fmri_spec.sess(2).regress = struct('name', {}, 'val', {});
matlabbatch{3}.spm.stats.fmri_spec.sess(2).multi_reg = {'/projects/sanlab/shared/CAPS/CAPS_scripts/fMRI/fx/motion/auto-motion-fmriprep/rp_txt/rp_108p_1_ALERT_2.txt'};
matlabbatch{3}.spm.stats.fmri_spec.sess(2).hpf = 128;
matlabbatch{3}.spm.stats.fmri_spec.fact = struct('name', {}, 'levels', {});
matlabbatch{3}.spm.stats.fmri_spec.bases.hrf.derivs = [0 0];
matlabbatch{3}.spm.stats.fmri_spec.volt = 1;
matlabbatch{3}.spm.stats.fmri_spec.global = 'None';
matlabbatch{3}.spm.stats.fmri_spec.mthresh = -Inf;
matlabbatch{3}.spm.stats.fmri_spec.mask = {'/projects/sanlab/shared/spm12/canonical/MNI152lin_T1_2mm_brain_mask.nii'};
matlabbatch{3}.spm.stats.fmri_spec.cvi = 'FAST';
