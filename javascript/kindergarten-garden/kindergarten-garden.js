const Garden = function(layout, students = Garden.students) {
  const garden = layout.split('\n').map((row) => {
    return [...row].map((plant) => Garden.plants[plant]);
  });
  students = students.sort();
  let out = {};
  students.forEach((student, index) => {
    let gi = index * 2;
    plants = [garden[0][gi], garden[0][gi+1], garden[1][gi], garden[1][gi+1]]
    out[student.toLowerCase()] = plants;
  });
  return out;
};

Garden.plants = {
  G: 'grass',
  V: 'violets',
  R: 'radishes',
  C: 'clover'
};

Garden.students = [
  'Alice',
  'Bob',
  'Charlie',
  'David',
  'Eve',
  'Fred',
  'Ginny',
  'Harriet',
  'Ileana',
  'Joseph',
  'Kincaid',
  'Larry'
];

module.exports = Garden;
