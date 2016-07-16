var Bowling = function(rolls) {
  this.rolls = rolls;
};

Bowling.prototype.validate = function() {
  for (let x=0; x<this.rolls.length; x++) {
    let roll = this.rolls[x];
    let next = (x+1 < this.rolls.length) ? this.rolls[x+1] : null;
    if (roll < 0 || roll > 10) { throw 'Pins must have a value from 0 to 10'; }
    if (roll == 10) {
      continue;
    } else {
      if (roll + next > 10) {
        throw 'Pin count exceeds pins on the lane';
      } else {
        x++;
      }
    }
  }

  let lenRolls = this.rolls.slice(0);
  let rl = this.rolls.length;
  let targetLen = 20;
  if (this.rolls[rl-3] == 10) {
    targetLen = targetLen + 2;
    lenRolls = lenRolls.slice(0, rl - 2);
  }
  if (this.rolls[rl-2] + this.rolls[rl-3] == 10) {
    targetLen++;
    lenRolls = lenRolls.slice(0, rl - 1);
  }
  lenRolls.forEach((roll) => {
    if (roll == 10) { targetLen--; }
  });
  if (this.rolls.length < targetLen) {
    throw 'Score cannot be taken until the end of the game';
  }
  if (this.rolls.length > targetLen) {
    throw 'Should not be able to roll after game is over';
  }
};

Bowling.prototype.score = function() {
  this.validate();
  let score = 0;
  for (let x=0; x<this.rolls.length; x++) {
    let roll = this.rolls[x];
    let next = (x+1 < this.rolls.length) ? this.rolls[x+1] : null;
    let following = (x+2 < this.rolls.length) ? this.rolls[x+2] : null;
    // Strike in the last frame.
    if (roll == 10 && x == this.rolls.length - 3) {
      score += 10 + next + following;
      x = 99; // We're done here.
    }
    // Strike.
    else if (roll == 10) {
      score += roll + next + following;
    }
    // Spare in the last frame.
    else if (roll + next == 10 && x == this.rolls.length - 3) {
      score += roll + next + following;
      x = 99; // We're done here.
    }
    // Spare.
    else if (roll + next == 10) {
      score += roll + next + following;
      x++;
    }
    // Everything else.
    else {
      score += roll + next;
      x++;
    }
  }

  return score;
};

module.exports = Bowling;
