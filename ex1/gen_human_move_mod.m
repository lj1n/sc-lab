function [hmove, transm3] = gen_human_move_mod(lastComputerMove, transm2)
%GEN_HUMAN_MOVE_MOD Choose a move using the computer's past moves.
%   lastComputerMove is the computer's move in the last completed round.
%   Move codes are 1 = rock, 2 = paper, and 3 = scissors.
%
%   transm2(i,j) estimates the probability that the computer plays j
%   after playing i. For each row, we compute the expected score of
%   playing rock, paper, or scissors: P(win) - P(loss). A draw scores 0.
%
%   transm3(i,j) is the probability that the human strategy plays j
%   after the computer played i. Each row gives equal probability to
%   the moves tied for the highest expected score and zero to the rest.
%
%   hmove is the move chosen for this round. The function uses the row
%   for lastComputerMove and picks randomly if several moves tie.


rockScore     = transm2(:,3) - transm2(:,2);
paperScore    = transm2(:,1) - transm2(:,3);
scissorsScore = transm2(:,2) - transm2(:,1);
scores = [rockScore, paperScore, scissorsScore];

bestMoves = scores == max(scores, [], 2);
transm3 = bestMoves ./ sum(bestMoves, 2);

choices = find(bestMoves(lastComputerMove, :));
hmove = choices(randi(numel(choices)));
end
