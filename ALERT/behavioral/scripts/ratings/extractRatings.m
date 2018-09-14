studyCode = 'CAPS';
taskCode = 'ALERT';
DIR.bx = ['~/Desktop/' studyCode '_BxData/pilot/tasks/' taskCode];
DIR.out = [DIR.bx filesep 'output_recoveredResp'];
DIR.rating = [DIR.bx filesep 'ratings'];
DIR.in = [DIR.bx filesep 'input'];
DIR.vec = [DIR.bx filesep 'vecs'];
DIR.thisFunk = ['~/Desktop/' studyCode '_scripts/behavioral/scripts/makeVecs/'];
DIR.compiled = [DIR.bx filesep 'compiled'];

subList = [203 219];
nRuns = 2;
nConds = 6;
ratingMeans = nan(max(subList),7);
filenames.template = '/Users/laurenkahn/Desktop/CAPS_BxData/pilot/tasks/ALERT/output/sub-203_ses-1_task-ALERT_run-1_beh.mat';

for s = subList
    currentSubRatings = [];
    ratings = cell(nRuns,nConds);
    
    if s<10
        placeholder = '00';
    elseif s<100
        placeholder = '0';
    else
        placeholder = '';
    end
    subjectCode = [studyCode placeholder num2str(s)];
    filenames.rating =  [DIR.rating filesep subjectCode '_ratings'];
    
    for r=1:nRuns
        
        filenames.out =  [DIR.out filesep 'sub-' subjectCode(end-2:end) '_ses-1_task-' taskCode '_run-' num2str(r) '_beh.mat'];
        
        if ~exist(filenames.out,'file')
            warning('No output file found for subject %d, run %d.\n',s,r);% import input file to determine eventIndices DO THIS
        else
            
            % import output file to determine actual onsets/duration
            load(filenames.out)
            
            % Get event indices
            isER = cell2mat(cellfun(@(x) strcmp(x(1:2),'ER'),run_info.tag,'UniformOutput',false));
            isAL = cell2mat(cellfun(@(x) strcmp(x(1:2),'AL'),run_info.tag,'UniformOutput',false));
            isJL = cell2mat(cellfun(@(x) strcmp(x(1:2),'JL'),run_info.tag,'UniformOutput',false));
            isNeut = cell2mat(cellfun(@(x) strcmp(x(end-3:end),'tral'),run_info.tag,'UniformOutput',false));
            isNeg = cell2mat(cellfun(@(x) strcmp(x(end-2:end),'neg'),run_info.tag,'UniformOutput',false));
            isRating = cell2mat(cellfun(@(x) strcmp(x,'distress'),run_info.tag,'UniformOutput',false));

            % Extract responses
            for resp = find(isRating)'
                if isempty(run_info.responses{resp})
                    run_info.responses{resp} = NaN;
                    warning('missing response for run %d, event %d', r, resp)
                else
                    run_info.responses{resp} = str2num(run_info.responses{resp});
                end
            end
            
            ratings{r,1} = cell2mat(run_info.responses(logical([0;0;(isER & isNeg)])))';
            ratings{r,2} = cell2mat(run_info.responses(logical([0;0;(isER & isNeut)])))';
            ratings{r,3} = cell2mat(run_info.responses(logical([0;0;(isAL & isNeg)])))';
            ratings{r,4} = cell2mat(run_info.responses(logical([0;0;(isAL & isNeut)])))';
            ratings{r,5} = cell2mat(run_info.responses(logical([0;0;(isJL & isNeg)])))';
            ratings{r,6} = cell2mat(run_info.responses(logical([0;0;(isJL & isNeut)])))';
        end
    end
    
    save(filenames.rating,'ratings')
    
    ratingLog = [];
    for cond=1:nConds
        condRatings = [];
        for r=1:nRuns
            condRatings = [condRatings; ratings{r,cond}];
            nRatings(cond) = size(ratings{r,cond},1);
            ratingLog = [ratingLog;[cond*ones(nRatings(cond),1) ratings{r,cond}]];
        end
        condMeans(cond) = nanmean(condRatings);
    end
    
    overallMeans = nanmean(ratingLog(:,2));
    
    ratingMeans(s,1:6) = condMeans;
    ratingMeans(s,7) = overallMeans;
    
end

dlmwrite([DIR.compiled filesep 'ratingMeans.txt'],ratingMeans,'delimiter','\t')
save([DIR.compiled filesep 'ratingMeans.mat'],'ratingMeans')
