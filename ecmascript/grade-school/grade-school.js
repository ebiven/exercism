class School {
  constructor() {
    this._roster = {};
  }

  roster() {
    return JSON.parse(JSON.stringify(this._roster));
  }

  grade(grade) {
    return this.roster()[grade] || [];
  }

  add(student, grade) {
    if (!this._roster.hasOwnProperty(grade)) { this._roster[grade] = []; }
    this._roster[grade].push(student);
    this._roster[grade] = this._roster[grade].sort();
  }
}

export default School;