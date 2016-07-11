const days = {
  "Sunday"    : 0,
  "Monday"    : 1,
  "Tuesday"   : 2,
  "Wednesday" : 3,
  "Thursday"  : 4,
  "Friday"    : 5,
  "Saturday"  : 6
};

function getMonthMap(year, month) {
  let out = {};
  let ldom = new Date(year, month + 1, 0).getDate();
  for (var x=1; x<=ldom; x++) {
    let dow = new Date(year, month, x).getDay();
    if (out[dow]) {
      out[dow].push(x);
    } else {
      out[dow] = [x];
    }
  }
  return out;
};

module.exports = function(year, month, day, schedule) {
  let d = getMonthMap(year, month)[days[day]];
  let dom = undefined;
  switch (schedule) {
    case '1st'    : dom = d[0]; break;
    case '2nd'    : dom = d[1]; break;
    case '3rd'    : dom = d[2]; break;
    case '4th'    : dom = d[3]; break;
    case '5th'    : dom = d[4]; break;
    case 'last'   : dom = d[d.length-1]; break;
    case 'teenth' : dom = d.find((i) => i > 12 && i < 20); break;
  }
  if (dom === undefined) { throw 'No dice'; }
  return new Date(year, month, dom);
};
