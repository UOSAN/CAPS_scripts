studyCode = 'CAPS';
taskCode = 'ALERT';
DIR.bx = ['~/Desktop/' studyCode '_BxData/pilot/tasks/' taskCode];
DIR.out = [DIR.bx filesep 'output_recoveredResp'];
DIR.in = [DIR.bx filesep 'input'];
DIR.vec = [DIR.bx filesep 'vecs'];
DIR.thisFunk = ['~/Desktop/' studyCode '_scripts/' taskCode '/behavioral/scripts/makeVecs/'];
DIR.rating = [DIR.bx filesep 'ratings'];

subList = [108 201 203 219];
nSubs = length(subList);
nRuns = 2;
modelCode = '3cond_pmod';
% Saving SPM-ready names, onsets, and durations to .mat

DIR.vecModel = [DIR.vec filesep modelCode];
if ~exist(DIR.vecModel)
    mkdir(DIR.vecModel)
end

DIR.compiled = [DIR.bx filesep 'compiled' filesep 'n' num2str(nSubs) filesep];
if ~exist(DIR.compiled)
    mkdir(DIR.compiled)
end

filenames.ratingMeans = 'ratingMeans.mat';

names = {'ERNeg','ERNeutral','ALNeg','ALNeutral','JLNeg','JLNeutral','instruction','rating'};
nConds = length(names);
pmodConds = [1:6];
load([DIR.compiled filesep filenames.ratingMeans])

for s = subList
    
    if s<10
        placeholder = '00';
    elseif s<100
        placeholder = '0';
    else
        placeholder = '';
    end
    subjectCode = [studyCode placeholder num2str(s)];            
    filenames.rating =  [DIR.rating filesep subjectCode '_ratings'];
    load(filenames.rating);
                
    for r=1:nRuns
        
        filenames.out =  [DIR.out filesep 'sub-' subjectCode(end-2:end) '_ses-1_task-' taskCode '_run-' num2str(r) '_beh.mat'];
        filenames.vec = [DIR.vecModel filesep subjectCode '_run' num2str(r) '_' modelCode];
        onsets = cell(1,nConds);
        durations = cell(1,nConds);
        pmod = struct;
        for cond = pmodConds
            pmod(cond).name = 'distress';
            pmod(cond).poly = 1;
        end
        
        if ~exist(filenames.out,'file')
            warning('No output file found for subject %d, run %d.\n',s,r);% import input file to determine eventIndices DO THIS
        else
            
            % import output file to determine actual onsets/durations DO THIS
            load(filenames.out)
            
            % Get event indices
            isER = cell2mat(cellfun(@(x) strcmp(x(1:2),'ER'),run_info.tag,'UniformOutput',false));
            isAL = cell2mat(cellfun(@(x) strcmp(x(1:2),'AL'),run_info.tag,'UniformOutput',false));
            isJL = cell2mat(cellfun(@(x) strcmp(x(1:2),'JL'),run_info.tag,'UniformOutput',false));
            isNeut = cell2mat(cellfun(@(x) strcmp(x(end-3:end),'tral'),run_info.tag,'UniformOutput',false));
            isNeg = cell2mat(cellfun(@(x) strcmp(x(end-2:end),'neg'),run_info.tag,'UniformOutput',false));
            isRating = cell2mat(cellfun(@(x) strcmp(x,'distress'),run_info.tag,'UniformOutput',false));
            isInstrux = cell2mat(cellfun(@(x) strcmp(x(end-4:end),'truct'),run_info.tag,'UniformOutput',false));

            onsets{1} = run_info.onsets(isER & isNeg);
            onsets{2} = run_info.onsets(isER & isNeut);
            onsets{3} = run_info.onsets(isAL & isNeg);
            onsets{4} = run_info.onsets(isAL & isNeut);
            onsets{5} = run_info.onsets(isJL & isNeg);
            onsets{6} = run_info.onsets(isJL & isNeut);
            onsets{7} = run_info.onsets(isInstrux);
            onsets{8} = run_info.onsets(isRating);
            
            durations{1} = run_info.durations(isER & isNeg);
            durations{2} = run_info.durations(isER & isNeut);
            durations{3} = run_info.durations(isAL & isNeg);
            durations{4} = run_info.durations(isAL & isNeut);
            durations{5} = run_info.durations(isJL & isNeg);
            durations{6} = run_info.durations(isJL & isNeut);
            durations{7} = run_info.durations(isInstrux);
            durations{8} = run_info.durations(isRating);
            
            subRatingMean = ratingMeans(s,7);
            
            for cond = pmodConds % for each condition
                % Set up pmod for current cond
                pmod_temp = ratings{r,cond} - subRatingMean;
                pmod_temp(isnan(pmod_temp)) = 0; % Make NaNs = 0 (mean)
                pmod(cond).param = pmod_temp;
            end
            
            % save vec file for this run
            save(filenames.vec,'names','onsets','durations','pmod')
        end
    end
    
end
cd(DIR.thisFunk)
