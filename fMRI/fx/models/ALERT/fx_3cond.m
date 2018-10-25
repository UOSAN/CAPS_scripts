%-----------------------------------------------------------------------
% Job saved on 24-Oct-2018 13:50:37 by cfg_util (rev $Rev: 6942 $)
% spm SPM - SPM12 (7219)
% cfg_basicio BasicIO - Unknown
%-----------------------------------------------------------------------
matlabbatch{1}.spm.stats.fmri_spec.dir = {'/projects/sanlab/shared/CAPS/bids_data/derivatives/fMRI/fx/models/ALERT/wave1/3cond/sub-018p'};
matlabbatch{1}.spm.stats.fmri_spec.timing.units = 'secs';
matlabbatch{1}.spm.stats.fmri_spec.timing.RT = 2;
matlabbatch{1}.spm.stats.fmri_spec.timing.fmri_t = 72;
matlabbatch{1}.spm.stats.fmri_spec.timing.fmri_t0 = 36;
matlabbatch{1}.spm.stats.fmri_spec.sess(1).scans = {'/projects/sanlab/shared/CAPS/bids_data/derivatives/fmriprep/sub-018p/ses-wave1/func/s6_sub-108p_ses-1_task-ALERT_acq-01_bold_space-MNI152NLin2009cAsym_preproc.nii'};
matlabbatch{1}.spm.stats.fmri_spec.sess(1).cond = struct('name', {}, 'onset', {}, 'duration', {}, 'tmod', {}, 'pmod', {}, 'orth', {});
matlabbatch{1}.spm.stats.fmri_spec.sess(1).multi = {'/projects/sanlab/shared/CAPS/CAPS_BxData/pilot/tasks/ALERT/vecs/3cond/CAPS108_run1_3cond.mat'};
matlabbatch{1}.spm.stats.fmri_spec.sess(1).regress = struct('name', {}, 'val', {});
matlabbatch{1}.spm.stats.fmri_spec.sess(1).multi_reg = {'/projects/sanlab/shared/CAPS/CAPS_scripts/fMRI/fx/motion/auto-motion-fmriprep/rp_txt/rp_108p_1_ALERT_1.txt'};
matlabbatch{1}.spm.stats.fmri_spec.sess(1).hpf = 128;
matlabbatch{1}.spm.stats.fmri_spec.sess(2).scans = {'/projects/sanlab/shared/CAPS/bids_data/derivatives/fmriprep/sub-018p/ses-wave1/func/s6_sub-108p_ses-1_task-ALERT_acq-01_bold_space-MNI152NLin2009cAsym_preproc.nii'};
matlabbatch{1}.spm.stats.fmri_spec.sess(2).cond = struct('name', {}, 'onset', {}, 'duration', {}, 'tmod', {}, 'pmod', {}, 'orth', {});
matlabbatch{1}.spm.stats.fmri_spec.sess(2).multi = {'/projects/sanlab/shared/CAPS/CAPS_BxData/pilot/tasks/ALERT/vecs/3cond/CAPS108_run1_3cond.mat'};
matlabbatch{1}.spm.stats.fmri_spec.sess(2).regress = struct('name', {}, 'val', {});
matlabbatch{1}.spm.stats.fmri_spec.sess(2).multi_reg = {'/projects/sanlab/shared/CAPS/CAPS_scripts/fMRI/fx/motion/auto-motion-fmriprep/rp_txt/rp_108p_1_ALERT_2.txt'};
matlabbatch{1}.spm.stats.fmri_spec.sess(2).hpf = 128;
matlabbatch{1}.spm.stats.fmri_spec.fact = struct('name', {}, 'levels', {});
matlabbatch{1}.spm.stats.fmri_spec.bases.hrf.derivs = [0 0];
matlabbatch{1}.spm.stats.fmri_spec.volt = 1;
matlabbatch{1}.spm.stats.fmri_spec.global = 'None';
matlabbatch{1}.spm.stats.fmri_spec.mthresh = -Inf;
matlabbatch{1}.spm.stats.fmri_spec.mask = {'/projects/sanlab/shared/spm12/canonical/MNI152lin_T1_2mm_brain_mask.nii'};
matlabbatch{1}.spm.stats.fmri_spec.cvi = 'FAST';
