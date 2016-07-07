const MINUTE_IN_MILLISECONDS = 1000 * 60;
const HOUR_IN_MILLISECONDS   = 1000 * 60 * 60;

exports.at = function(hours, minutes = 0) {
  let clock = {};
  let value = (hours * HOUR_IN_MILLISECONDS) + (minutes * MINUTE_IN_MILLISECONDS);

  clock.valueOf = () => {
    return value;
  };

  clock.toString = () => {
    let v = new Date(value);
    return `${pad(v.getHours())}:${pad(v.getMinutes())}`;
  };

  clock.plus = (minutes) => {
    value += minutes * MINUTE_IN_MILLISECONDS;
    return clock;
  };

  clock.minus = (minutes) => {
    value -= minutes * MINUTE_IN_MILLISECONDS;
    return clock;
  };

  clock.equals = (compareTo) => {
    return clock.toString() === compareTo.toString();
  };

  pad = (n) => {
    if (n > 9) { return n.toString(); }
    return `0${n.toString()}`;
  };

  return Object.create(clock);
};
