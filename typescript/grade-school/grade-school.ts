type Roster = Map<number, Set<string>>;

export default class School {
  private roster: Roster = new Map();

  private getGradeOrDefault(grade: number): Set<string> {
    return this.roster.get(grade) || new Set<string>();
  }

  studentRoster(): Map<string, string[]> {
    let output = new Map<string, string[]>();
    const keys = [...this.roster.keys()].sort();
    for (const k of keys) {
      const g = [...this.getGradeOrDefault(k)].sort();
      output.set(k.toString(), g);
    }
    return output;
  }

  studentsInGrade(grade: number): string[] {
    const g = this.getGradeOrDefault(grade);
    return [...g].sort();
  }

  addStudent(student: string, grade: number): void {
    let g = this.getGradeOrDefault(grade);
    g.add(student);
    this.roster.set(grade, g);
  }
}
