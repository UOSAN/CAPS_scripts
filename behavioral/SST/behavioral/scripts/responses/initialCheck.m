%%%%% Updated 9-14-18 by LEK

% This script takes your SST output and checks to make sure there are no
% strange responses. You will get a bunch of output files of the form N x R
% (N subjects, R runs) telling you how many go trials per run (should always be
% the same number, say, 96) how many stop trials (should be 32)

% and importantly:

% how many NO RESPONSE trials
% (should be as low as possible, but a few isn't worrisome -- lots means
% they may have been responding so slowly that the script wasn't
% recognizing their response and was falsely categorizing them as stops
% which is bad!)

% how many WRONG GO trials
% In the absence of any "weird buttons," lots of wrong gos sometimes means
% they just flipped the buttons, either because they were handed the button
% boxes backwards, or they were thinking about the "open side" of the arrow
% rather than the direction it was pointing.

% how many "WEIRD BUTTON" trials
% This counts how many times they pressed buttons other than the ones you
% specify below (e.g. 91 & 94, 3 & 6, whatever)
% If they consistently pressed 2 & 7, for example, you can still use the
% data. If they flipped half way through, it'll be harder.

studyCode='CAPS'; % You'll use this in your filenames
taskCode = 'SST';

DIR.bx = ['~/Desktop' filesep studyCode '_BxData' filesep 'pilot' filesep 'tasks' filesep taskCode filesep];
DIR.out = [DIR.bx  'output/'];
DIR.compiled = [DIR.bx filesep 'compiled/'];
% This should be the folder where your consistently-named SST output live.
% This script assumed they are named with this format: "sub-203_ses-1_task-SST_run-1_beh.mat"
% This would be the 1st run for the 203rd subject.

% These two codes should reflect what's in the response column of the Seeker variable
% Scanner is usually 91 & 94; Behavioral (keyboard) is 197 & 198

leftButton=91;
rightButton=94;

% Change these
subList = [201 203 219]; % 108's didn't get saved?
runList = [1 2];
nRuns = length(runList);
nSubs = length(subList);

% Some versions of the SST set up the Seeker variable differently.
% The script should tell you which columns are which and what different
% codes mean, but you can also deduce it from looking at the actual output.
% Change these to reflect your Seeker variable structure.
% trialTypeColumn=3;
% arrowDirColumn=4;
% responseKeyColumn=7;
% goCode=0;
% stopCode=1;
% leftCode=0;
% rightCode=1;
trialTypeColumn=3;
arrowDirColumn=4;
responseKeyColumn=7;
goCode=0;
stopCode=1;
leftCode=0;
rightCode=1;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Initialize variables
weirdButtonCountMat=nan(max(subList),nRuns);
goCountMat=nan(max(subList),nRuns);
stopCountMat=nan(max(subList),nRuns);
NRCountMat=nan(max(subList),nRuns);
wrongGoCountMat=nan(max(subList),nRuns);

for s=subList
    
    % Create subjectCode
    if s<10
        placeholder = '00';
    elseif s<100
        placeholder = '0';
    else placeholder = '';
    end
    subjectCode = [studyCode placeholder num2str(s)];
    
    for r=runList
        filenames.out = [DIR.out filesep 'sub-' subjectCode(end-2:end) '_ses-1_task-' taskCode '_run-' num2str(r) '_beh.mat'];
        if ~exist(filenames.out)
        else
            load(filenames.out)
            
            trialType=Seeker(:,trialTypeColumn); % 0=Go, 1=NoGo, 2=null, 3=notrial
            arrowDir=Seeker(:,arrowDirColumn); % 0=left, 1=right, 2=null
            responseKey=Seeker(:,responseKeyColumn);
            numGoTrials = sum(trialType==goCode);
            numStopTrials = sum(trialType==stopCode);
            isGo = trialType==goCode;
            isCorrectButton = (arrowDir==leftCode&responseKey==leftButton)|(arrowDir==rightCode&responseKey==rightButton);
            numCorrectGoTrials = sum(isGo&isCorrectButton);
            numBadGoTrials = numGoTrials - numCorrectGoTrials;
            numNRTrials = sum(isGo&responseKey==0);
            weirdButtonTrials = ~(responseKey==0|responseKey==leftButton|responseKey==rightButton);
            
            wrongGoCountMat(s,r) = numBadGoTrials - numNRTrials;
            goCountMat(s,r) = numGoTrials;
            stopCountMat(s,r) = numStopTrials;
            NRCountMat(s,r) = numNRTrials;
            weirdButtonCountMat(s,r) = sum(weirdButtonTrials);
        end
    end
end

% I make a new directory for output each time I check my data, based on how
% many subjects I've run:
mkdir([DIR.compiled '/n' num2str(nSubs)])
% The output for this initial check goes here:
mkdir([DIR.compiled '/n' num2str(nSubs) '/initialCheck/']);
% For all the single-var texts, with an N x R matrix of that particular
% variable:
mkdir([DIR.compiled '/n' num2str(nSubs) '/singleVarTxts/']);
% For collapsing across runs, and getting output of the form N x V where
% V=number of variables you're looking at for each subject:
mkdir([DIR.compiled '/n' num2str(nSubs) '/collapsed/']);
% For .mat files containing all variables you might want to import at a
% later time (say, while collapsing):
mkdir([DIR.compiled '/n' num2str(nSubs) '/varMats/']);

dlmwrite([DIR.compiled '/n' num2str(nSubs) '/initialCheck/wrongGoCount.txt'],wrongGoCountMat,'delimiter','\t');
dlmwrite([DIR.compiled '/n' num2str(nSubs) '/initialCheck/goCount.txt'],goCountMat,'delimiter','\t');
dlmwrite([DIR.compiled '/n' num2str(nSubs) '/initialCheck/stopCount.txt'],stopCountMat,'delimiter','\t');
dlmwrite([DIR.compiled '/n' num2str(nSubs) '/initialCheck/NRCount.txt'],NRCountMat,'delimiter','\t');
dlmwrite([DIR.compiled '/n' num2str(nSubs) '/initialCheck/weirdButtonCount.txt'],weirdButtonCountMat,'delimiter','\t');
