% Revised 9-14-18 by LEK

studyCode = 'CAPS';
taskCode = 'SST';
modelCode = 'simple';

DIR.bx = ['~/Documents/code/sanlab' filesep studyCode '_BxData' filesep 'pilot' filesep 'tasks' filesep taskCode filesep];
DIR.out = [DIR.bx  'output/'];
DIR.compiled = [DIR.bx filesep 'compiled/'];
DIR.vec = [DIR.bx filesep 'vecs/'];

subList = [201 203 219];
runList = [1 2];
nRuns = length(runList);
nSubs = length(subList);

% These two codes should reflect what's in the response column of the Seeker variable
% You'll specify exceptions to this rule below
leftButton=91;
rightButton=94;

% If anyone used the wrong buttons consistently (you will find this out after
% the intialCheck), create a text file noting the sub #, run #, and what key
% codes they used to indicate LEFT- and RIGHT- pointing arrows (see template file).

filenames.buttonException = [DIR.compiled '/n' num2str(nSubs) filesep 'initialCheck/systematicWrongButtons.txt'];
if exist(filenames.buttonException)
    buttonRuleExceptions = dlmread(filenames.buttonException,'\t');
else
    buttonRuleExceptions = [];
end

% Some versions of the SST set up the Seeker variable differently.
% The script should tell you which columns are which and what different
% codes mean, but you can also deduce it from looking at the actual output.
% Change these to reflect your Seeker variable structure.
trialTypeColumn=3;
arrowDirColumn=4;
responseKeyColumn=7;
trialTimeColumn=12;
trialLengthColumn=15;
goCode=0;
stopCode=1;
leftCode=0;
rightCode=1;
arrowLength=1;

DIR.vecModel = [DIR.vec filesep modelCode];
if ~exist(DIR.vecModel)
    mkdir(DIR.vecModel)
end

% Initialize variable
trashCount = nan(max(subList),nRuns);

for s=subList
    
    % Create subjectCode
    if s<10
        placeholder = '00';
    elseif s<100
        placeholder = '0';
    else placeholder = '';
    end
    
    subjectCode = [studyCode placeholder num2str(s)];
    
    for r=runList % For runs defined previously (scanning only here)
        filenames.out = [DIR.out filesep 'sub-' subjectCode(end-2:end) '_ses-1_task-' taskCode '_run-' num2str(r) '_beh.mat'];
        filenames.vec = [DIR.vecModel filesep subjectCode '_run' num2str(r) '_' modelCode];
        if exist(filenames.out)
            load(filenames.out)  % Load .mat
            
            if ~isempty(buttonRuleExceptions)
                % Define LEFT and RIGHT *******
                problemSubIdx = find(buttonRuleExceptions(:,1)==s);
                problemRunIdx = find(buttonRuleExceptions(:,2)==r);
                probRow = intersect(problemSubIdx,problemRunIdx);
                
                if length(probRow)>1 % this shouldn't happen
                    warning('multiple button exception entries for sub %d run %d',s,r)
                end
                
                if isnan(buttonRuleExceptions(probRow,3))
                    % keep this run as NaNs (buttons were too inconsistent)
                else % start with default
                    LEFT=leftButton;
                    RIGHT=rightButton;
                    
                    if ~isempty(probRow)
                        LEFT = buttonRuleExceptions(probRow,3);
                        RIGHT = buttonRuleExceptions(probRow,4);
                        sprintf('button exception logged for sub %d run %d',s,r)
                    end
                end
            else
                % start with default
                LEFT=leftButton;
                RIGHT=rightButton;
            end
            % Initialize names, onsets, durations variables
            names = {'CorrectGo' 'CorrectStop' 'FailedStop' 'Cue'}; % will append trash as necessary
            onsets = cell(1,4);
            durations = cell(1,4);
            
            % Get vectors of trial info
            trialType = Seeker(:,trialTypeColumn); % 0=Go, 1=NoGo, 2=null, 3=notrial`
            arrowDir = Seeker(:,arrowDirColumn); % 0=left, 1=right, 2=null
            responseKey = Seeker(:,responseKeyColumn);
            trialTime = Seeker(:,trialTimeColumn);
            trialLength = Seeker(:,trialLengthColumn);
            cueLength = trialLength - 1;
            
            % Add jitter column to Seeker
            numSeekerCols = size(Seeker,2);
            numSeekerRows = size(Seeker,1);
            Seeker(:,numSeekerCols+1) = NaN;
            
            % Find first non-null event in Seeker
            initialTrialIdx = find(~(Seeker(:,trialTypeColumn)==2),1);
            
            % To Beep Or Not To Beep
            isGo = trialType==goCode;
            isStop = trialType==stopCode;
            
            % Arrow presented
            isLeft = arrowDir==leftCode;
            isRight = arrowDir==rightCode;
            
            % Button response
            isLeftKey = responseKey==LEFT;
            isRightKey = responseKey==RIGHT;
            isNoResponse = responseKey==0;
            
            isCorrect = isLeft&isLeftKey | isRight&isRightKey;
            isPressed = isLeftKey|isRightKey;
            
            %%%%% Find Important Trial Types
            isCorrectGo = isGo&isCorrect; % Hits
            isCorrectStop = isStop&isNoResponse; % Correct Rejections
            isFailedStop = isStop&isPressed; % False Alarms (even if it's the wrong button)
            isIncorrectGo = (isGo&isNoResponse)|(isGo&(~isCorrect));% Misses or "wrong" hits - will be trashed
            
            
            %%%%% The Important Variables %%%%%
            onsets{1} = trialTime(isCorrectGo)+cueLength(isCorrectGo);
            onsets{2} = trialTime(isCorrectStop)+cueLength(isCorrectStop);
            onsets{3} = trialTime(isFailedStop)+cueLength(isFailedStop);
            onsets{4} = trialTime(isCorrectGo|isCorrectStop|isFailedStop|isIncorrectGo);
            
            durations{1} = repelem(arrowLength, length(onsets{1}))';
            durations{2} = repelem(arrowLength, length(onsets{2}))';
            durations{3} = repelem(arrowLength, length(onsets{3}))';
            durations{4} = cueLength(isCorrectGo|isCorrectStop|isFailedStop|isIncorrectGo);
            
            % Trash?
            if find(isIncorrectGo) % If there's trash, trash it
                names{5} = 'Trash';
                onsets{5} = trialTime(isIncorrectGo)+cueLength(isIncorrectGo);
                durations{5} = repelem(arrowLength, length(onsets{5}))';
                trashCount(s,r)=sum(isIncorrectGo);
            end
            
            save(filenames.vec,'names','onsets','durations')
        else
            warning('No output file for subject %d, run %d.',s,r);
        end % file exists if
    end % run loop
end % subject loop

dlmwrite([DIR.compiled '/n' num2str(nSubs) '/initialCheck/trashCount.txt'],trashCount,'delimiter','\t');

clear